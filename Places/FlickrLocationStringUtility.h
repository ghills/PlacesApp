//
//  FlickrLocationStringUtility.h
//  Places
//
//  Created by Gavin Hills on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrLocationStringUtility : NSObject

+ (NSString *)LocationCityNameFromString:(NSString *)location;

+ (NSString *)LocationStateCountryFromString:(NSString *)location;

@end
