//
//  SplashViewController.m
//  RealSDK
//
//  Created by lucaswang on 2024/1/16.
//

#import <Foundation/Foundation.h>
// SplashViewController.m
#import "SplashViewController.h"

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建并设置 SplashAd
    self.splashAd = [[SplashAd alloc] initWithAdId:@"your_ad_id"];
    self.splashAd.delegate = self;

    // 加载并展示广告
    [self.splashAd loadAd];
}

#pragma mark - SplashAdDelegate Methods

- (void)splashAdSuccessPresentScreen {
    NSLog(@"Splash Ad Success Present Screen");
    [self.splashAd showInWindow:self.view.window];
}

- (void)splashAdFailToPresentWithError:(NSError *)error {
    NSLog(@"Splash Ad Failed To Present: %@", error.localizedDescription);
    // 这里可以关闭 SplashViewController 或进行其他操作
}

- (void)splashAdClicked {
    NSLog(@"Splash Ad Clicked");
}

- (void)splashAdClosed {
    NSLog(@"Splash Ad Closed");
    // 这里可以移除 SplashViewController 或进入下一个视图控制器
}

@end
