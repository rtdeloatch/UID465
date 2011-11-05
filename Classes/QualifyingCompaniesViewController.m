//
//  QualifyingCompaniesViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/5/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "QualifyingCompaniesViewController.h"


@implementation QualifyingCompaniesViewController
@synthesize companyList;

-(IBAction)back{
	[self dismissModalViewControllerAnimated:YES];
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
	[self setEditing:YES animated:NO];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

//Specifies the number of rows in a given section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.companyList count];
}

//Number of sections in table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

//Appearance of Table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Default";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:CellIdentifier] autorelease];
	}
    
	[cell setShowsReorderControl:YES];
	
	// Configure the cell.
	cell.textLabel.text = [[self.companyList objectAtIndex:indexPath.row] name];
	return cell;
}

//Support rearranging the table view
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
	  toIndexPath:(NSIndexPath *)toIndexPath{
	
}

/*
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    // Navigation logic may go here -- for example, create and push another view controller.
	
	
	CompanyInformationViewController * companyInfoView = [[CompanyInformationViewController alloc] initWithNibName:nil
																											bundle:nil];
	companyInfoView.company = [self.companyList objectAtIndex:indexPath.row];
	[self presentModalViewController:companyInfoView animated:YES];
	//[self.navigationController pushViewController:updateWaitView animated:YES];
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
