//
//  MTMapboxGLViewController.m
//  Map Tester
//
//  Created by Michael Thomas on 5/17/15.
//  Copyright (c) 2015 Biscuit Labs, LLC. All rights reserved.
//

#import "MTMapboxGLViewController.h"
#import <MapboxGL/MapboxGL.h>
#import <CoreLocation/CoreLocation.h>

@interface MTMapboxGLViewController () <MGLMapViewDelegate>

@property (nonatomic) MGLMapView *mapView;

@end

@implementation MTMapboxGLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMapBox];
}

- (void)setupMapBox {
    self.mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds
                                         accessToken:@"YOUR_MAPBOX_API_KEY_HERE"
                                            styleURL:[NSURL URLWithString:@"asset://styles/emerald-v7.json"]];
    
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(38.029413, -78.4788);
    [self.mapView setCenterCoordinate:centerCoordinate zoomLevel:15 animated:NO];
    
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
}

@end
