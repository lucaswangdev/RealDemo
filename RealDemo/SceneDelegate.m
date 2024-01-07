//
//  SceneDelegate.m
//  RealDemo
//
//  Created by lucaswang on 2024/1/7.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import <RealSDK/RealAd.h>
#import <RealSDK/RealAdViewController.h>

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
//    UIWindowScene *windowScene = (UIWindowScene *)scene;
//       self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
//       self.window.frame = windowScene.coordinateSpace.bounds;
//
//       // 创建和展示广告
//       RealAd *ad = [[RealAd alloc] initWithImageUrl:@"https://en.wikipedia.org/wiki/Image#/media/File:Image_created_with_a_mobile_phone.png" linkUrl:@"http://www.baidu.com"];
//       RealAdViewController *adViewController = [[RealAdViewController alloc] initWithAd:ad];
//       self.window.rootViewController = adViewController;
//
//       [self.window makeKeyAndVisible];
    
    
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        self.window.frame = windowScene.coordinateSpace.bounds;

        // 设置 ViewController 为根视图控制器
        ViewController *rootViewController = [[ViewController alloc] init];
        self.window.rootViewController = rootViewController;
        [self.window makeKeyAndVisible];

        // 可以在 ViewController 的适当位置展示广告
        // 例如，在 ViewController 的 viewDidLoad 中调用 showAd 方法
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
