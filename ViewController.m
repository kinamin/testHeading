//
//  ViewController.m
//  testHeading
//
//  Created by Toshihiro Kinami on 2013/05/18.
//  Copyright (c) 2013年 Toshihiro Kinami. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{
    self.myMapView.delegate = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    if ([CLLocationManager locationServicesEnabled]) {
        self.myMapView.showsUserLocation = NO;
        [_locManager stopUpdatingLocation];
        
        if ([CLLocationManager headingAvailable]) {
            [_locManager stopUpdatingHeading];
        }
    }
    
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    if ([CLLocationManager locationServicesEnabled]) {
        self.myMapView.showsUserLocation = YES;
        [_locManager startUpdatingLocation];
        
        if ([CLLocationManager headingAvailable]) {
            [self.myMapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:NO];
            [_locManager startUpdatingHeading];
        }else{
            [self.myMapView setUserTrackingMode:MKUserTrackingModeFollow animated:NO];
        }
    }else{
        [self.myMapView setUserTrackingMode:MKUserTrackingModeNone animated:NO];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.myMapView.delegate = self;
    [self.myMapView setFrame:self.view.frame];
    
    self.locManager = [CLLocationManager new];
    [self.locManager setDelegate:self];
    [self.locManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locManager setHeadingFilter:3];
    [self.locManager setHeadingOrientation:CLDeviceOrientationPortrait];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    if ([CLLocationManager locationServicesEnabled]) {
        if ([CLLocationManager headingAvailable]) {
            [self.myMapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:NO];
        }else{
            [self.myMapView setUserTrackingMode:MKUserTrackingModeFollow animated:NO];
        }
    }else{
        [self.myMapView setUserTrackingMode:MKUserTrackingModeNone animated:NO];
    }
}

@end
