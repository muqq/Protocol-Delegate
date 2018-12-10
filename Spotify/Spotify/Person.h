//
//  User.h
//  Spotify
//
//  Created by QQ Shih on 2017/4/17.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
