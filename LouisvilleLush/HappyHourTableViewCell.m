//
//  HappyHourTableViewCell.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/17/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "HappyHourTableViewCell.h"

@implementation HappyHourTableViewCell
@synthesize lblEstablishment;
@synthesize lblNeighborhood;
@synthesize lblDistance;
@synthesize img1;
@synthesize img2;
@synthesize img3;
@synthesize img4;
@synthesize lblSunday;
@synthesize lblMonday;
@synthesize lblTuesday;
@synthesize lblWednesday;
@synthesize lblThursday;
@synthesize lblFriday;
@synthesize lblSaturday;

- (void)dealloc {
    [lblEstablishment release];
    lblEstablishment = nil;
    [lblNeighborhood release];
    lblNeighborhood = nil;
    [lblDistance release];
    lblDistance = nil;
    [img1 release];
    [img2 release];
    [img3 release];
    [img4 release];
    img1 = nil;
    img2 = nil;
    img3 = nil;
    img4 = nil;
    [lblSunday release];
    [lblMonday release];
    [lblTuesday release];
    [lblWednesday release];
    [lblThursday release];
    [lblFriday release];
    [lblSaturday release];
    lblSunday = nil;
    lblMonday = nil;
    lblTuesday = nil;
    lblWednesday = nil;
    lblThursday = nil;
    lblFriday = nil;
    lblSaturday = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
