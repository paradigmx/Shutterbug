//
//  JustPostedFlickrPhotosTableViewController.m
//  Shutterbug
//
//  Created by Neo on 8/21/14.
//  Copyright (c) 2014 Paradigm X. All rights reserved.
//

#import "JustPostedFlickrPhotosTableViewController.h"
#import "FlickrFetcher.h"

@implementation JustPostedFlickrPhotosTableViewController

- (void)fetchPhotos {
    [self.refreshControl beginRefreshing];

    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    dispatch_queue_t fetchQ = dispatch_queue_create("FlickrFetcher", NULL);
    dispatch_async(fetchQ, ^{
        NSData *jsonResult = [NSData dataWithContentsOfURL:url];
        NSDictionary *propertyListResult = [NSJSONSerialization JSONObjectWithData:jsonResult options:0 error:NULL];
        NSArray *photos = [propertyListResult valueForKeyPath:FLICKR_RESULTS_PHOTOS];

        dispatch_async(dispatch_get_main_queue(), ^{
            self.photos = photos;

            [self.refreshControl endRefreshing];
        });
    });
}

@end
