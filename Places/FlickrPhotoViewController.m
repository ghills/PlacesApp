//
//  FlickrPhotoViewController.m
//  Places
//
//  Created by Gavin Hills on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlickrPhotoViewController.h"
#import "FlickrFetcher.h"

@implementation FlickrPhotoViewController

@synthesize photoInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    NSData * photoData = [FlickrFetcher imageDataForPhotoWithFlickrInfo:self.photoInfo format:FlickrFetcherPhotoFormatLarge];
    
    UIImage *image = [UIImage imageWithData:photoData];
    UIImageView *iView = [[UIImageView alloc] initWithImage:image];
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame]; /* foo? */
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:applicationFrame];
    scrollView.contentSize = image.size;
    scrollView.minimumZoomScale = 0.3;
    scrollView.maximumZoomScale = 5.0;
    scrollView.delegate = self;
    
    [scrollView addSubview:iView];
    self.view = scrollView;
    [scrollView release];
    imageView = iView;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.title = [self.photoInfo objectForKey:@"title"];
    if( self.title.length == 0 )
    {
        self.title = @"Unknown";
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    CGSize imageSize = imageView.image.size;
    
    CGFloat xRatio = ( bounds.size.width / imageSize.width );
    CGFloat yRatio = ( bounds.size.height / imageSize.height );
    CGFloat zoomScale = MAX(xRatio, yRatio);
    
    UIScrollView * scrollView = (UIScrollView *)self.view;
    [scrollView setZoomScale:zoomScale animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

- (void)dealloc
{
    [photoInfo release];
    [imageView release];
    [super dealloc];
}

@end
