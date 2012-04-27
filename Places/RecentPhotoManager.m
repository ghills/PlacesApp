//
//  RecentPhotoManager.m
//  Places
//
//  Created by Gavin Hills on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RecentPhotoManager.h"

#define RECENT_PHOTO_KEY    @"recent_photo_list"
#define TIMESTAMP_ATTR  @"viewedTimestamp"
#define MAX_RECENT_PHOTOS   10

@implementation RecentPhotoManager

+ (void)AddRecentlyViewedPhoto:(NSDictionary *)photoInfo
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray * recentPhotoArray = [userDefaults objectForKey:RECENT_PHOTO_KEY];
    if( recentPhotoArray )
    {
        NSMutableArray * recentPhotoArrayChangable = [NSMutableArray arrayWithArray:recentPhotoArray];
        
        NSUInteger indexOfExistingPicture = [recentPhotoArrayChangable indexOfObject:photoInfo];
        if( indexOfExistingPicture != NSNotFound )
        {
            // This exact picture already exists in the recent list, so remove it first
            [recentPhotoArrayChangable removeObjectAtIndex:indexOfExistingPicture];
        }
        
        // Now insert this picture at the start of the array. Most recent first.
        [recentPhotoArrayChangable insertObject:photoInfo atIndex:0];
        
        recentPhotoArray = [NSArray arrayWithArray:recentPhotoArrayChangable];
    }
    else
    {
        // First picture being added! Create array with this photo.
        recentPhotoArray = [NSArray arrayWithObject:photoInfo];
    }
    
    // check if recent photo list is too large, chop off the end if needed
    if( recentPhotoArray.count > MAX_RECENT_PHOTOS )
    {
        recentPhotoArray = [recentPhotoArray subarrayWithRange:NSMakeRange(0, 10)];
    }
    
    [userDefaults setObject:recentPhotoArray forKey:RECENT_PHOTO_KEY];
}

+ (NSArray *)GetRecentlyViewedPhotos
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:RECENT_PHOTO_KEY];
}

@end
