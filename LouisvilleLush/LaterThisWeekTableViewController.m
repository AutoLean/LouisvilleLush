//
//  LaterThisWeekTableViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/18/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "LaterThisWeekTableViewController.h"
#import "DayOfWeekTableCell.h"
#import "SelectionTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "HappyHour.h"

@implementation LaterThisWeekTableViewController
@synthesize happyHours_Tomorrow;
@synthesize happyHours_Tonight;
@synthesize happyHours_2Days;
@synthesize happyHours_3Days;
@synthesize happyHours_4Days;
@synthesize happyHours_5Days;
@synthesize happyHours_6Days;
@synthesize happyHours_7Days;
@synthesize strTomorrow;
@synthesize str2Days;
@synthesize str3Days;
@synthesize str4Days;
@synthesize str5Days;
@synthesize str6Days;
@synthesize str7Days;
@synthesize myLocation;

- (void)dealloc {
    [happyHours_Tomorrow release];
    happyHours_Tomorrow = nil;
    [happyHours_Tonight release];
    happyHours_Tonight = nil;
    [happyHours_2Days release];
    happyHours_2Days = nil;
    [happyHours_3Days release];
    happyHours_3Days = nil;
    [happyHours_4Days release];
    happyHours_4Days = nil;
    [happyHours_5Days release];
    happyHours_5Days = nil;
    [happyHours_6Days release];
    happyHours_6Days = nil;
    [happyHours_7Days release];
    happyHours_7Days = nil;
    [strTomorrow release];
    [str2Days release];
    [str3Days release];
    [str4Days release];
    [str5Days release];
    [str6Days release];
    [str7Days release];
    strTomorrow = nil;
    str2Days = nil;
    str3Days = nil;
    str4Days = nil;
    str5Days = nil;
    str6Days = nil;
    str7Days = nil;
    [super dealloc];
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
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"Later This Week";
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
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 55;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomShiftCellIdentifier = @"DayOfWeekTableCell";
    DayOfWeekTableCell *menuOptionCell = (DayOfWeekTableCell *)[tableView dequeueReusableCellWithIdentifier: CustomShiftCellIdentifier];
    if (menuOptionCell == nil) 
    { 
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DayOfWeekTableCell"
                                                     owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[DayOfWeekTableCell class]])
            menuOptionCell = (DayOfWeekTableCell *)oneObject;
        
    }    
    menuOptionCell.selectionStyle = UITableViewCellSelectionStyleGray;
    menuOptionCell.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttonselect.png"]] autorelease];
    switch (indexPath.row) {
        case 0:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Tonight.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i coming up", [happyHours_Tonight count]];
            break;
        case 1:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Tomorrow.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Tomorrow count]];
            break;
        case 2:
            menuOptionCell.imgDay.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",str2Days]];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_2Days count]];
            break;
        case 3:
            menuOptionCell.imgDay.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",str3Days]];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_3Days count]];
            break;
        case 4:
            menuOptionCell.imgDay.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",str4Days]];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_4Days count]];
            break;
        case 5:
            menuOptionCell.imgDay.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",str5Days]];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_5Days count]];
            break;
        case 6:
            menuOptionCell.imgDay.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",str6Days]];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_6Days count]];
            break;
        case 7:
            menuOptionCell.imgDay.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",str7Days]];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_7Days count]];
            break;
        default:
            break;
    }
    return menuOptionCell;
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
    SelectionTableViewController *happyHours_Selection = [[SelectionTableViewController alloc] initWithStyle:UITableViewStylePlain];
    happyHours_Selection.myLocation = self.myLocation;
    if (indexPath.row == 0)
    {
        int i;
        for (i = 0; i < [happyHours_Tonight count]; ++i) 
        {
            id myArrayElement = [happyHours_Tonight objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Tonight objectAtIndex:i] latitude] longitude:(double)[[happyHours_Tonight objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Tonight sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Tonight removeAllObjects];
        [happyHours_Tonight addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Tonight;
        happyHours_Selection.title = @"Tonight";
    }
    if (indexPath.row == 1)
    {
        int i;
        for (i = 0; i < [happyHours_Tomorrow count]; ++i) 
        {
            id myArrayElement = [happyHours_Tomorrow objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Tomorrow objectAtIndex:i] latitude] longitude:(double)[[happyHours_Tomorrow objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Tomorrow sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Tomorrow removeAllObjects];
        [happyHours_Tomorrow addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Tomorrow;
        happyHours_Selection.title = @"Tomorrow";
    }
    if (indexPath.row == 2)
    {
        int i;
        for (i = 0; i < [happyHours_2Days count]; ++i) 
        {
            id myArrayElement = [happyHours_2Days objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_2Days objectAtIndex:i] latitude] longitude:(double)[[happyHours_2Days objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_2Days sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_2Days removeAllObjects];
        [happyHours_2Days addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_2Days;
        happyHours_Selection.title = str2Days;
    }
    if (indexPath.row == 3)
    {
        int i;
        for (i = 0; i < [happyHours_3Days count]; ++i) 
        {
            id myArrayElement = [happyHours_3Days objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_3Days objectAtIndex:i] latitude] longitude:(double)[[happyHours_3Days objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_3Days sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_3Days removeAllObjects];
        [happyHours_3Days addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_3Days;
        happyHours_Selection.title = str3Days;
    }
    if (indexPath.row == 4)
    {
        int i;
        for (i = 0; i < [happyHours_4Days count]; ++i) 
        {
            id myArrayElement = [happyHours_4Days objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_4Days objectAtIndex:i] latitude] longitude:(double)[[happyHours_4Days objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_4Days sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_4Days removeAllObjects];
        [happyHours_4Days addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_4Days;
        happyHours_Selection.title = str4Days;
    }
    if (indexPath.row == 5)
    {
        int i;
        for (i = 0; i < [happyHours_5Days count]; ++i) 
        {
            id myArrayElement = [happyHours_5Days objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_5Days objectAtIndex:i] latitude] longitude:(double)[[happyHours_5Days objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_5Days sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_5Days removeAllObjects];
        [happyHours_5Days addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_5Days;
        happyHours_Selection.title = str5Days;
    }
    if (indexPath.row == 6)
    {
        int i;
        for (i = 0; i < [happyHours_6Days count]; ++i) 
        {
            id myArrayElement = [happyHours_6Days objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_6Days objectAtIndex:i] latitude] longitude:(double)[[happyHours_6Days objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_6Days sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_6Days removeAllObjects];
        [happyHours_6Days addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_6Days;
        happyHours_Selection.title = str6Days;
    }
    if (indexPath.row == 7)
    {
        int i;
        for (i = 0; i < [happyHours_7Days count]; ++i) 
        {
            id myArrayElement = [happyHours_7Days objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_7Days objectAtIndex:i] latitude] longitude:(double)[[happyHours_7Days objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_7Days sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_7Days removeAllObjects];
        [happyHours_7Days addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_7Days;
        happyHours_Selection.title = str7Days;
    }
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:happyHours_Selection animated:YES];
    [happyHours_Selection release];

}

@end
