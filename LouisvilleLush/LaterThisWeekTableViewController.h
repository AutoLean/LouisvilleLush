//
//  LaterThisWeekTableViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/18/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LaterThisWeekTableViewController : UITableViewController
{
    NSMutableArray *happyHours_Tomorrow;
    NSMutableArray *happyHours_Tonight;
    NSMutableArray *happyHours_2Days;
    NSMutableArray *happyHours_3Days;
    NSMutableArray *happyHours_4Days;
    NSMutableArray *happyHours_5Days;
    NSMutableArray *happyHours_6Days;
    NSMutableArray *happyHours_7Days;
    
    NSString *strTomorrow;
    NSString *str2Days;
    NSString *str3Days;
    NSString *str4Days;
    NSString *str5Days;
    NSString *str6Days;
    NSString *str7Days;
}

@property (nonatomic, retain) NSMutableArray *happyHours_Tomorrow;
@property (nonatomic, retain) NSMutableArray *happyHours_Tonight;
@property (nonatomic, retain) NSMutableArray *happyHours_2Days;
@property (nonatomic, retain) NSMutableArray *happyHours_3Days;
@property (nonatomic, retain) NSMutableArray *happyHours_4Days;
@property (nonatomic, retain) NSMutableArray *happyHours_5Days;
@property (nonatomic, retain) NSMutableArray *happyHours_6Days;
@property (nonatomic, retain) NSMutableArray *happyHours_7Days;

@property (nonatomic, retain) NSString *strTomorrow;
@property (nonatomic, retain) NSString *str2Days;
@property (nonatomic, retain) NSString *str3Days;
@property (nonatomic, retain) NSString *str4Days;
@property (nonatomic, retain) NSString *str5Days;
@property (nonatomic, retain) NSString *str6Days;
@property (nonatomic, retain) NSString *str7Days;

@property (nonatomic, copy) CLLocation *myLocation;

@end
