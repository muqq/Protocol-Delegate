//
//  NSURLSessionManager.h
//  Spotify
//
//  Created by QQ Shih on 2017/4/18.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSessionManager : NSObject

+ (id)sharedManager;

- (void)dataTaskWithSession:(NSURLSession *)session urlString:(NSString *)urlString  completionWithBlock:(void(^)(NSDictionary *responseDict, NSError *error))block;

@end
