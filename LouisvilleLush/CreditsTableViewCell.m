//
//  CreditsTableViewCell.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/19/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "CreditsTableViewCell.h"

@implementation CreditsTableViewCell
@synthesize imgCredit;

- (void)dealloc{
    [imgCredit release];
    imgCredit = nil;
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
