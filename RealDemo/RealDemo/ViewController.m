#import "ViewController.h"
#import <RealSDK/RealDog.h>
#import <RealSDK/RealAdDelegate.h>
#import <RealSDK/RealAdViewController.h>
#import <RealSDK/PopupView.h>
#import <RealSDK/SplashAd.h>
#import <RealSDK/Network.h>


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
    
    // 获取设备的 IDFA
    NSString *idfaString = @"xxxxidf";

    // 请求参数
    NSDictionary *parameters = @{
        @"id": @"123",
        @"token": idfaString
    };
//    // 获取图片广告数据
//    [Network sendRequestWithMethod:HTTPMethodGET endpoint:@"/users/userId" parameters:parameters success:^(NSDictionary *response) {
//        // 处理图片广告数据
//        NSLog(@"Response: %@", response);
//        
//        NSString *name = response[@"name"];
//        BOOL success = [response[@"success"] boolValue];
//        
//        NSLog(@"Name: %@", name);
//        NSLog(@"Success: %@", success ? @"YES" : @"NO");
//    } failure:^(NSError *error) {
//        // 处理错误
//        NSLog(@"Error: %@", error.localizedDescription);
//    }];
    
//    // 获取图片广告数据
//    [Network sendRequestWithMethod:HTTPMethodPOST endpoint:@"/users/userId2" parameters:parameters success:^(NSDictionary *response) {
//        // 处理图片广告数据
//        NSLog(@"Response: %@", response);
//        
//        NSString *name = response[@"name"];
//        BOOL success = [response[@"success"] boolValue];
//        
//        NSLog(@"Name: %@", name);
//        NSLog(@"Success: %@", success ? @"YES" : @"NO");
//    } failure:^(NSError *error) {
//        // 处理错误
//        NSLog(@"Error: %@", error.localizedDescription);
//    }];
    
    dispatch_group_t group = dispatch_group_create();

    __block NSDictionary *firstResponse;
    __block BOOL shouldPerformSecondRequest = NO;

    NSLog(@"Starting first request");
    dispatch_group_enter(group);
    [Network sendRequestWithMethod:HTTPMethodGET endpoint:@"/users/userId" parameters:nil success:^(NSDictionary *response) {
        firstResponse = response;
        NSLog(@"First Response: %@", response);

         // 判断是否满足执行第二个请求的条件
//        if (/* 条件判断，例如检查 response 中的某个值 */) {
//            shouldPerformSecondRequest = YES;
//        }
        shouldPerformSecondRequest = YES;
        dispatch_group_leave(group);
    } failure:^(NSError *error) {
        NSLog(@"First request error: %@", error);
        dispatch_group_leave(group);
    }];

    // 当第一个请求完成后执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (shouldPerformSecondRequest) {
            NSLog(@"Condition met, starting second request");
            [Network sendRequestWithMethod:HTTPMethodPOST endpoint:@"/users/userId2" parameters:firstResponse success:^(NSDictionary *secondResponse) {
                // 处理第二个请求的响应
                NSLog(@"Second Response: %@", secondResponse);
            } failure:^(NSError *error) {
                // 处理第二个请求的错误
                NSLog(@"Second request error: %@", error);
            }];
        } else {
            NSLog(@"Condition not met, skipping second request");
        }

        NSLog(@"All requests completed");
        // 这里处理所有请求完成后的逻辑
    });


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
