//
//  FlickrPictureInfoSource.h
//  Places
//
//  Created by Gavin Hills on 11/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FlickrPictureInfoSource <NSObject>

- (NSArray *)GetPictureInfoList;

- (BOOL)PictureListNeedsUpdate;

@end
