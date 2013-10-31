//
//  NeighborhoodTableViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 11/16/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//

#import "NeighborhoodTableViewController.h"
#import "DayOfWeekTableCell.h"
#import "SelectionTableViewController.h"
#import "HappyHour.h"

@implementation NeighborhoodTableViewController
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
    self.title = @"Neighborhoods";
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
    return 17;
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
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Bowman Field.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_BowmanField count]];
            break;
        case 1:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Butchertown.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Butchertown count]];
            break;
        case 2:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Clifton.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Clifton count]];
            break;
        case 3:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Downtown.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Downtown count]];
            break;
        case 4:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"East End.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_EastEnd count]];
            break;
        case 5:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Germantown.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Germantown count]];
            break;
        case 6:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Harrods Creek.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_HarrodsCreek count]];
            break;
        case 7:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Highlands.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Highlands count]];
            break;
        case 8:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Jeffersontown.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Jeffersontown count]];
            break;
        case 9:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Middletown.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Middletown count]];
            break;
        case 10:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"New Albany.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_NewAlbany count]];
            break;
        case 11:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Okolona.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Okolona count]];
            break;
        case 12:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Old Louisville.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_OldLouisville count]];
            break;
        case 13:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Prospect.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Prospect count]];
            break;
        case 14:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"South End.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_SouthEnd count]];
            break;
        case 15:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"St Matthews.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_StMatthews count]];
            break;
        case 16:
            menuOptionCell.imgDay.image = [UIImage imageNamed:@"Westport.png"];
            menuOptionCell.lblCount.text = [NSString stringWithFormat:@"%i specials", [happyHours_Westport count]];
            break;
        default:
            break;
    }
    return menuOptionCell;}

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
        for (i = 0; i < [happyHours_BowmanField count]; ++i) 
        {
            id myArrayElement = [happyHours_BowmanField objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_BowmanField objectAtIndex:i] latitude] longitude:(double)[[happyHours_BowmanField objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_BowmanField sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_BowmanField removeAllObjects];
        [happyHours_BowmanField addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_BowmanField;
        happyHours_Selection.title = @"Bowman Field";
    }
    if (indexPath.row == 1)
    {
        int i;
        for (i = 0; i < [happyHours_Butchertown count]; ++i) 
        {
            id myArrayElement = [happyHours_Butchertown objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Butchertown objectAtIndex:i] latitude] longitude:(double)[[happyHours_Butchertown objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Butchertown sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Butchertown removeAllObjects];
        [happyHours_Butchertown addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Butchertown;
        happyHours_Selection.title = @"Butchertown";
    }
    if (indexPath.row == 2)
    {
        int i;
        for (i = 0; i < [happyHours_Clifton count]; ++i) 
        {
            id myArrayElement = [happyHours_Clifton objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Clifton objectAtIndex:i] latitude] longitude:(double)[[happyHours_Clifton objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Clifton sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Clifton removeAllObjects];
        [happyHours_Clifton addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Clifton;
        happyHours_Selection.title = @"Clifton";
    }
    if (indexPath.row == 3)
    {
        int i;
        for (i = 0; i < [happyHours_Downtown count]; ++i) 
        {
            id myArrayElement = [happyHours_Downtown objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Downtown objectAtIndex:i] latitude] longitude:(double)[[happyHours_Downtown objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Downtown sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Downtown removeAllObjects];
        [happyHours_Downtown addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Downtown;
        happyHours_Selection.title = @"Downtown";
    }
    if (indexPath.row == 4)
    {
        int i;
        for (i = 0; i < [happyHours_EastEnd count]; ++i) 
        {
            id myArrayElement = [happyHours_EastEnd objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_EastEnd objectAtIndex:i] latitude] longitude:(double)[[happyHours_EastEnd objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_EastEnd sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_EastEnd removeAllObjects];
        [happyHours_EastEnd addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_EastEnd;
        happyHours_Selection.title = @"East End";
    }
    if (indexPath.row == 5)
    {
        int i;
        for (i = 0; i < [happyHours_Germantown count]; ++i) 
        {
            id myArrayElement = [happyHours_Germantown objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Germantown objectAtIndex:i] latitude] longitude:(double)[[happyHours_Germantown objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Germantown sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Germantown removeAllObjects];
        [happyHours_Germantown addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Germantown;
        happyHours_Selection.title = @"Germantown";
    }
    if (indexPath.row == 6)
    {
        int i;
        for (i = 0; i < [happyHours_HarrodsCreek count]; ++i) 
        {
            id myArrayElement = [happyHours_HarrodsCreek objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_HarrodsCreek objectAtIndex:i] latitude] longitude:(double)[[happyHours_HarrodsCreek objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_HarrodsCreek sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_HarrodsCreek removeAllObjects];
        [happyHours_HarrodsCreek addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_HarrodsCreek;
        happyHours_Selection.title = @"Harrods Creek";
    }
    if (indexPath.row == 7)
    {
        int i;
        for (i = 0; i < [happyHours_Highlands count]; ++i) 
        {
            id myArrayElement = [happyHours_Highlands objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Highlands objectAtIndex:i] latitude] longitude:(double)[[happyHours_Highlands objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Highlands sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Highlands removeAllObjects];
        [happyHours_Highlands addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Highlands;
        happyHours_Selection.title = @"Highlands";
    }
    if (indexPath.row == 8)
    {
        int i;
        for (i = 0; i < [happyHours_Jeffersontown count]; ++i) 
        {
            id myArrayElement = [happyHours_Jeffersontown objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Jeffersontown objectAtIndex:i] latitude] longitude:(double)[[happyHours_Jeffersontown objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Jeffersontown sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Jeffersontown removeAllObjects];
        [happyHours_Jeffersontown addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Jeffersontown;
        happyHours_Selection.title = @"Jeffersontown";
    }
    if (indexPath.row == 9)
    {
        int i;
        for (i = 0; i < [happyHours_Middletown count]; ++i) 
        {
            id myArrayElement = [happyHours_Middletown objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Middletown objectAtIndex:i] latitude] longitude:(double)[[happyHours_Middletown objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Middletown sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Middletown removeAllObjects];
        [happyHours_Middletown addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Middletown;
        happyHours_Selection.title = @"Middletown";
    }
    if (indexPath.row == 10)
    {
        int i;
        for (i = 0; i < [happyHours_NewAlbany count]; ++i) 
        {
            id myArrayElement = [happyHours_NewAlbany objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_NewAlbany objectAtIndex:i] latitude] longitude:(double)[[happyHours_NewAlbany objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_NewAlbany sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_NewAlbany removeAllObjects];
        [happyHours_NewAlbany addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_NewAlbany;
        happyHours_Selection.title = @"New Albany";
    }
    if (indexPath.row == 11)
    {
        int i;
        for (i = 0; i < [happyHours_Okolona count]; ++i) 
        {
            id myArrayElement = [happyHours_Okolona objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Okolona objectAtIndex:i] latitude] longitude:(double)[[happyHours_Okolona objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Okolona sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Okolona removeAllObjects];
        [happyHours_Okolona addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Okolona;
        happyHours_Selection.title = @"Okolona";
    }
    if (indexPath.row == 12)
    {
        int i;
        for (i = 0; i < [happyHours_OldLouisville count]; ++i) 
        {
            id myArrayElement = [happyHours_OldLouisville objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_OldLouisville objectAtIndex:i] latitude] longitude:(double)[[happyHours_OldLouisville objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_OldLouisville sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_OldLouisville removeAllObjects];
        [happyHours_OldLouisville addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_OldLouisville;
        happyHours_Selection.title = @"Old Louisville";
    }
    if (indexPath.row == 13)
    {
        int i;
        for (i = 0; i < [happyHours_Prospect count]; ++i) 
        {
            id myArrayElement = [happyHours_Prospect objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Prospect objectAtIndex:i] latitude] longitude:(double)[[happyHours_Prospect objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Prospect sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Prospect removeAllObjects];
        [happyHours_Prospect addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Prospect;
        happyHours_Selection.title = @"Prospect";
    }
    if (indexPath.row == 14)
    {
        int i;
        for (i = 0; i < [happyHours_SouthEnd count]; ++i) 
        {
            id myArrayElement = [happyHours_SouthEnd objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_SouthEnd objectAtIndex:i] latitude] longitude:(double)[[happyHours_SouthEnd objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_SouthEnd sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_SouthEnd removeAllObjects];
        [happyHours_SouthEnd addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_SouthEnd;
        happyHours_Selection.title = @"South End";
    }
    if (indexPath.row == 15)
    {
        int i;
        for (i = 0; i < [happyHours_StMatthews count]; ++i) 
        {
            id myArrayElement = [happyHours_StMatthews objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_StMatthews objectAtIndex:i] latitude] longitude:(double)[[happyHours_StMatthews objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_StMatthews sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_StMatthews removeAllObjects];
        [happyHours_StMatthews addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_StMatthews;
        happyHours_Selection.title = @"St Matthews";
    }
    if (indexPath.row == 16)
    {
        int i;
        for (i = 0; i < [happyHours_Westport count]; ++i) 
        {
            id myArrayElement = [happyHours_Westport objectAtIndex:i];
            CLLocation *locationHappyHour = [[CLLocation alloc] initWithLatitude:(double)[[happyHours_Westport objectAtIndex:i] latitude] longitude:(double)[[happyHours_Westport objectAtIndex:i] longitude]];
            CLLocationDistance distToHappyHour = [self.myLocation distanceFromLocation:locationHappyHour];
            [myArrayElement setDistance:distToHappyHour*0.000621371192]; //convert meters to miles
        }
        NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey: @"title" ascending: YES] autorelease];
        NSArray *sortedArray = (NSMutableArray *)[happyHours_Westport sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];
        [happyHours_Westport removeAllObjects];
        [happyHours_Westport addObjectsFromArray: sortedArray];
        happyHours_Selection.happyHours = happyHours_Westport;
        happyHours_Selection.title = @"Westport";
    }
    happyHours_Selection.blnNeighborhood_ParentController = TRUE;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:happyHours_Selection animated:YES];
    [happyHours_Selection release];

}

@end
