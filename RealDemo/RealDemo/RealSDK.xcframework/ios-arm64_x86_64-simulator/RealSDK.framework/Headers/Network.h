//
//  Network.h
//  RealSDK
//
//  Created by lucaswang on 2024/1/24.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HTTPMethod) {
    HTTPMethodGET,
    HTTPMethodPOST
};

typedef void(^NetworkSuccess)(NSDictionary *response);
typedef void(^NetworkFailure)(NSError *error);

@interface Network : NSObject

+ (void)sendRequestWithMethod:(HTTPMethod)method endpoint:(NSString *)endpoint parameters:(NSDictionary *)parameters success:(NetworkSuccess)success failure:(NetworkFailure)failure;

@end
