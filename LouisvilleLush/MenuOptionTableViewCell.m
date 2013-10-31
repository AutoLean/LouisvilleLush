//
//  MenuOptionTableViewCell.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/1/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import "MenuOptionTableViewCell.h"

@implementation MenuOptionTableViewCell
@synthesize lblMain;
@synthesize imgGreenLayer;
@synthesize imgGlossLayer;

-(void)dealloc {
    [lblMain release];
    lblMain = nil;
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
    /*
    if(selected)
    {
        imgGlossLayer.image = [UIImage imageNamed:@"menubuttongloss_press.png"];
        imgGreenLayer.image = [UIImage imageNamed:@"menugreenbutton_press.png"];
    }
    else
    {
        imgGlossLayer.image = [UIImage imageNamed:@"menubuttongloss.png"];
        imgGreenLayer.image = [UIImage imageNamed:@"menugreenbutton.png"];
    }
     */
    // Configure the view for the selected state
}



@end
