//
//  StarsScrollViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/18/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "StarsScrollViewController.h"

@implementation StarsScrollViewController
@synthesize timer;
@synthesize startTime;
@synthesize starsImage;

-(void)dealloc {
    [timer release];
    timer = nil;
    [startTime release];
    startTime = nil;
    [starsImage release];
    starsImage = nil;
    [super dealloc];
}

- (void) animateScroll:(NSTimer *)timerParam
{
    const NSTimeInterval duration = 4;
    
    NSTimeInterval timeRunning = -[startTime timeIntervalSinceNow];
    
    if (timeRunning >= duration)
    {
        [self setContentOffset:destinationOffset animated:YES];
        [timer invalidate];
        timer = nil;
        return;
    }
	CGPoint offset = [self contentOffset];
	offset.y = startOffset.y + (destinationOffset.y - startOffset.y) * timeRunning / duration;
	[self setContentOffset:offset animated:YES];
    if (timeRunning > 1) {                  
        starsImage.alpha += .003;
    }
}

- (void) doAnimatedScrollTo:(CGPoint)offset 
{
    self.startTime = [NSDate date];
    startOffset = self.contentOffset;
    destinationOffset = offset;
    
    if (!timer)
    {
        self.timer =
		[NSTimer scheduledTimerWithTimeInterval:0.01
                                         target:self
                                       selector:@selector(animateScroll:)
                                       userInfo:nil
                                        repeats:YES];
    }
}

@end
