//
//  NeighborhoodTableViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 11/16/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface NeighborhoodTableViewController : UITableViewController
{
    NSMutableArray *happyHours_BowmanField;
    NSMutableArray *happyHours_Butchertown;
    NSMutableArray *happyHours_Clifton;
    NSMutableArray *happyHours_Downtown;
    NSMutableArray *happyHours_EastEnd;
    NSMutableArray *happyHours_Germantown;
    NSMutableArray *happyHours_HarrodsCreek;
    NSMutableArray *happyHours_Highlands;
    NSMutableArray *happyHours_Jeffersontown;
    NSMutableArray *happyHours_Middletown;
    NSMutableArray *happyHours_NewAlbany;
    NSMutableArray *happyHours_Okolona;
    NSMutableArray *happyHours_OldLouisville;
    NSMutableArray *happyHours_Prospect;
    NSMutableArray *happyHours_SouthEnd;
    NSMutableArray *happyHours_StMatthews;
    NSMutableArray *happyHours_Westport;
    
    CLLocationManager *locationManager;
}

@property (nonatomic, retain) NSMutableArray *happyHours_BowmanField;
@property (nonatomic, retain) NSMutableArray *happyHours_Butchertown;
@property (nonatomic, retain) NSMutableArray *happyHours_Clifton;
@property (nonatomic, retain) NSMutableArray *happyHours_Downtown;
@property (nonatomic, retain) NSMutableArray *happyHours_EastEnd;
@property (nonatomic, retain) NSMutableArray *happyHours_Germantown;
@property (nonatomic, retain) NSMutableArray *happyHours_HarrodsCreek;
@property (nonatomic, retain) NSMutableArray *happyHours_Highlands;
@property (nonatomic, retain) NSMutableArray *happyHours_Jeffersontown;
@property (nonatomic, retain) NSMutableArray *happyHours_Middletown;
@property (nonatomic, retain) NSMutableArray *happyHours_NewAlbany;
@property (nonatomic, retain) NSMutableArray *happyHours_Okolona;
@property (nonatomic, retain) NSMutableArray *happyHours_OldLouisville;
@property (nonatomic, retain) NSMutableArray *happyHours_Prospect;
@property (nonatomic, retain) NSMutableArray *happyHours_SouthEnd;
@property (nonatomic, retain) NSMutableArray *happyHours_StMatthews;
@property (nonatomic, retain) NSMutableArray *happyHours_Westport;
@property (nonatomic, retain) CLLocation *myLocation;

@end
