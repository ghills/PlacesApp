//
//  PlacePicturesTableViewController.h
//  Places
//
//  Created by Gavin Hills on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacePicturesTableViewController : UITableViewController
{
    NSString * placeID;
    NSDictionary * placeInfo;
    NSArray * placePhotos;
}

@property (retain) NSString * placeID;
@property (retain) NSDictionary * placeInfo;

@end
