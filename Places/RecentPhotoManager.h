//
//  RecentPhotoManager.h
//  Places
//
//  Created by Gavin Hills on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentPhotoManager : NSObject

+ (void)AddRecentlyViewedPhoto:(NSDictionary *)photoInfo;

+ (NSArray *)GetRecentlyViewedPhotos;

@end
