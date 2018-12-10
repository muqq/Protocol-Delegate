//
//  User.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/17.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        NSDictionary *firstImageInfo = [(NSArray *)dict[@"images"] firstObject];
        if (firstImageInfo) {
            self.imageURL = [NSURL URLWithString:firstImageInfo[@"url"]];
        }
    }
    return self;
}

@end
