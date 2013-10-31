//
//  HappyHourTableViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 9/25/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HappyHourTableViewController : UITableViewController <CLLocationManagerDelegate> {
    NSMutableArray *happyHours_Today;
    NSMutableArray *happyHours_Tonight;
    NSMutableArray *happyHours_Tomorrow;
    NSMutableArray *happyHours_2Days;
    NSMutableArray *happyHours_3Days;
    NSMutableArray *happyHours_4Days;
    NSMutableArray *happyHours_5Days;
    NSMutableArray *happyHours_6Days;
    NSMutableArray *happyHours_7Days;
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
    
    NSString *strTomorrow;
    NSString *str2Days;
    NSString *str3Days;
    NSString *str4Days;
    NSString *str5Days;
    NSString *str6Days;
    NSString *str7Days;
}

@property (nonatomic, retain) NSMutableArray *happyHours_Today;
@property (nonatomic, retain) NSMutableArray *happyHours_Tonight;
@property (nonatomic, retain) NSMutableArray *happyHours_Tomorrow;
@property (nonatomic, retain) NSMutableArray *happyHours_2Days;
@property (nonatomic, retain) NSMutableArray *happyHours_3Days;
@property (nonatomic, retain) NSMutableArray *happyHours_4Days;
@property (nonatomic, retain) NSMutableArray *happyHours_5Days;
@property (nonatomic, retain) NSMutableArray *happyHours_6Days;
@property (nonatomic, retain) NSMutableArray *happyHours_7Days;
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

@property (nonatomic, retain) NSString *strTomorrow;
@property (nonatomic, retain) NSString *str2Days;
@property (nonatomic, retain) NSString *str3Days;
@property (nonatomic, retain) NSString *str4Days;
@property (nonatomic, retain) NSString *str5Days;
@property (nonatomic, retain) NSString *str6Days;
@property (nonatomic, retain) NSString *str7Days;

@end
