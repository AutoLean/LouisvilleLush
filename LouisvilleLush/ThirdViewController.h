//
//  ThirdViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/9/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ThirdViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    UIImageView *imgAdvertisement;
    UIButton *btnAdvertisement;
}

@property (nonatomic,retain) IBOutlet UIImageView *imgAdvertisement;
@property (nonatomic,retain) IBOutlet UIButton *btnAdvertisement;

- (IBAction)requestAdvertising:(id)sender;

@end
