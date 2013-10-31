//
//  DayOfWeekTableCell.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/20/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayOfWeekTableCell : UITableViewCell {
    UIImageView *imgDay;
    UILabel *lblCount;
}
@property (nonatomic,retain) IBOutlet UIImageView *imgDay;
@property (nonatomic,retain) IBOutlet UILabel *lblCount;

@end
