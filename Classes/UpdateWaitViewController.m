//
//  UpdateWaitViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "UpdateWaitViewController.h"
#import "Company.h"

@implementation UpdateWaitViewController
@synthesize company, companyName, shortWait, mediumWait, longWait;//, select;

-(IBAction)back{
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)shortWaitPress{
	
//	UID465AppDelegate * del = ((UID465AppDelegate *)([[UIApplication sharedApplication] delegate]));
//	[[del.companyList objectAtIndex:select] setWait_time:@"l"];
	[company setWait_time:@"l"];
	
	self.mediumWait.backgroundColor = [UIColor clearColor];
	self.longWait.backgroundColor = [UIColor clearColor];
	self.shortWait.backgroundColor = [UIColor blueColor];
	
}

-(IBAction)mediumWaitPress{
	[company setWait_time:@"m"];
	self.longWait.backgroundColor = [UIColor clearColor];
	self.shortWait.backgroundColor = [UIColor clearColor];
	self.mediumWait.backgroundColor = [UIColor blueColor];	
}

-(IBAction)longWaitPress{
	[company setWait_time:@"h"];
	self.mediumWait.backgroundColor = [UIColor clearColor];
	self.shortWait.backgroundColor = [UIColor clearColor];
	self.longWait.backgroundColor = [UIColor blueColor];
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	companyName.text = [company name];
	
	NSString * string = [[NSString alloc] 
					initWithString:[[self.company wait_time] 
							stringByTrimmingCharactersInSet:
									[NSCharacterSet whitespaceAndNewlineCharacterSet]]];

	if ([string isEqualToString:@"h"]) {
		self.longWait.backgroundColor = [UIColor blueColor];
	}else if([string isEqualToString:@"m"]){
		self.mediumWait.backgroundColor = [UIColor blueColor];
	}else{
		self.shortWait.backgroundColor = [UIColor blueColor];
	}
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
