//
//  EstablishmentAnnotation.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/13/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import "EstablishmentAnnotation.h"


@implementation EstablishmentAnnotation

@synthesize latitude;
@synthesize longitude;
@synthesize title;
@synthesize subtitle;
@synthesize address;
@synthesize city;
@synthesize state;
@synthesize zipcode;
@synthesize coordinate;

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coord = {self.latitude, self.longitude};
    return coord;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"%1.3f, %1.3f", 
            self.latitude, self.longitude];
}

@end
