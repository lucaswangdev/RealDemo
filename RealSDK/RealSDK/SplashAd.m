//
//  SplashAd.m
//  RealSDK
//
//  Created by lucaswang on 2024/1/16.
//

#import <Foundation/Foundation.h>
// SplashAd.m
#import "SplashAd.h"

@implementation SplashAd

- (instancetype)initWithAdId:(NSString *)adId {
    self = [super init];
    if (self) {
        // Initialize with adId
    }
    return self;
}

- (void)loadAd {
    // Load ad data
    NSLog(@"Loading ad");
    // You can simulate ad loading with a delay and then call the delegate method
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(splashAdSuccessPresentScreen)]) {
            [self.delegate splashAdSuccessPresentScreen];
        }
    });
}

- (void)showInWindow:(UIWindow *)window {
    NSLog(@"Showing ad in window");
    // Display the ad in the window, and then call the delegate method
    // Simulate ad display and auto close
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(splashAdClosed)]) {
            [self.delegate splashAdClosed];
        }
    });
}

@end
