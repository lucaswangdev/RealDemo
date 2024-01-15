//
//  SplashViewController.h
//  RealSDK
//
//  Created by lucaswang on 2024/1/16.
//

// SplashViewController.h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <RealSDK/SplashAd.h>


@interface SplashViewController : UIViewController <SplashAdDelegate>

@property (strong, nonatomic) SplashAd *splashAd;

@end

