//
//  LouisvilleMapViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 11/28/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "LouisvilleMapViewController.h"

@implementation LouisvilleMapViewController
@synthesize annotationData;

- (void)initializeMap
{
    //This is called from viewDidLoad and if application becomes active.
    //initializeMap will update the map
    
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 431)];
    mapView.mapType = MKMapTypeStandard;
    [mapView setDelegate:self];
    CLLocationCoordinate2D coord = {.latitude =  38.243611, .longitude =  -85.634339};
    MKCoordinateSpan span = {.latitudeDelta =  0.367432, .longitudeDelta =  0.311843};
    MKCoordinateRegion region = {coord, span};
    mapView.showsUserLocation = YES;
    [mapView setRegion:region];
    [mapView addAnnotations: annotationData];
    
    //Zoom to Annotations
    
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in mapView.annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(zoomRect)) {
            zoomRect = pointRect;
        } else {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
    }
    [mapView setVisibleMapRect:zoomRect animated:YES];
    
    [self.view addSubview:mapView];
    //Badges show how many machines are on the map.
    if ([annotationData count] > 0)
    {
        [[[[[self tabBarController] tabBar] items] objectAtIndex:1] setBadgeValue:[NSString stringWithFormat:@"%d",[annotationData count]]];
    }
}

- (void)becomeActive:(NSNotification *)notification 
{
    [self initializeMap];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    /*
    MKCoordinateRegion region;
    region.center = mapView.region.center;
    MKCoordinateSpan span;
    span = mapView.region.span;
    NSLog(@"%f,%f",span.latitudeDelta, span.longitudeDelta);
    NSLog(@"%f,%f",region.center.latitude, region.center.longitude);
     */

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //Enable notification for when app becomes active.  This is used to update map.
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(becomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    [super viewDidLoad];
    self.title = @"Happy Hours Now";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [mapView release];
    [super dealloc];
}

@end
