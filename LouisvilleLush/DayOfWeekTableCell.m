//
//  DayOfWeekTableCell.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/20/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "DayOfWeekTableCell.h"

@implementation DayOfWeekTableCell
@synthesize imgDay;
@synthesize lblCount;

- (void)dealloc{
    [imgDay release];
    imgDay = nil;
    [lblCount release];
    lblCount = nil;
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
