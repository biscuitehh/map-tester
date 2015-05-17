//
//  MTMBXMapViewController.m
//  Map Tester
//
//  Created by Michael Thomas on 5/17/15.
//  Copyright (c) 2015 Biscuit Labs, LLC. All rights reserved.
//

#import "MTMBXMapViewController.h"
#import <MBXMapKit/MBXMapKit.h>
@import MapKit;

@interface MTMBXMapViewController () <MKMapViewDelegate, MBXRasterTileOverlayDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) MBXRasterTileOverlay *rasterOverlay;

@end

@implementation MTMBXMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMapBox];
}

#pragma mark - MapBox

- (void)setupMapBox {
    // MapBox access token
    [MBXMapKit setAccessToken:@"YOUR_MAPBOX_API_KEY_HERE"];
    
    // Setup URL cache
    NSUInteger memoryCapacity = 4 * 1024 * 1024;
    NSUInteger diskCapacity = 40 * 1024 * 1024;
    NSURLCache *urlCache = [[NSURLCache alloc] initWithMemoryCapacity:memoryCapacity diskCapacity:diskCapacity diskPath:nil];
    [NSURLCache setSharedURLCache:urlCache];
    
    // Turn off unnecessary map features
    self.mapView.showsBuildings = NO;
    self.mapView.rotateEnabled = NO;
    self.mapView.pitchEnabled = NO;
    self.mapView.delegate = self;
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    // Setup tile overlay
    self.rasterOverlay = [[MBXRasterTileOverlay alloc] initWithMapID:@"mapbox.pencil"];
    self.rasterOverlay.delegate = self;
    
    // Add overlay to map view
    [self.mapView addOverlay:self.rasterOverlay];
}

#pragma mark - MKMapViewDelegate protocol implementation

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MBXRasterTileOverlay class]]) {
        MBXRasterTileRenderer *renderer = [[MBXRasterTileRenderer alloc] initWithTileOverlay:overlay];
        return renderer;
    }
    return nil;
}

#pragma mark - MBXRasterTileOverlayDelegate implementation

- (void)tileOverlay:(MBXRasterTileOverlay *)overlay didLoadMetadata:(NSDictionary *)metadata withError:(NSError *)error {
    // This delegate callback is for centering the map once the map metadata has been loaded
    if (error) {
        NSLog(@"Failed to load metadata for map ID %@ - (%@)", overlay.mapID, error?error:@"");
    } else {
        [_mapView mbx_setCenterCoordinate:CLLocationCoordinate2DMake(38.029413, -78.4788) zoomLevel:overlay.centerZoom animated:NO];
    }
}

- (void)tileOverlayDidFinishLoadingMetadataAndMarkers:(MBXRasterTileOverlay *)overlay {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
