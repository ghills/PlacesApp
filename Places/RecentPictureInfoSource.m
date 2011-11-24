//
//  RecentPictureInfoSource.m
//  Places
//
//  Created by Gavin Hills on 11/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RecentPictureInfoSource.h"
#import "RecentPhotoManager.h"

@implementation RecentPictureInfoSource

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSArray *)GetPictureInfoList
{
    return [RecentPhotoManager GetRecentlyViewedPhotos];
}

- (BOOL)PictureListNeedsUpdate
{
    return YES;
}

@end
