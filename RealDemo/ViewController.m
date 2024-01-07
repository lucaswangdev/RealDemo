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
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 创建并配置 UILabel
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Hello World";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [label.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
    // 展示广告
    [self showAd];
}


- (void)showAd {
    RealAdViewController *adVC = [[RealAdViewController alloc] init];
    adVC.delegate = self;
    [self presentViewController:adVC animated:YES completion:nil];
}

#pragma mark - RealAdDelegate


- (void)adDidFinish {
    // 广告显示结束后的逻辑
    // 在这里，您可能不需要做任何事情，因为您已经在 ViewController 中
    // 如果需要更新界面或执行其他操作，可以在这里添加代码
}

@end
