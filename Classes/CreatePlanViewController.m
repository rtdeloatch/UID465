//
//  CreatePlanViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/4/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "CreatePlanViewController.h"
#import "QualifyingCompaniesViewController.h"
#import "Company.h"
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
	
    NSString * temp_major = self.majorField.text;
    NSString * temp_year = self.yearField.text;
	double temp_gpa = [self.gpaField.text doubleValue];
    NSString * temp_citizen;
    
    if(self.citizenField.selectedSegmentIndex == 0)
    {
        temp_citizen = @"Yes";
    }
    if(self.citizenField.selectedSegmentIndex == 1)
    {
        temp_citizen = @"No";
    }
	
	self.person.gpa = temp_gpa;
    self.person.maj = temp_major;
    self.person.year = temp_year;
    self.person.citizen = temp_citizen;
    
    NSLog(temp_major);
    //NSLog(temp_year);
    //NSLog(@"%f\n", temp_gpa);
    //NSLog(temp_citizen);
    
    NSLog(self.person.maj);
	
	qualifyView.myCompanies = self.myCompanies;//[[NSMutableArray alloc] init];
	[qualifyView.myCompanies removeAllObjects];
	
	for (int i = 0; i < [self.companyList count]; i++)
    {
		if (([self.person gpa] >= [[self.companyList objectAtIndex:i] gpa])
            && ([[[[self.companyList objectAtIndex:i] majors] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] rangeOfString:([[self.person maj] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])].location != NSNotFound)
            &&  ([[[[self.companyList objectAtIndex:i] years] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] rangeOfString:([[self.person year] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])].location != NSNotFound)
            && ([[[[self.companyList objectAtIndex:i] citizenship] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] rangeOfString:([[self.person citizen] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])].location != NSNotFound)
            )
        {
            NSLog([[self.companyList objectAtIndex:i] name]);
            NSLog([[self.companyList objectAtIndex:i] majors]);
            NSLog([[self.companyList objectAtIndex:i] years]);
            NSLog(@"%f\n", [[self.companyList objectAtIndex:i] gpa]);
			
            
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
/**
- (void)viewDidLoad 
{
    [super viewDidLoad];
    
}
**/

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

/*
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField{
	
	CGRect frame = CGRectMake(0, 240, 200, 400);
	
	UIPickerView * picker = [[UIPickerView alloc] initWithFrame:frame];
	picker.delegate = self;
	picker.dataSource = self;
	[self.view addSubview:picker];
	[picker release];
	return NO;
}
*/

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
