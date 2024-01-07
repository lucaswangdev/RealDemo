//
//  RealAd.m
//  RealSDK
//
//  Created by lucaswang on 2024/1/7.
//

#import <Foundation/Foundation.h>
#import "RealAd.h"

@implementation RealAd

- (instancetype)initWithImageUrl:(NSString *)imageUrl linkUrl:(NSString *)linkUrl {
    self = [super init];
    if (self) {
        _adImageUrl = imageUrl;
        _adLinkUrl = linkUrl;
    }
    return self;
}

@end
