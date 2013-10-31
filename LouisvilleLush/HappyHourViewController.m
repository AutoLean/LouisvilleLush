//
//  HappyHourViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/17/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "HappyHourViewController.h"
#import "EstablishmentAnnotation.h"
#import <QuartzCore/QuartzCore.h>


@implementation HappyHourViewController
@synthesize establishmentName;
@synthesize phoneNumber;
@synthesize eventDescription;
@synthesize establishmentAddress;
@synthesize happyHour;
@synthesize myLocation;
@synthesize timeLeft;
@synthesize remaining;
@synthesize phone;
@synthesize address;
@synthesize StartTime;
@synthesize lblSunday;
@synthesize lblMonday;
@synthesize lblTuesday;
@synthesize lblWednesday;
@synthesize lblThursday;
@synthesize lblFriday;
@synthesize lblSaturday;

- (void)dealloc{
    [establishmentName release];
    establishmentName = nil;
    [phoneNumber release];
    phoneNumber = nil;
    [eventDescription release];
    eventDescription = nil;
    [establishmentAddress release];
    establishmentAddress = nil;
    [happyHour release];
    happyHour = nil;
    [timeLeft release];
    timeLeft = nil;
    [remaining release];
    remaining = nil;
    [phone release];
    phone = nil;
    [address release];
    address = nil;
    [lblSunday release];
    [lblMonday release];
    [lblTuesday release];
    [lblWednesday release];
    [lblThursday release];
    [lblFriday release];
    [lblSaturday release];
    lblSunday = nil;
    lblMonday = nil;
    lblTuesday = nil;
    lblWednesday = nil;
    lblThursday = nil;
    lblFriday = nil;
    lblSaturday = nil;
    [super dealloc];
}

- (IBAction)placeCall:(id)sender {
    NSString *number = [@"tel://" stringByAppendingString:happyHour.phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:number]];   
}


- (IBAction)getDirections:(id)sender {
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Who's driving?" message:@"Please don't drink and drive." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSString *latlong = [NSString stringWithFormat:@"%f,%f",happyHour.latitude,happyHour.longitude];
        NSString *myCoordinate = [NSString stringWithFormat:@"%f,%f", myLocation.coordinate.latitude, myLocation.coordinate.longitude];
        NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%@&daddr=%@",myCoordinate, [latlong stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (CGColorRef)CGColorFromA:(float)a R: (float)r G: (float)g B: (float)b
{
	CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
	CGFloat myColor[] = {r, g, b,  a};
	CGColorRef output = CGColorCreate(rgb, myColor);
	CGColorSpaceRelease(rgb);
	
	return output;
}

-(void)viewWillDisappear:(BOOL)animated {
    [mapView release];
    mapView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(5, 430-155, 310, 150)];
    mapView.mapType = MKMapTypeStandard;
    [mapView setDelegate:self];
    CLLocationCoordinate2D coord = {.latitude =  38.243611, .longitude =  -85.634339};
    MKCoordinateSpan span = {.latitudeDelta =  0.367432, .longitudeDelta =  0.311843};
    MKCoordinateRegion region = {coord, span};
    mapView.showsUserLocation = YES;
    [mapView setRegion:region];
    EstablishmentAnnotation *pin = [[EstablishmentAnnotation alloc] init];
    pin.latitude = happyHour.latitude;
    pin.longitude = happyHour.longitude;
    pin.title = happyHour.title;
    pin.subtitle= happyHour.subtitle;
    NSMutableArray *allPins = [[NSMutableArray alloc] init];
    [allPins addObject:pin];
    [mapView addAnnotations: allPins];
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
    MKMapPoint userPoint = MKMapPointForCoordinate(self.myLocation.coordinate);
    MKMapRect userPointRect = MKMapRectMake(userPoint.x, userPoint.y, 0, 0);
    zoomRect = MKMapRectUnion(zoomRect, userPointRect);
    [mapView setVisibleMapRect:zoomRect animated:YES];
    MKCoordinateRegion theRegion = mapView.region;
    theRegion.span.longitudeDelta *= 2.0;
    theRegion.span.latitudeDelta *= 2.0;
    [mapView setRegion:theRegion animated:YES];
    mapView.layer.cornerRadius = 10.0;
    [self.view addSubview:mapView];  
    self.establishmentName.text = happyHour.title;
    self.establishmentName.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
    self.eventDescription.text = happyHour.eventDescription;
    self.establishmentAddress.backgroundColor = [UIColor clearColor];
    if([self.remaining.text isEqualToString:@"Starting At:"])
    {
        NSString *strStartTime = [happyHour startTime];
        if ( [[strStartTime substringWithRange:NSMakeRange(0, 2)] intValue] > 11 )
        {
            if ([[strStartTime substringWithRange:NSMakeRange(0, 2)] intValue] == 12)
            {
                [timeLeft setText:[NSString stringWithFormat:@"%@ PM", strStartTime]];
            }
            else
            {
                //Starts in the afternoon, lets make it look better.
                int intTime = [[strStartTime substringWithRange:NSMakeRange(0, 2)] intValue] - 12;
                [timeLeft setText:[NSString stringWithFormat:@"%i%@ PM", intTime, [strStartTime substringWithRange:NSMakeRange(2, 3)]]];
            }
        }
        else
        {
            [timeLeft setText:[NSString stringWithFormat:@"%@ AM", strStartTime]];
        }
        self.timeLeft.textColor = [UIColor greenColor];
        self.remaining.textColor = [UIColor greenColor];
    }
    else
    {
        self.timeLeft.text = happyHour.timeLeft;
        if ([[happyHour.timeLeft substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"00"])
        {
            self.timeLeft.text = [happyHour.timeLeft substringWithRange:NSMakeRange(4, 3)];
            self.timeLeft.textColor = [UIColor redColor];
            self.remaining.textColor = [UIColor redColor];
        }
        else
        {
            if ([[happyHour.timeLeft substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"])
            {
                self.timeLeft.text = [happyHour.timeLeft substringWithRange:NSMakeRange(1, 6)];
            }
            self.timeLeft.textColor = [UIColor greenColor];
            self.remaining.textColor = [UIColor greenColor];
        }   
    }
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
