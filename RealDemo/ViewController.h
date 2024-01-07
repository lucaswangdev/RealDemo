//
//  ViewController.h
//  RealDemo
//
//  Created by lucaswang on 2024/1/7.
//

#import <UIKit/UIKit.h>
#import <RealSDK/RealAdDelegate.h>  // 确保导入 RealAdDelegate

@interface ViewController : UIViewController <RealAdDelegate>

- (void)showAd;  // 声明展示广告的方法

@end

