//
//  Artist.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/18.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
        self.name = dict[@"name"];
    }
    return self;
}

@end
