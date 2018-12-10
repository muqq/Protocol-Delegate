//
//  SpotifyAPI.m
//  Spotify
//
//  Created by QQ Shih on 2017/4/17.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "SpotifyAPI.h"
#import "User.h"
#import "Artist.h"
#import "Constants.h"
#import "NSURLSessionManager.h"

@implementation SpotifyAPI

static const NSString *apiURL = @"https://api.spotify.com/";
static const NSString *apiVersion = @"v1/";
static const NSString *kHeaderAuthKey = @"Authorization";
static const NSString *kHeaderAuth = @"Bearer BQCF0otWc4ivmwKpT-PpI-LZolTKK7H-RuzpFTdKSyK5tIhZbKymr8iAGMTjQQj2hngqmfcChn4XIKKoB3nIpm5s4Bi1Z48tmX5h8LKelUMXpYqJKW8rf0EVOtoQtBKDK7-MeO0DZ75KT2p1nWniZJ6hPK4qYGvnZ0jYVwppLB-5EoUnxNzsVZJY40X61GcUozdb03owKjxcD7eMexn24QIcEGr6uIWgUSZ3CxgZZk6Efy1NzL-oK4mdfym83SnfLV00--tGq1vrSHN7SbDwYszk_5-4U2ZFM7GOxzaBaBI1R8mJd5rt";

+ (id)sharedAPI {
    static SpotifyAPI *spotifyAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        spotifyAPI = [[SpotifyAPI alloc] init];
    });
    return spotifyAPI;
}

- (void)getUserInfoWithId:(NSString *)userId withBlock:(void (^)(User *user, NSError *error))block {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@users/%@", apiURL, apiVersion, userId];
    
    [[NSURLSessionManager sharedManager] dataTaskWithSession:[NSURLSession sharedSession] urlString:urlString completionWithBlock:^(NSDictionary *responseDict, NSError *error) {
        if (error) {
            block(nil, error);
        } else {
            User *user = [[User alloc] initWithDictionary:responseDict];
            block(user, nil);
        }
    }];
}

- (void)updateCurrentUser {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    configuration.HTTPAdditionalHeaders = @{kHeaderAuthKey: kHeaderAuth};
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@me", apiURL, apiVersion];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    [[NSURLSessionManager sharedManager] dataTaskWithSession:session urlString:urlString completionWithBlock:^(NSDictionary *responseDict, NSError *error) {
        if (error) {
            NSLog(@"error: %@", error);
        } else {
            User *user = [[User alloc] initWithDictionary:responseDict];
            self.currentUser = user;
            [[NSNotificationCenter defaultCenter] postNotificationName:kUpdateMeNotificationName object:nil userInfo:@{kUpdateMeInfoUserKey: user}];
        }
    }];
}

- (void)getArtistInfoWithId:(NSString *)artistId {
    NSString *urlString = [NSString stringWithFormat:@"%@%@artists/%@", apiURL, apiVersion, artistId];
    
    [[NSURLSessionManager sharedManager] dataTaskWithSession:[NSURLSession sharedSession] urlString:urlString completionWithBlock:^(NSDictionary *responseDict, NSError *error) {
        if (error) {
            [self.delegate spotifyAPI:self didFailedWithError:error];
        } else {
            Artist *artist = [[Artist alloc] initWithDictionary:responseDict];
            [self.delegate spotifyAPI:self didGetArtistInfo:artist];
        }
    }];
}

@end
