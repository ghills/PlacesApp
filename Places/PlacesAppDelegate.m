//
//  PlacesAppDelegate.m
//  Places
//
//  Created by Gavin Hills on 11/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PicturesTableViewController.h"
#import "PlacesAppDelegate.h"
#import "TopPlacesTableViewController.h"
#import "RecentPhotoManager.h"

@implementation PlacesAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // create 2 table controllers for each tab
    TopPlacesTableViewController *tpc = [[TopPlacesTableViewController alloc] init];
    tpc.tabBarItem.title = @"Popular Places";
    tpc.tabBarItem.image = [UIImage imageNamed:@"MostViewed.jpg"];
    UINavigationController *tpcNav = [[UINavigationController alloc] initWithRootViewController:tpc];
    [tpc release];
    
    /*
    RecentPicturesTableViewController *rpc = [[RecentPicturesTableViewController alloc] init];
    rpc.tabBarItem.title = @"Recent Pictures";
    rpc.tabBarItem.image = [UIImage imageNamed:@"MostViewed.jpg"];
    UINavigationController *rpcNav = [[UINavigationController alloc] initWithRootViewController:rpc];
    [rpc release];
     */
    
    PicturesTableViewController * pvc = [[PicturesTableViewController alloc] init];
    pvc.title = @"Recently Viewed";
    pvc.photoList = [RecentPhotoManager GetRecentlyViewedPhotos];
    pvc.tabBarItem.title = @"Recent Pictures";
    pvc.tabBarItem.image = [UIImage imageNamed:@"MostViewed.jpg"];
    UINavigationController *rpcNav = [[UINavigationController alloc] initWithRootViewController:pvc];
    [pvc release];
    
    // create array of views and add it to the tab controller
    NSArray *tabsArray = [[NSArray alloc] initWithObjects:tpcNav, rpcNav, nil];
    tabBarController.viewControllers = tabsArray;
    [tpcNav release];
    [rpcNav release];
    
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
