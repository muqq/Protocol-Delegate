//
//  ArtistViewController.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/18.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "ArtistViewController.h"
#import "SpotifyAPI.h"
#import "Artist.h"
#import "UIImageView+Utils.h"

@interface ArtistViewController () <SpotifyAPIDelegate>

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@end


@implementation ArtistViewController

- (void)viewDidLoad {
    SpotifyAPI *spotifyAPI = [SpotifyAPI sharedAPI];
    spotifyAPI.delegate = self;
}

- (IBAction)firstArtistTouchUpInside:(id)sender {
    [[SpotifyAPI sharedAPI] getArtistInfoWithId:@"2CIMQHirSU0MQqyYHq0eOx"];
}

- (IBAction)secondArtistTouchUpInside:(id)sender {
    [[SpotifyAPI sharedAPI] getArtistInfoWithId:@"57dN52uHvrHOxijzpIgu3E"];
}

- (IBAction)thirdArtistTouchUpInside:(id)sender {
    [[SpotifyAPI sharedAPI] getArtistInfoWithId:@"1vCWHaC5f2uS3yhpwWbIA6"];
}

#pragma mark - SpotifyAPI

- (void)spotifyAPI:(SpotifyAPI *)api didFailedWithError:(NSError *)error {
    NSLog(@"error with api: %@", error);
}

- (void)spotifyAPI:(SpotifyAPI *)api didGetArtistInfo:(Artist *)artist {
    self.name.text = artist.name;
    [self.avatar setImageWithURL:artist.imageURL];
}

@end
