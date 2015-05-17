//
//  MTMainViewController.m
//  Map Tester
//
//  Created by Michael Thomas on 5/17/15.
//  Copyright (c) 2015 Biscuit Labs, LLC. All rights reserved.
//

#import "MTMainViewController.h"
#import <WTAHelpers/WTAHelpers.h>
#import "MTMapKitViewController.h"
#import "MTMBXMapViewController.h"
#import "MTWhirlyGlobeViewController.h"
#import "MTMapboxGLViewController.h"
#import "MTGoogleMapsViewController.h"

@interface MTMainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *titles;
@property (nonatomic) NSArray *descriptions;

@end

@implementation MTMainViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.title = @"Map Types";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell wta_reuseableIdentifier] forIndexPath:indexPath];
    
    cell.textLabel.text = self.titles[indexPath.row];
    cell.detailTextLabel.text = self.descriptions[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            MTMapKitViewController *vc = [MTMapKitViewController new];
            vc.title = self.titles[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        case 1: {
            MTMBXMapViewController *vc = [MTMBXMapViewController new];
            vc.title = self.titles[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        case 2: {
            MTGoogleMapsViewController *vc = [MTGoogleMapsViewController new];
            vc.title = self.titles[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        case 3: {
            MTMapboxGLViewController *vc = [MTMapboxGLViewController new];
            vc.title = self.titles[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Synthesis override

- (NSArray *)titles {
    if (_titles) {
        return _titles;
    }
    
    _titles = @[@"MapKit",
                @"MBXMapKit",
                @"Google Maps",
                @"Mapbox GL"];
    
    return _titles;
}

- (NSArray *)descriptions {
    if (_descriptions) {
        return _descriptions;
    }
    
    _descriptions = @[@"Apple's built in Map framework that's used in Maps",
                      @"Lightweight Mapbox integration with MapKit on iOS.",
                      @"Google Maps SDK for iOS.",
                      @"Open source vector map solution for iOS with full styling capabilities."];
    
    return _descriptions;
}

@end
