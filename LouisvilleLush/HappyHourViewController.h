//
//  HappyHourViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/17/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "HappyHour.h"
#import <QuartzCore/QuartzCore.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HappyHourViewController : UIViewController <MKMapViewDelegate, UIAlertViewDelegate> {
    HappyHour *happyHour;
    UIImageView *phone;
    UIImageView *address;
    UILabel *timeLeft;
    UILabel *remaining;
    UILabel *establishmentName;
    UILabel *eventDescription;
    UIButton *establishmentAddress;
    UIButton *phoneNumber;
    MKMapView *mapView;
    NSString *StartTime;
}

@property (nonatomic,retain) HappyHour *happyHour;
@property (nonatomic,retain) IBOutlet UIImageView *phone;
@property (nonatomic,retain) IBOutlet UIImageView *address;
@property (nonatomic,retain) IBOutlet UILabel *establishmentName;
@property (nonatomic,retain) IBOutlet UILabel *eventDescription;
@property (nonatomic,retain) IBOutlet UILabel *timeLeft;
@property (nonatomic,retain) IBOutlet UILabel *remaining;
@property (nonatomic,retain) IBOutlet UIButton *establishmentAddress;
@property (nonatomic,retain) IBOutlet UIButton *phoneNumber;
@property (nonatomic,copy) CLLocation *myLocation;
@property (nonatomic,retain) NSString *StartTime;

@property (nonatomic,retain) IBOutlet UILabel *lblSunday;
@property (nonatomic,retain) IBOutlet UILabel *lblMonday;
@property (nonatomic,retain) IBOutlet UILabel *lblTuesday;
@property (nonatomic,retain) IBOutlet UILabel *lblWednesday;
@property (nonatomic,retain) IBOutlet UILabel *lblThursday;
@property (nonatomic,retain) IBOutlet UILabel *lblFriday;
@property (nonatomic,retain) IBOutlet UILabel *lblSaturday;

- (IBAction)placeCall:(id)sender;
- (IBAction)getDirections:(id)sender;

@end
