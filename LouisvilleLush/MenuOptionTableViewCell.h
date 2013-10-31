//
//  MenuOptionTableViewCell.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/1/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuOptionTableViewCell : UITableViewCell 
{
    UILabel *lblMain;
    UIImageView *imgGreenLayer;
    UIImageView *imgGlossLayer;
}

@property (nonatomic,retain) IBOutlet UILabel *lblMain;
@property (nonatomic,retain) IBOutlet UIImageView *imgGreenLayer;
@property (nonatomic,retain) IBOutlet UIImageView *imgGlossLayer;
@end
