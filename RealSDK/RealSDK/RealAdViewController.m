//
//  RealAdViewController.m
//  RealSDK
//
//  Created by lucaswang on 2024/1/7.
//

#import <Foundation/Foundation.h>
#import "RealAdViewController.h"

@interface RealAdViewController ()

@property (strong, nonatomic) UILabel *countdownLabel;
@property (strong, nonatomic) NSTimer *countdownTimer;
@property (nonatomic) NSInteger remainingSeconds;

@end

@implementation RealAdViewController

- (instancetype)initWithAd:(RealAd *)ad {
    self = [super init];
    if (self) {
        _ad = ad;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupAdView];
    self.view.backgroundColor = [UIColor whiteColor];  // 设置背景颜色为白色
    [self setupTextView];
    
//      [super viewDidLoad];
//       self.view.backgroundColor = [UIColor redColor];
       [self setupCountdownLabel];
       
       self.remainingSeconds = 5;
       self.countdownLabel.text = [NSString stringWithFormat:@"%ld", (long)self.remainingSeconds];
       
       self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                              target:self
                                                            selector:@selector(updateCountdown)
                                                            userInfo:nil
                                                             repeats:YES];
}

- (void)setupAdView {
    // 创建展示广告的UIImageView
    UIImageView *adImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    adImageView.contentMode = UIViewContentModeScaleAspectFill;
    adImageView.clipsToBounds = YES;

    // 加载图片（这里只是示例，实际中你可能需要异步加载网络图片）
    UIImage *adImage = [UIImage imageNamed:self.ad.adImageUrl];
    adImageView.image = adImage;

    [self.view addSubview:adImageView];

    // 添加点击事件
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adTapped)];
    [adImageView setUserInteractionEnabled:YES];
    [adImageView addGestureRecognizer:tapGesture];
}

- (void)adTapped {
    // 处理广告点击事件，比如打开链接
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.ad.adLinkUrl] options:@{} completionHandler:nil];
}

- (void)setupTextView {
    // 创建文本标签
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"开屏广告文案内容";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:24];

    [self.view addSubview:label];
}

- (void)setupCountdownLabel {
    // 初始化并设置倒计时标签
    self.countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 20, 80, 40)];
    self.countdownLabel.textAlignment = NSTextAlignmentCenter;
    self.countdownLabel.backgroundColor = [UIColor lightGrayColor];
    self.countdownLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.countdownLabel];
}

- (void)updateCountdown {
    self.remainingSeconds -= 1;
    self.countdownLabel.text = [NSString stringWithFormat:@"%ld", (long)self.remainingSeconds];
    
    if (self.remainingSeconds <= 0) {
        [self.countdownTimer invalidate];
        self.countdownTimer = nil;
        [self dismissViewControllerAnimated:YES completion:nil];
        if ([self.delegate respondsToSelector:@selector(adDidFinish)]) {
            [self.delegate adDidFinish];
        }
    }
}

@end
