//
//  HappyHourTableViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 9/25/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "HappyHourTableViewController.h"
#import "TopTableViewCell.h"
#import "MenuOptionTableViewCell.h"
#import "SelectionTableViewController.h"
#import "LaterThisWeekTableViewController.h"
#import "HappyHour.h"
#import "NeighborhoodTableViewController.h"

@implementation HappyHourTableViewController
@synthesize happyHours_Today;
@synthesize happyHours_Tonight;
@synthesize happyHours_Tomorrow;
@synthesize happyHours_2Days;
@synthesize happyHours_3Days;
@synthesize happyHours_4Days;
@synthesize happyHours_5Days;
@synthesize happyHours_6Days;
@synthesize happyHours_7Days;
@synthesize happyHours_BowmanField;
@synthesize happyHours_Butchertown;
@synthesize happyHours_Clifton;
@synthesize happyHours_Downtown;
@synthesize happyHours_EastEnd;
@synthesize happyHours_Germantown;
@synthesize happyHours_HarrodsCreek;
@synthesize happyHours_Highlands;
@synthesize happyHours_Jeffersontown;
@synthesize happyHours_Middletown;
@synthesize happyHours_NewAlbany;
@synthesize happyHours_Okolona;
@synthesize happyHours_OldLouisville;
@synthesize happyHours_Prospect;
@synthesize happyHours_SouthEnd;
@synthesize happyHours_StMatthews;
@synthesize happyHours_Westport;
@synthesize myLocation;
@synthesize strTomorrow;
@synthesize str2Days;
@synthesize str3Days;
@synthesize str4Days;
@synthesize str5Days;
@synthesize str6Days;
@synthesize str7Days;

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    //NSLog(@"%f", self.myLocation.coordinate.latitude);
    self.myLocation = newLocation;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    locationManager = [[CLLocationManager alloc] init];
    myLocation = [[CLLocation alloc] init];
    [locationManager setDelegate:self];
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [locationManager startUpdatingLocation];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [locationManager stopUpdatingLocation];
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0)
    {
        return 215;
    }
    else
    {
        return 70;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    if (indexPath.section == 0)
    {
        static NSString *CustomShiftCellIdentifier = @"TopTableViewCell";
        TopTableViewCell *topCell = (TopTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomShiftCellIdentifier];
        if (topCell == nil) 
        { 
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TopTableViewCell"
                                                         owner:self options:nil];
            for (id oneObject in nib) if ([oneObject isKindOfClass:[TopTableViewCell class]])
                topCell = (TopTableViewCell *)oneObject;
           
        }
        
        return topCell;
    }
    else
    {
        static NSString *CustomShiftCellIdentifier = @"MenuOptionTableViewCell";
        MenuOptionTableViewCell *menuOptionCell = (MenuOptionTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomShiftCellIdentifier];
        if (menuOptionCell == nil) 
        { 
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuOptionTableViewCell"
                                                         owner:self options:nil];
            for (id oneObject in nib) if ([oneObject isKindOfClass:[MenuOptionTableViewCell class]])
                menuOptionCell = (MenuOptionTableViewCell *)oneObject;
            
        }    
        if (indexPath.row == 0)
        {
            menuOptionCell.lblMain.text = @"Happening Now";
        }
        if (indexPath.row == 1)
        {
            menuOptionCell.lblMain.text = @"Later This Week";
        }
        if (indexPath.row == 2)
        {
            menuOptionCell.lblMain.text = @"Neighborhood";
        }
        return menuOptionCell;    
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [locationManager stopUpdatingLocation];
    
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            SelectionTableViewController *happeningNow = [[SelectionTableViewController alloc] initWithStyle:UITableViewStylePlain];
            happeningNow.myLocation = self.myLocation;
            
            //Sort by nearest establishment
            int i;
            for (i = 0; i < [happyHours_Today count]; ++i) 
            {
                id myArrayElement = [happyHours_Today objectAtIndex:i];
                CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Today objectAtIndex:i] latitude] longitude:(double)[[happyHours_Today objectAtIndex:i] longitude]];
                CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
                [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
            }
            NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"distance" ascending: YES] autorelease];
            NSArray *sortedArray = (NSMutableArray *)[happyHours_Today sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
            [happyHours_Today removeAllObjects];
            [happyHours_Today addObjectsFromArray: sortedArray];
            happeningNow.happyHours = happyHours_Today;
            
            happeningNow.title = @"Happening Now";
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            [self.navigationController pushViewController:happeningNow animated:YES];
            [happeningNow release];
            
        }
        else if (indexPath.row == 1)
        {
            LaterThisWeekTableViewController *laterThisWeek = [[LaterThisWeekTableViewController alloc] initWithStyle:UITableViewStylePlain];
            laterThisWeek.happyHours_Tomorrow = happyHours_Tomorrow;
            laterThisWeek.happyHours_Tonight = happyHours_Tonight;
            laterThisWeek.happyHours_2Days = happyHours_2Days;
            laterThisWeek.happyHours_3Days = happyHours_3Days;
            laterThisWeek.happyHours_4Days = happyHours_4Days;
            laterThisWeek.happyHours_5Days = happyHours_5Days;
            laterThisWeek.happyHours_6Days = happyHours_6Days;
            laterThisWeek.happyHours_7Days = happyHours_7Days;
            laterThisWeek.strTomorrow = strTomorrow;
            laterThisWeek.str2Days = str2Days;
            laterThisWeek.str3Days = str3Days;
            laterThisWeek.str4Days = str4Days;
            laterThisWeek.str5Days = str5Days;
            laterThisWeek.str6Days = str6Days;
            laterThisWeek.str7Days = str7Days;
            laterThisWeek.myLocation = self.myLocation;
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            [self.navigationController pushViewController:laterThisWeek animated:YES];
            [laterThisWeek release];
        }
        else if (indexPath.row == 2)
        {
            NeighborhoodTableViewController *neighborhoods = [[NeighborhoodTableViewController alloc] initWithStyle:UITableViewStylePlain];
            neighborhoods.happyHours_BowmanField = happyHours_BowmanField;
            neighborhoods.happyHours_Butchertown = happyHours_Butchertown;
            neighborhoods.happyHours_Clifton = happyHours_Clifton;
            neighborhoods.happyHours_Downtown = happyHours_Downtown;
            neighborhoods.happyHours_EastEnd = happyHours_EastEnd;
            neighborhoods.happyHours_Germantown = happyHours_Germantown;
            neighborhoods.happyHours_HarrodsCreek = happyHours_HarrodsCreek;
            neighborhoods.happyHours_Highlands =  happyHours_Highlands;
            neighborhoods.happyHours_Jeffersontown = happyHours_Jeffersontown;
            neighborhoods.happyHours_Middletown = happyHours_Middletown;
            neighborhoods.happyHours_NewAlbany = happyHours_NewAlbany;
            neighborhoods.happyHours_Okolona = happyHours_Okolona;
            neighborhoods.happyHours_OldLouisville = happyHours_OldLouisville;
            neighborhoods.happyHours_Prospect = happyHours_Prospect;
            neighborhoods.happyHours_SouthEnd = happyHours_SouthEnd;
            neighborhoods.happyHours_StMatthews = happyHours_StMatthews;
            neighborhoods.happyHours_Westport = happyHours_Westport;
            neighborhoods.myLocation = self.myLocation;
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            [self.navigationController pushViewController:neighborhoods animated:YES];
            [neighborhoods release];
        }
    }
}

@end
