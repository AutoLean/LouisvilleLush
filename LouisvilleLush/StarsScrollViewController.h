//
//  StarsScrollViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/18/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//



@interface StarsScrollViewController : UIScrollView {
    CGPoint startOffset;
    CGPoint destinationOffset;
    NSDate *startTime;
    NSTimer *timer;
}

@property (nonatomic, retain) NSDate *startTime;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) IBOutlet UIImageView *starsImage;

- (void) animateScroll:(NSTimer *)timerParam;
- (void) doAnimatedScrollTo:(CGPoint)offset;

@end
