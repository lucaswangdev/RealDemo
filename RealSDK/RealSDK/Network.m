//
//  Network.m
//  RealSDK
//
//  Created by lucaswang on 2024/1/24.
//

#import "Network.h"

@implementation Network

+ (void)sendRequestWithMethod:(HTTPMethod)method endpoint:(NSString *)endpoint parameters:(NSDictionary *)parameters success:(NetworkSuccess)success failure:(NetworkFailure)failure {
    NSString *baseUrl = @"http://localhost:4000/api";
    NSString *urlString = [baseUrl stringByAppendingPathComponent:endpoint];

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

    if (method == HTTPMethodPOST && parameters) {
        NSError *error;
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(error);
            });
            return;
        }
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }

    request.timeoutInterval = 30; // 30秒超时

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Network Error: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(error);
            });
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                NSLog(@"Data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                NSError *jsonError;
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                if (jsonError) {
                    NSLog(@"JSON Error: %@", jsonError);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        failure(jsonError);
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        success(json);
                    });
                }
            } else {
                NSLog(@"HTTP Error: %ld", (long)httpResponse.statusCode);
                NSError *statusError = [NSError errorWithDomain:@"NetworkError" code:httpResponse.statusCode userInfo:nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(statusError);
                });
            }
        }
    }];
    [task resume];

}

@end

