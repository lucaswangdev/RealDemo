//
//  SplashAdDelegate.h
//  RealSDK
//
//  Created by lucaswang on 2024/1/16.
//

// SplashAdDelegate.h
#import <Foundation/Foundation.h>

@protocol SplashAdDelegate <NSObject>
@optional
- (void)splashAdSuccessPresentScreen;
- (void)splashAdFailToPresentWithError:(NSError *)error;
- (void)splashAdClicked;
- (void)splashAdClosed;
@end
