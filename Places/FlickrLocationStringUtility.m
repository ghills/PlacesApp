//
//  FlickrLocationStringUtility.m
//  Places
//
//  Created by Gavin Hills on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlickrLocationStringUtility.h"

@implementation FlickrLocationStringUtility

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (NSString *)LocationCityNameFromString:(NSString *)location
{
    NSArray * placeInfoComponents = [location componentsSeparatedByString:@", "];
    
    return [placeInfoComponents objectAtIndex:0];
}

+ (NSString *)LocationStateCountryFromString:(NSString *)location
{
    NSArray * placeInfoComponents = [location componentsSeparatedByString:@", "];
    
    return [[placeInfoComponents subarrayWithRange:NSMakeRange(1, placeInfoComponents.count - 1)] componentsJoinedByString:@", "];
}

@end
