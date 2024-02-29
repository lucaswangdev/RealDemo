//
//  SplashAd.h
//  RealSDK
//
//  Created by lucaswang on 2024/1/16.
//

// SplashAd.h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <RealSDK/SplashAdDelegate.h>


@interface SplashAd : NSObject
@property (nonatomic, weak) id<SplashAdDelegate> delegate;
- (instancetype)initWithAdId:(NSString *)adId;
- (void)loadAd;
- (void)showInWindow:(UIWindow *)window;
@end
