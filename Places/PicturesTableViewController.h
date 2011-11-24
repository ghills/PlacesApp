//
//  PicturesTableViewController.h
//  Places
//
//  Created by Gavin Hills on 11/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPictureInfoSource.h"

@interface PicturesTableViewController : UITableViewController
{
    NSArray * photoList;
    id <FlickrPictureInfoSource> photoListSource;
}

@property (retain) NSArray * photoList;
@property (retain) id <FlickrPictureInfoSource> photoListSource;

@end
