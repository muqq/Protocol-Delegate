//
//  SecondViewController.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/17.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MeViewController.h"
#import "SpotifyAPI.h"
#import "Constants.h"
#import "User.h"
#import "UIImageView+Utils.h"

@interface MeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateUserData: [[SpotifyAPI sharedAPI] currentUser]];
    __weak typeof(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:kUpdateMeNotificationName object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        User *user = note.userInfo[kUpdateMeInfoUserKey];
        if (user) {
            [weakSelf updateUserData:user];
        }
    }];
}

- (void)updateUserData:(User *)user {
    self.name.text = user.name;
    [self.avatar setImageWithURL:user.imageURL];
}

@end
