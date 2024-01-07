//
//  RealAdViewController.h
//  RealSDK
//
//  Created by lucaswang on 2024/1/7.
//

#import <UIKit/UIKit.h>
#import <RealSDK/RealAd.h>
#import <RealSDK/RealAdDelegate.h>  // 导入代理协议

@interface RealAdViewController : UIViewController

@property (strong, nonatomic) RealAd *ad;

@property (weak, nonatomic) id<RealAdDelegate> delegate;


- (instancetype)initWithAd:(RealAd *)ad;

@end
