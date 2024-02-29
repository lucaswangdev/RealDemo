//
//  RealAd.h
//  RealSDK
//
//  Created by lucaswang on 2024/1/7.
//

#import <Foundation/Foundation.h>

@interface RealAd : NSObject

@property (strong, nonatomic) NSString *adImageUrl; // 广告图片URL
@property (strong, nonatomic) NSString *adLinkUrl;  // 广告点击链接

- (instancetype)initWithImageUrl:(NSString *)imageUrl linkUrl:(NSString *)linkUrl;

@end

