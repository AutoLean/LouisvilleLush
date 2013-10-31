//
//  HappyHourTableViewCell.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/17/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HappyHourTableViewCell : UITableViewCell
{
    UILabel *lblEstablishment;
    UILabel *lblNeighborhood;
    UILabel *lblDistance;
    
    UIImageView *img1;
    UIImageView *img2;
    UIImageView *img3;
    UIImageView *img4;
}

@property (nonatomic,retain) IBOutlet UILabel *lblEstablishment;
@property (nonatomic,retain) IBOutlet UILabel *lblNeighborhood;
@property (nonatomic,retain) IBOutlet UILabel *lblDistance;
@property (nonatomic,retain) IBOutlet UIImageView *img1;
@property (nonatomic,retain) IBOutlet UIImageView *img2;
@property (nonatomic,retain) IBOutlet UIImageView *img3;
@property (nonatomic,retain) IBOutlet UIImageView *img4;

@property (nonatomic,retain) IBOutlet UILabel *lblSunday;
@property (nonatomic,retain) IBOutlet UILabel *lblMonday;
@property (nonatomic,retain) IBOutlet UILabel *lblTuesday;
@property (nonatomic,retain) IBOutlet UILabel *lblWednesday;
@property (nonatomic,retain) IBOutlet UILabel *lblThursday;
@property (nonatomic,retain) IBOutlet UILabel *lblFriday;
@property (nonatomic,retain) IBOutlet UILabel *lblSaturday;

@end
