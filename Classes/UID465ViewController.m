//
//  UID465ViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright UMBC 2011. All rights reserved.
//

#import "UID465ViewController.h"
#import "ViewCompaniesViewContoller.h"
#import "WaitTimeViewController.h"
#import "CreatePlanViewController.h"
#import "Company.h"


@implementation UID465ViewController

@synthesize viewCompaniesViewController, waitTimeViewController, myCompanies, companyList;
@synthesize createPlanViewController;


-(IBAction)viewCompanies{
	ViewCompaniesViewContoller * companiesView = [[ViewCompaniesViewContoller alloc] initWithNibName:nil
																							  bundle:nil];
	companiesView.companyList = self.companyList;
	[self presentModalViewController:companiesView animated:YES];
}

-(IBAction)viewWaitTime{
	WaitTimeViewController * waitView = [[WaitTimeViewController alloc] initWithNibName:nil bundle:nil];
	waitView.companyList = self.companyList;
	[self presentModalViewController:waitView animated:YES];
}

-(IBAction)createPlan{
	CreatePlanViewController * createPlanView = [[CreatePlanViewController alloc] initWithNibName:nil bundle:nil];
	createPlanView.companyList = self.companyList;
	[self presentModalViewController:createPlanView animated:YES];
}

-(IBAction)updatePosition{
	
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.companyList = [NSArray arrayWithObjects:[Company companyWithName:@"Apple" location:@"A7"],
						[Company companyWithName:@"Microsoft" location:@"B5"],
						[Company companyWithName:@"Sun Microsystems" location:@"J7"],
						[Company companyWithName:@"Geico" location:@"C7"],
						[Company companyWithName:@"Aflac" location:@"F3"],
						[Company companyWithName:@"DropBox" location:@"C1"],
						[Company companyWithName:@"Box.net" location:@"C4"],
						[Company companyWithName:@"Yahoo" location:@"A2"],
						[Company companyWithName:@"Google" location:@"B2"],
						[Company companyWithName:@"MSN" location:@"B2"],
						[Company companyWithName:@"Cisco" location:@"B2"],
						nil];
	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
