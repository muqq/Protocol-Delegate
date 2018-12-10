//
//  SpotifyAPI.h
//  Spotify
//
//  Created by QQ Shih on 2017/4/17.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpotifyAPI;
@class Artist;
@class User;

@protocol SpotifyAPIDelegate <NSObject>

- (void)spotifyAPI:(SpotifyAPI *)api didGetArtistInfo:(Artist *)artist;
- (void)spotifyAPI:(SpotifyAPI *)api didFailedWithError:(NSError *)error;

@end

@interface SpotifyAPI : NSObject

@property (nonatomic) User *currentUser;
@property (nonatomic, weak) id<SpotifyAPIDelegate> delegate;

+ (id)sharedAPI;

- (void)getUserInfoWithId:(NSString *)userId withBlock:(void (^)(User *user, NSError *error))block;

- (void)updateCurrentUser;

- (void)getArtistInfoWithId:(NSString *)artistId;

@end
