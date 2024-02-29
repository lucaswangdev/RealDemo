#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Network.h"
#import "PopupView.h"
#import "RealAd.h"
#import "RealAdDelegate.h"
#import "RealAdViewController.h"
#import "RealDog.h"
#import "RealSDK.h"
#import "SplashAd.h"
#import "SplashAdDelegate.h"

FOUNDATION_EXPORT double RealSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char RealSDKVersionString[];

