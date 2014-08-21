//
//  JustPostedFlickrPhotosTableViewController.m
//  Shutterbug
//
//  Created by Neo on 8/21/14.
//  Copyright (c) 2014 Paradigm X. All rights reserved.
//

#import "JustPostedFlickrPhotosTableViewController.h"

@interface JustPostedFlickrPhotosTableViewController ()

@end

@implementation JustPostedFlickrPhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)fetchPhotos {
    self.photos = nil;
}

@end
