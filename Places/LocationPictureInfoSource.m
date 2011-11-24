//
//  LocationPictureInfoSource.m
//  Places
//
//  Created by Gavin Hills on 11/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocationPictureInfoSource.h"
#import "FlickrFetcher.h"

#define TIMEOUT_IN_SEC  60

@implementation LocationPictureInfoSource

@synthesize flickrPlaceId;
@synthesize lastFetchTimestamp;

- (id)init
{
    self = [super init];
    if (self) {
        self.lastFetchTimestamp = [NSDate distantPast];
    }
    
    return self;
}

- (NSArray *)GetPictureInfoList
{
    self.lastFetchTimestamp = [NSDate date];
    return [FlickrFetcher photosAtPlace:self.flickrPlaceId];
}

- (BOOL)PictureListNeedsUpdate
{
    return ( [lastFetchTimestamp timeIntervalSinceNow] > TIMEOUT_IN_SEC );
}

- (void)dealloc
{
    self.flickrPlaceId = nil;
    self.lastFetchTimestamp = nil;
    
    [super dealloc];
    
}

@end
