//
//  TopPlacesTableViewController.h
//  Places
//
//  Created by Gavin Hills on 11/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopPlacesTableViewController : UITableViewController
{
    NSArray *topFlickrPlaces;
}

@property (readonly) NSArray * topFlickrPlaces;

@end
