//
//  AppDelegate.m
//  RealDemo
//
//  Created by lucaswang on 2024/1/7.
//

#import "AppDelegate.h"
//#import <RealSDK/RealAd.h>
//#import <RealSDK/RealAdViewController.h>
#import <RealSDK/SplashViewController.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // 其他初始化代码
//    // [self.window makeKeyAndVisible];
//    
//    RealAd *ad = [[RealAd alloc] initWithImageUrl:@"adImage.png" linkUrl:@"http://www.baidu.com"];
//    RealAdViewController *adViewController = [[RealAdViewController alloc] initWithAd:ad];
//
//    [self.window.rootViewController presentViewController:adViewController animated:YES completion:nil];
    
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

     SplashViewController *splashVC = [[SplashViewController alloc] init];
     self.window.rootViewController = splashVC;

     [self.window makeKeyAndVisible];

    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
