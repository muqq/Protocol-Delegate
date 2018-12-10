//
//  ViewController.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/17.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "UserViewController.h"
#import "SpotifyAPI.h"
#import "User.h"
#import "UIImageView+Utils.h"

@interface UserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SpotifyAPI sharedAPI] getUserInfoWithId:@"11124840658" withBlock:^(User *user, NSError *error) {
        if (!error) {
            self.name.text = user.name;
            [self.avatar setImageWithURL:user.imageURL];
        }
    }];
}

@end
