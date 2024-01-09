#import "ViewController.h"
#import <RealSDK/RealDog.h>
#import <RealSDK/RealAdDelegate.h>
#import <RealSDK/RealAdViewController.h>

@interface ViewController () <RealAdDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [RealDog eat];
    self.shouldShowAd = YES;  // 初始时设置为 YES

    
    self.view.backgroundColor = [UIColor whiteColor];
    // 创建并配置 UILabel
    UILabel *label = [[UILabel alloc] init];
    label.text = @"首页";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [label.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 展示广告
    //    [self showAd];
    if (self.shouldShowAd) {
          [self showAd];
          self.shouldShowAd = NO;  // 展示一次广告后设置为 NO
    }
}


- (void)showAd {
    RealAdViewController *adVC = [[RealAdViewController alloc] init];
    adVC.delegate = self;
    adVC.modalPresentationStyle = UIModalPresentationFullScreen; // 设置为全屏展示
    [self presentViewController:adVC animated:YES completion:nil];
}

#pragma mark - RealAdDelegate


- (void)adDidFinish {
    // 广告显示结束后的逻辑
    // 在这里，您可能不需要做任何事情，因为您已经在 ViewController 中
    // 如果需要更新界面或执行其他操作，可以在这里添加代码
    NSLog(@"adDidFinish");
}

@end
