//
//  CreditsTableViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/9/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import "CreditsTableViewController.h"
#import "CreditsTableViewCell.h"
#import "CreditsViewController.h"

@implementation CreditsTableViewController

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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor grayColor];
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
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 144;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomShiftCellIdentifier = @"CreditsTableViewCell";
    CreditsTableViewCell *creditsCell = (CreditsTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomShiftCellIdentifier];
    if (creditsCell == nil) 
    { 
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CreditsTableViewCell"
                                                     owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[CreditsTableViewCell class]])
            creditsCell = (CreditsTableViewCell *)oneObject;
        
    } 
    
    if (indexPath.row == 0)
    {
        creditsCell.imgCredit.image = [UIImage imageNamed:@"Button_Sarah.png"];
    }
    if (indexPath.row == 1)
    {
        creditsCell.imgCredit.image = [UIImage imageNamed:@"Button_Jeff.png"];
    }
    if (indexPath.row == 2)
    {
        creditsCell.imgCredit.image = [UIImage imageNamed:@"Button_Gina.png"];
    }
    return creditsCell;
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
    if (indexPath.row == 0)
    {
        CreditsViewController *creditViewController = [[CreditsViewController alloc] init];
        creditViewController.title = @"Sarah Powers";
        [creditViewController view];
        creditViewController.imgCredit.image = [UIImage imageNamed:@"Sarah_Profile.png"];
        creditViewController.profileInformation.text = @"Sarah is a freelance graphic designer born and raised in Louisville KY.  She continues to pursue excellence in design, and is eager to work with local organizations on their projects.  In her free time she follows up on design blogs, hangs with her cat Odell, and further hones her design skills.";
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self.navigationController pushViewController:creditViewController animated:YES];
        [creditViewController release];
    }
    if (indexPath.row == 1)
    {
        CreditsViewController *creditViewController = [[CreditsViewController alloc] init];
        creditViewController.title = @"Jeff Jackson";
        [creditViewController view];
        creditViewController.imgCredit.image = [UIImage imageNamed:@"Jeff_Profile.png"];
        creditViewController.profileInformation.text = @"Jeff is a business owner in Louisville KY delivering productivity apps and services to local manufacturers.  He is a lean consultant with a background in software and engineering management. \n\nHis passions are clean code, the outdoors, live music, and coffee.";
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self.navigationController pushViewController:creditViewController animated:YES];
        [creditViewController release];
    }
    if (indexPath.row == 2)
    {
        CreditsViewController *creditViewController = [[CreditsViewController alloc] init];
        creditViewController.title = @"Gina Collecchia";
        [creditViewController view];
        creditViewController.imgCredit.image = [UIImage imageNamed:@"Gina_Profile.png"];
        creditViewController.profileInformation.text = @"Gina is a researcher, designer, and programmer living in Louisville, KY, specializing in music technology. Her accomplishments spread from authorship of scientific texts to acoustic physical modeling to electronic music composition. Gina prefers sushi to most everything.";
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self.navigationController pushViewController:creditViewController animated:YES];
        [creditViewController release];
    }
}

@end
