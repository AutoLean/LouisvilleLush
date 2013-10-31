//
//  SelectionTableViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/17/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SelectionTableViewController : UITableViewController
{
    NSMutableArray *happyHours;
}

@property (nonatomic, retain) NSMutableArray *happyHours;
@property (nonatomic, copy) CLLocation *myLocation;
@property (nonatomic) bool blnNeighborhood_ParentController;

@end
