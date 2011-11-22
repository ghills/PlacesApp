//
//  RecentPhotoManager.m
//  Places
//
//  Created by Gavin Hills on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RecentPhotoManager.h"

#define RECENT_PHOTO_KEY    @"recent_photos"
#define MAX_RECENT_PHOTOS   20

@implementation RecentPhotoManager

+ (void)AddRecentlyViewedPhoto:(NSDictionary *)photoInfo
{
    NSArray * recentPhotos;
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    if( userDefaults )
    {
        recentPhotos = [userDefaults objectForKey:RECENT_PHOTO_KEY];
    }
    
    if( recentPhotos )
    {
        recentPhotos = [recentPhotos arrayByAddingObject:photoInfo];
    }
    
    [userDefaults setObject:recentPhotos forKey:RECENT_PHOTO_KEY];
}

+ (NSArray *)GetRecentlyViewedPhotos
{
    NSArray * recentPhotos = [[NSArray alloc] initWithObjects:@"foo", nil];
    [recentPhotos autorelease];
    return recentPhotos;
}

@end
