//
//  MTMapKitViewController.m
//  Map Tester
//
//  Created by Michael Thomas on 5/17/15.
//  Copyright (c) 2015 Biscuit Labs, LLC. All rights reserved.
//

#import "MTMapKitViewController.h"
@import MapKit;

@interface MTMapKitViewController ()

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end

@implementation MTMapKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(38.029413, -78.4788) animated:NO];
}

@end
