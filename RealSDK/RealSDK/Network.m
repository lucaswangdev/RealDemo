//
//  Network.m
//  RealSDK
//
//  Created by lucaswang on 2024/1/24.
//

#import "Network.h"
#import <AdSupport/AdSupport.h>

@implementation Network

+ (void)sendRequestWithMethod:(HTTPMethod)method endpoint:(NSString *)endpoint parameters:(NSDictionary *)parameters success:(NetworkSuccess)success failure:(NetworkFailure)failure {
    // 基础 URL
    NSString *baseUrl = @"http://localhost:4000/api";
    NSString *urlString = [baseUrl stringByAppendingPathComponent:endpoint];

    // 如果是GET请求，将参数拼接到URL上
    if (method == HTTPMethodGET && parameters) {
        NSMutableArray *queryItems = [NSMutableArray array];
        for (NSString *key in parameters) {
            NSString *value = [parameters[key] description];
            NSString *queryItem = [NSString stringWithFormat:@"%@=%@", key, [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
            [queryItems addObject:queryItem];
        }
        NSString *queryString = [queryItems componentsJoinedByString:@"&"];
        urlString = [urlString stringByAppendingFormat:@"?%@", queryString];
    }

    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = (method == HTTPMethodGET) ? @"GET" : @"POST";

    // 对于POST请求，将参数设置为请求体
    if (method == HTTPMethodPOST && parameters) {
        NSError *error;
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
        if (error && failure) {
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(error);
            });
            return;
        }
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }

    // 设置请求超时时间
    request.timeoutInterval = 30; // 30秒超时

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(error);
                });
            }
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                NSError *jsonError;
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                if (jsonError) {
                    if (failure) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            failure(jsonError);
                        });
                    }
                } else {
                    if (success) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            success(json);
                        });
                    }
                }
            } else {
                NSError *statusError = [NSError errorWithDomain:@"NetworkError" code:httpResponse.statusCode userInfo:nil];
                if (failure) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        failure(statusError);
                    });
                }
            }
        }
    }];
    [task resume];
}

@end
