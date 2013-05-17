//
//  ViewController.h
//  testHeading
//
//  Created by Toshihiro Kinami on 2013/05/18.
//  Copyright (c) 2013年 Toshihiro Kinami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locManager;
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

@end
