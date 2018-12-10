//
//  User.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/18.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
        self.name = dict[@"display_name"];
    }
    return self;
}

@end
