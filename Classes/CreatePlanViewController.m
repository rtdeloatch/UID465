//
//  CreatePlanViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/4/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "CreatePlanViewController.h"
#import "QualifyingCompaniesViewController.h"
#import "Person.h"
#import "UID465ViewController.h"

@implementation CreatePlanViewController
@synthesize companyList, myCompanies, majorField, yearField, gpaField, citizenField, person;
@synthesize mainView;

-(IBAction)back{
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)generateQualifyList{
	QualifyingCompaniesViewController * qualifyView = 
	[[QualifyingCompaniesViewController alloc] initWithNibName:nil bundle:nil];
	
	self.person = [[[Person alloc] init] autorelease];
	
	double gpaDouble = [self.gpaField.text doubleValue];
	
	self.person.gpa = gpaDouble;
	

	qualifyView.myCompanies = self.myCompanies;//[[NSMutableArray alloc] init];
	[qualifyView.myCompanies removeAllObjects];
	
	for (int i = 0; i < [self.companyList count]; i++) {
		if ([self.person gpa] >= [[self.companyList objectAtIndex:i] gpa]) {
			[qualifyView.myCompanies addObject:[self.companyList objectAtIndex:i]];
		}
	}
	
	
	//qualifyView.myCompanies = [NSMutableArray arrayWithArray:self.companyList];
	qualifyView.mainView = self.mainView;
	[self presentModalViewController:qualifyView animated:YES];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView 
numberOfRowsInComponent:(NSInteger)component{
	return 1;
}

- (UIView *)pickerView:(UIPickerView *)pickerView 
			viewForRow:(NSInteger)row 
		  forComponent:(NSInteger)component 
		   reusingView:(UIView *)view{
	CGRect frame = CGRectMake(0, 0, 100, 400);
	UILabel * test = [[UILabel alloc] initWithFrame:frame];
	[test setText:@"hi"];
	return test;
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField{
	
	CGRect frame = CGRectMake(0, 240, 200, 400);
	
	UIPickerView * picker = [[UIPickerView alloc] initWithFrame:frame];
	picker.delegate = self;
	picker.dataSource = self;
	[self.view addSubview:picker];
	[picker release];
	return NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}


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
