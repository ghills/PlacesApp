//
//  LocationPictureInfoSource.h
//  Places
//
//  Created by Gavin Hills on 11/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrPictureInfoSource.h"

@interface LocationPictureInfoSource : NSObject <FlickrPictureInfoSource>
{
    NSString * flickrPlaceId;
    NSDate * lastFetchTimestamp;
}

@property (retain) NSString * flickrPlaceId;
@property (retain) NSDate * lastFetchTimestamp;

@end
