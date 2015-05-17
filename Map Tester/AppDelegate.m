//
//  AppDelegate.m
//  Map Tester
//
//  Created by Michael Thomas on 5/17/15.
//  Copyright (c) 2015 Biscuit Labs, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import <MapboxGL/MapboxGL.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Mapbox opt-out
    [MGLAccountManager setMapboxMetricsEnabledSettingShownInApp:YES];

    return YES;
}

@end
