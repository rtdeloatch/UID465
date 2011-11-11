//
//  CompanyInformationViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/4/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "QuartzCore/QuartzCore.h"
#import "CompanyInformationViewController.h"
#import "Company.h"
#import "Person.h"

@implementation CompanyInformationViewController
@synthesize company, scrollView, name, majors, about, location, gpa, citizenship, freshman, sophomore, junior, senior, gradstudent;
@synthesize me, myCompanies, didCreatePlan;

-(IBAction)back{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		[self.myCompanies addObject:self.company];
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Added"
														 message:@"Company has been added!" 
														delegate:nil
											   cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
		[alert show];
		[self.didCreatePlan addObject:[[NSString alloc] initWithString:@"NO"]];
	}
}

-(IBAction)add{
	//They haven't filled out person
	if ([self.myCompanies containsObject:self.company]) {
		[self.myCompanies addObject:self.company];
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Can not add"
														 message:@"This company is already in your plan." 
														delegate:nil
											   cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
		[alert show];
	}
	else if (self.me.gpa <= 0) {
		//You should create a plan before adding companies
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Create a Plan"
														 message:@"You must create a plan before adding companies to it!"
														delegate:nil 
											   cancelButtonTitle:@"OK"
											   otherButtonTitles:nil] autorelease];
		[alert show];
		//Should checkk other besides gpa ADD YEAR
	}else if (self.me.gpa < self.company.gpa || 
			  [[self.me.maj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
			   rangeOfString:([self.me.maj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])
				].location == NSNotFound) { //You don't meet the criteria for the company
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Unmet Qualifications"
														 message:@"You do not meet the qualifications for this company. Do you still want to add this company?"
														delegate:self 
											   cancelButtonTitle:@"Yes"
											   otherButtonTitles:@"No", nil] autorelease];
		[alert show];
	}
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
	[scrollView setScrollEnabled:YES];
	[scrollView setContentSize:CGSizeMake(320, 875)];
	
    about.layer.cornerRadius = 10.0;
    about.clipsToBounds = YES;
    majors.layer.cornerRadius = 10.0;
    majors.clipsToBounds = YES;
    
	name.text = self.company.name;
	majors.text = self.company.majors;
    location.text = self.company.location;
    gpa.text = [NSString stringWithFormat:@"%g", self.company.gpa];
    citizenship.text = self.company.citizenship;
    
    //NSLog(self.company.name);
    //NSLog(@"%@\n", (self.company.freshman ? @"YES" : @"NO"));
    //NSLog(@"%@\n", (self.company.sophomore ? @"YES" : @"NO"));
    //NSLog(@"%@\n", (self.company.junior ? @"YES" : @"NO"));
    //NSLog(@"%@\n", (self.company.senior ? @"YES" : @"NO"));
    //NSLog(@"%@\n", (self.company.gradstudent ? @"YES" : @"NO"));
    
    if(self.company.freshman == false)
    {
        freshman.text = @"X";
        freshman.textColor = [UIColor redColor];
    }
    if(self.company.sophomore == false)
    {
        sophomore.text = @"X";
        sophomore.textColor = [UIColor redColor];
    }
    if(self.company.junior == false)
    {
        junior.text = @"X";
        junior.textColor = [UIColor redColor];
    }
    if(self.company.senior == false)
    {
        senior.text = @"X";
        senior.textColor = [UIColor redColor];
    }
    if(self.company.gradstudent == false)
    {
        gradstudent.text = @"X";
        gradstudent.textColor = [UIColor redColor];
    }
    
    //about.scrollEnabled = NO;
    //about.userInteractionEnabled = NO;
    about.text = self.company.about;
    //[about setFrame:CGRectMake(0.0, 0.0, 320.0, about.contentSize.height)];
    [about sizeToFit];
    
    
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
