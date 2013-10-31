//
//  ThirdViewController.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/9/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import "ThirdViewController.h"
#import <MessageUI/MessageUI.h>

@implementation ThirdViewController
@synthesize imgAdvertisement;
@synthesize btnAdvertisement;

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

#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated {
    if (self.imgAdvertisement.tag == 0)
    {
        btnAdvertisement.enabled = TRUE;
    }
    else
    {
        btnAdvertisement.enabled = FALSE;
        UIBarButtonItem *sendEmailButton = [[UIBarButtonItem alloc] initWithTitle:@"Get Featured" style:UIBarButtonItemStylePlain target:self action:@selector(requestAdvertising:)]; 
        sendEmailButton.style = UIBarButtonItemStyleBordered;
        self.navigationItem.rightBarButtonItem = sendEmailButton;
        [sendEmailButton release];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)requestAdvertising:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailViewController = [[[MFMailComposeViewController alloc] init] autorelease];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"Advertisement Inquiry"];
        
        NSString *emailMessageBody = [NSString stringWithFormat:@"Hello, please contact me at your earliest convenience regarding advertisement pricing on Louisville Lush."];
        
        [mailViewController setMessageBody:emailMessageBody isHTML:YES];
        NSMutableArray *arrayRecipients = [[NSMutableArray alloc] init];
        [arrayRecipients addObject:@"team@louisvillelush.com"];
        [mailViewController setToRecipients:arrayRecipients];
        [self presentModalViewController:mailViewController animated:YES];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    if (self.imgAdvertisement.tag == 0)
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    else
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

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
