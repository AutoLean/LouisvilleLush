//
//  LouisvilleMapViewController.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 11/28/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LouisvilleMapViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *mapView;
    NSMutableArray *annotationData;
    
}

@property (nonatomic, retain) NSMutableArray *annotationData;

- (void)initializeMap;

@end
