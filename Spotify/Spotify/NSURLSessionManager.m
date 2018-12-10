//
//  NSURLSessionManager.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/18.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "NSURLSessionManager.h"

@implementation NSURLSessionManager

+ (id)sharedManager {
    static NSURLSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NSURLSessionManager alloc] init];
    });
    return manager;
}

- (void)dataTaskWithSession:(NSURLSession *)session urlString:(NSString *)urlString  completionWithBlock:(void (^)(NSDictionary *, NSError *))block {
    [[session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            block(nil, error);
        } else {
            NSError *parseError;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
            if (parseError) {
                block(nil, parseError);
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(dict, nil);
                });
            }
        }
    }] resume];
}

@end
