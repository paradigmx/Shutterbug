//
//  JustPostedFlickrPhotosTableViewController.m
//  Shutterbug
//
//  Created by Neo on 8/21/14.
//  Copyright (c) 2014 Paradigm X. All rights reserved.
//

#import "JustPostedFlickrPhotosTableViewController.h"
#import "FlickrFetcher.h"

@interface JustPostedFlickrPhotosTableViewController ()

@end

@implementation JustPostedFlickrPhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)fetchPhotos {
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
#warning Blocked main queue
    NSData *jsonResult = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResult = [NSJSONSerialization JSONObjectWithData:jsonResult options:0 error:NULL];

//    NSLog(@"Flickr results: %@", propertyListResult);
    NSArray *photos = [propertyListResult valueForKeyPath:FLICKR_RESULTS_PHOTOS];

    self.photos = photos;
}

@end
