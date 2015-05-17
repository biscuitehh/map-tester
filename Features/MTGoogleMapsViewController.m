//
//  MTGoogleMapsViewController.m
//  Map Tester
//
//  Created by Michael Thomas on 5/17/15.
//  Copyright (c) 2015 Biscuit Labs, LLC. All rights reserved.
//

#import "MTGoogleMapsViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MTGoogleMapsViewController ()

@end

@implementation MTGoogleMapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGoogleMaps];
}

- (void)setupGoogleMaps {
    [GMSServices provideAPIKey:@"YOUR_GOOGLE_API_KEY_HERE"];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:38.029413
                                                            longitude:-78.4788
                                                                 zoom:15];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    marker.snippet = @"WillowTree Apps, Inc.";
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = mapView;
    
    self.view = mapView;
}

@end
