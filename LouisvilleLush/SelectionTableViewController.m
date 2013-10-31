//
//  SelectionTableViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/17/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "SelectionTableViewController.h"
#import "HappyHour.h"
#import "HappyHourTableViewCell.h"
#import "HappyHourViewController.h"
#import <CoreLocation/CoreLocation.h>

@implementation SelectionTableViewController
@synthesize happyHours;
@synthesize myLocation;
@synthesize blnNeighborhood_ParentController;

- (void)dealloc {
    [happyHours release];
    happyHours = nil;
    [myLocation release];
    myLocation = nil;
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
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
    return [happyHours count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomShiftCellIdentifier = @"HappyHourTableViewCell";
    HappyHourTableViewCell *nowCell = (HappyHourTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomShiftCellIdentifier];
    if (nowCell == nil) 
    { 
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HappyHourTableViewCell"
                                                     owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[HappyHourTableViewCell class]])
            nowCell = (HappyHourTableViewCell *)oneObject;
    }    
    bool bln1 = FALSE;
    bool bln2 = FALSE;
    bool bln3 = FALSE;
    
    if([[[happyHours objectAtIndex:indexPath.row] hasFood] isEqualToString:@"TRUE"])
    {
        nowCell.img1.image = [UIImage imageNamed:@"food.png"];
        bln1 = TRUE;
    }
    if([[[happyHours objectAtIndex:indexPath.row] hasBeer] isEqualToString:@"TRUE"])
    {
        if (bln1 == FALSE) {
            nowCell.img1.image = [UIImage imageNamed:@"beer.png"];
            bln1 = TRUE;
        }
        else {
            nowCell.img2.image = [UIImage imageNamed:@"beer.png"];
            bln2 = TRUE;
        }
    }
    if([[[happyHours objectAtIndex:indexPath.row] hasWine] isEqualToString:@"TRUE"])
    {
        if (bln1 == FALSE) {
            nowCell.img1.image = [UIImage imageNamed:@"wine.png"];
            bln1 = TRUE;
        }
        else {
            if (bln2 == FALSE) {
                nowCell.img2.image = [UIImage imageNamed:@"wine.png"];
                bln2 = TRUE;
            }
            else {
                nowCell.img3.image = [UIImage imageNamed:@"wine.png"];
                bln3 = TRUE;
            }
        }
        
    }
    if([[[happyHours objectAtIndex:indexPath.row] hasCocktails] isEqualToString:@"TRUE"])
    {
        if (bln1 == FALSE) {
            nowCell.img1.image = [UIImage imageNamed:@"cocktail.png"];
            bln1 =TRUE;
        }
        else {
            if (bln2 == FALSE) {
                nowCell.img2.image = [UIImage imageNamed:@"cocktail.png"];
                bln2 = TRUE;
            }
            else {
                if (bln3 == FALSE) {
                    nowCell.img3.image = [UIImage imageNamed:@"cocktail.png"];
                    bln3 = TRUE;
                }
                else {
                    nowCell.img4.image = [UIImage imageNamed:@"cocktail.png"];
                }
            }
        }
    }
    nowCell.selectionStyle = UITableViewCellSelectionStyleGray;
    nowCell.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttonselect.png"]] autorelease];
    [[nowCell lblEstablishment] setText:[[happyHours objectAtIndex:indexPath.row] title]];
    if ([self.title isEqualToString:@"Happening Now"])
    {
        [[nowCell lblDistance] setText:[NSString stringWithFormat:@"%.1f mi.", [[happyHours objectAtIndex:indexPath.row] distance]]];
        [[nowCell lblNeighborhood] setText:[[happyHours objectAtIndex:indexPath.row] subtitle]];
        [[nowCell lblSunday] setText:@""];
        [[nowCell lblMonday] setText:@""];
        [[nowCell lblTuesday] setText:@""];
        [[nowCell lblWednesday] setText:@""];
        [[nowCell lblThursday] setText:@""];
        [[nowCell lblFriday] setText:@""];
        [[nowCell lblSaturday] setText:@""];
    }
    else
    {
        if (blnNeighborhood_ParentController == TRUE)
        {
            [[nowCell lblNeighborhood] setText:@""];
            if ([[[happyHours objectAtIndex:indexPath.row] occursSunday] isEqualToString:@"TRUE"])
            {
                [[nowCell lblSunday] setTextColor:[UIColor greenColor]];
            }
            else
            {
                [[nowCell lblSunday] setTextColor:[UIColor darkGrayColor]];
            }
            if ([[[happyHours objectAtIndex:indexPath.row] occursMonday] isEqualToString:@"TRUE"])
            {
                [[nowCell lblMonday] setTextColor:[UIColor greenColor]];
            }
            else
            {
                [[nowCell lblMonday] setTextColor:[UIColor darkGrayColor]];
            }
            if ([[[happyHours objectAtIndex:indexPath.row] occursTuesday] isEqualToString:@"TRUE"])
            {
                [[nowCell lblTuesday] setTextColor:[UIColor greenColor]];
            }
            else
            {
                [[nowCell lblTuesday] setTextColor:[UIColor darkGrayColor]];
            }
            if ([[[happyHours objectAtIndex:indexPath.row] occursWednesday] isEqualToString:@"TRUE"])
            {
                [[nowCell lblWednesday] setTextColor:[UIColor greenColor]];
            }
            else
            {
                [[nowCell lblWednesday] setTextColor:[UIColor darkGrayColor]];
            }
            if ([[[happyHours objectAtIndex:indexPath.row] occursThursday] isEqualToString:@"TRUE"])
            {
                [[nowCell lblThursday] setTextColor:[UIColor greenColor]];
            }
            else
            {
                [[nowCell lblThursday] setTextColor:[UIColor darkGrayColor]];
            }
            if ([[[happyHours objectAtIndex:indexPath.row] occursFriday] isEqualToString:@"TRUE"])
            {
                [[nowCell lblFriday] setTextColor:[UIColor greenColor]];
            }
            else
            {
                [[nowCell lblFriday] setTextColor:[UIColor darkGrayColor]];
            }
            if ([[[happyHours objectAtIndex:indexPath.row] occursSaturday] isEqualToString:@"TRUE"])
            {
                [[nowCell lblSaturday] setTextColor:[UIColor greenColor]];
            }
            else
            {
                [[nowCell lblSaturday] setTextColor:[UIColor darkGrayColor]];
            }
        }
        else
        {
            [[nowCell lblNeighborhood] setText:[[happyHours objectAtIndex:indexPath.row] subtitle]];
            [[nowCell lblSunday] setText:@""];
            [[nowCell lblMonday] setText:@""];
            [[nowCell lblTuesday] setText:@""];
            [[nowCell lblWednesday] setText:@""];
            [[nowCell lblThursday] setText:@""];
            [[nowCell lblFriday] setText:@""];
            [[nowCell lblSaturday] setText:@""];
        }
        [[nowCell lblDistance] setText:@""];
        //Reuse the distance lable to show start time of event.
        NSString *strStartTime = [[happyHours objectAtIndex:indexPath.row] startTime];
        NSLog(@"%@", [[happyHours objectAtIndex:indexPath.row] title]);
        NSLog(@"%@", strStartTime);
        if ( [[strStartTime substringWithRange:NSMakeRange(0, 2)] intValue] > 11 )
        {
            if ([[strStartTime substringWithRange:NSMakeRange(0, 2)] intValue] == 12)
            {
                [[nowCell lblDistance] setText:[NSString stringWithFormat:@"%@ PM", strStartTime]];
            }
            else
            {
                //Starts in the afternoon, lets make it look better.
                int intTime = [[strStartTime substringWithRange:NSMakeRange(0, 2)] intValue] - 12;
                [[nowCell lblDistance] setText:[NSString stringWithFormat:@"%i%@ PM", intTime, [strStartTime substringWithRange:NSMakeRange(2, 3)]]];
            }
        }
        else
        {
            [[nowCell lblDistance] setText:[NSString stringWithFormat:@"%@ AM", strStartTime]];
        }
    }
    return nowCell;
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
    HappyHourViewController *happyHourViewController = [[HappyHourViewController alloc] init];
    happyHourViewController.happyHour = (HappyHour *)[happyHours objectAtIndex:indexPath.row];
    happyHourViewController.myLocation = self.myLocation;
    [happyHourViewController view];
    if([self.title isEqualToString:@"Happening Now"])
    {
        
    }
    else
    {
        happyHourViewController.remaining.text = @"Starting At:";
    }
    
    if(blnNeighborhood_ParentController == TRUE)
    {
        if ([[happyHourViewController.happyHour occursSunday] isEqualToString:@"TRUE"])
        {
            [[happyHourViewController lblSunday] setTextColor:[UIColor whiteColor]];
        }
        else
        {
            [[happyHourViewController lblSunday] setTextColor:[UIColor darkGrayColor]];
        }
        if ([[happyHourViewController.happyHour occursMonday] isEqualToString:@"TRUE"])
        {
            [[happyHourViewController lblMonday] setTextColor:[UIColor whiteColor]];
        }
        else
        {
            [[happyHourViewController lblMonday] setTextColor:[UIColor darkGrayColor]];
        }
        if ([[happyHourViewController.happyHour occursTuesday] isEqualToString:@"TRUE"])
        {
            [[happyHourViewController lblTuesday] setTextColor:[UIColor whiteColor]];
        }
        else
        {
            [[happyHourViewController lblTuesday] setTextColor:[UIColor darkGrayColor]];
        }
        if ([[happyHourViewController.happyHour occursWednesday] isEqualToString:@"TRUE"])
        {
            [[happyHourViewController lblWednesday] setTextColor:[UIColor whiteColor]];
        }
        else
        {
            [[happyHourViewController lblWednesday] setTextColor:[UIColor darkGrayColor]];
        }
        if ([[happyHourViewController.happyHour occursThursday] isEqualToString:@"TRUE"])
        {
            [[happyHourViewController lblThursday] setTextColor:[UIColor whiteColor]];
        }
        else
        {
            [[happyHourViewController lblThursday] setTextColor:[UIColor darkGrayColor]];
        }
        if ([[happyHourViewController.happyHour occursFriday] isEqualToString:@"TRUE"])
        {
            [[happyHourViewController lblFriday] setTextColor:[UIColor whiteColor]];
        }
        else
        {
            [[happyHourViewController lblFriday] setTextColor:[UIColor darkGrayColor]];
        }
        if ([[happyHourViewController.happyHour occursSaturday] isEqualToString:@"TRUE"])
        {
            [[happyHourViewController lblSaturday] setTextColor:[UIColor whiteColor]];
        }
        else
        {
            [[happyHourViewController lblSaturday] setTextColor:[UIColor darkGrayColor]];
        }
    }
    else
    {
        happyHourViewController.lblSunday.text = @"";
        happyHourViewController.lblMonday.text = @"";
        happyHourViewController.lblTuesday.text = @"";
        happyHourViewController.lblWednesday.text = @"";
        happyHourViewController.lblThursday.text = @"";
        happyHourViewController.lblFriday.text = @"";
        happyHourViewController.lblSaturday.text = @"";
    }
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:happyHourViewController animated:YES];
    [happyHourViewController release];
}

@end
