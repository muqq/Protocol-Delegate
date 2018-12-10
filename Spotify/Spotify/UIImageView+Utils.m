//
//  UIImageView+Utils.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/17.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "UIImageView+Utils.h"

@implementation UIImageView (Utils)

- (void)setImageWithURL:(NSURL *)url {
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return;
        }
        
        if (data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = [UIImage imageWithData:data];
            });
        }
    }] resume];
}

@end
