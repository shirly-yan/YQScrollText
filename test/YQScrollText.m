

#import "YQScrollText.h"

#define kPadding 1
#define kLabelMargin 10

@interface YQScrollText ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UILabel *assistLabel;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) CGFloat textWidth;

@end

@implementation YQScrollText

- (void)layoutSubviews {
    [super layoutSubviews];
    [self configSubView];
}
- (UIFont *)textFont {
    if (!_textFont) {
        _textFont = [UIFont systemFontOfSize:19];
    }
    return _textFont;
}
- (void)configSubView {
    
    self.textWidth = [self widthOfString:self.text andFont:self.textFont];
    if (self.textWidth <= self.frame.size.width) {
        self.textLabel = [[UILabel alloc]initWithFrame:self.bounds];
        [self addSubview:self.textLabel];
        self.textLabel.font = self.textFont;
        self.textLabel.textColor = self.textColor;
        self.textLabel.text = self.text;
    }else{
        self.userInteractionEnabled = NO;
        self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        [self addSubview:self.scrollView];
        self.scrollView.contentSize = CGSizeMake(self.textWidth*2+kLabelMargin, self.frame.size.height);
        
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.textWidth, self.frame.size.height)];
        [self.scrollView addSubview:self.textLabel];
        self.textLabel.font = self.textFont;
        self.textLabel.textColor = self.textColor;
        self.textLabel.text = self.text;
        
        self.assistLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.textWidth+kLabelMargin, 0, self.textWidth, self.frame.size.height)];
        [self.scrollView addSubview:self.assistLabel];
        self.assistLabel.font = self.textFont;
        self.assistLabel.textColor = self.textColor;
        self.assistLabel.text = self.text;
        
        [self addTimer];
    }
}
- (void)addTimer {
    self.timer =
    [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer * _Nonnull timer) {
        CGFloat x = self.scrollView.contentOffset.x;
        x += kPadding;
        if (x <= (self.textWidth+kLabelMargin) && x + kPadding >= (self.textWidth+kLabelMargin)) {
            x = 0;
        }
        [self.scrollView setContentOffset:CGPointMake(x, 0) animated:NO];
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  计算一行字符串的宽度
 *
 *  @param string 要计算的字符串
 *  @param font   字符串的字体
 *
 *  @return 字符串的宽度
 */
- (CGFloat)widthOfString:(NSString *)string andFont:(UIFont *)font {
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    return size.width;
}
- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}


@end
