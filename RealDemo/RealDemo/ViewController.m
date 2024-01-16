#import "ViewController.h"
#import <RealSDK/RealDog.h>
#import <RealSDK/RealAdDelegate.h>
#import <RealSDK/RealAdViewController.h>
#import <RealSDK/PopupView.h>
#import <RealSDK/SplashAd.h>


@interface ViewController () <SplashAdDelegate>

@property (strong, nonatomic) PopupView *popupView;
@property (strong, nonatomic) UIButton *showPopupButton;
@property (strong, nonatomic) SplashAd *splashAd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [RealDog eat];
//    self.shouldShowAd = YES;  // 初始时设置为 YES

    
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
    
    // 创建显示弹窗的按钮
    UIButton *showPopupButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [showPopupButton setTitle:@"打开弹窗" forState:UIControlStateNormal];
    [showPopupButton addTarget:self action:@selector(showPopup) forControlEvents:UIControlEventTouchUpInside];
    showPopupButton.frame = CGRectMake(100, 100, 160, 50); // 设置位置和大小
    [self.view addSubview:showPopupButton];

    // 初始化 PopupView
    self.popupView = [[PopupView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.popupView];
    // 初始化时隐藏 PopupView
    [self.popupView hidePopupView];
    
    
    // 创建splashAd实例，展示广告，设置代理
    self.splashAd = [[SplashAd alloc] initWithAdId:@"your_ad_id"];
    self.splashAd.delegate = self;
    // 获取当前的UIWindow
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    // 展示广告
    [self.splashAd showInWindow:currentWindow];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 展示广告
    //    [self showAd];
//    if (self.shouldShowAd) {
//          [self showAd];
//          self.shouldShowAd = NO;  // 展示一次广告后设置为 NO
//    }
}

- (void)showPopup {
    [self.popupView showPopupView];  // 展示 PopupView
}

- (void)hidePopup {
    [self.popupView hidePopupView];  // 隐藏 PopupView
}

//- (void)showAd {
//    RealAdViewController *adVC = [[RealAdViewController alloc] init];
//    adVC.delegate = self;
//    adVC.modalPresentationStyle = UIModalPresentationFullScreen; // 设置为全屏展示
//    [self presentViewController:adVC animated:YES completion:nil];
//}

#pragma mark - RealAdDelegate


#pragma mark - SplashAdDelegate Methods

- (void)splashAdSuccessPresentScreen {
    NSLog(@"Splash Ad Successfully Presented on Screen");
}

- (void)splashAdFailToPresentWithError:(NSError *)error {
    NSLog(@"Splash Ad Failed to Present: %@", error.localizedDescription);
}

- (void)splashAdClicked {
    NSLog(@"Splash Ad Clicked");
}

- (void)splashAdClosed {
    NSLog(@"Splash Ad Closed");
}

// ... 实现其他代理方法 ...

@end
