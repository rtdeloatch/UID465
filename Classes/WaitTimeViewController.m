//
//  WaitTimeViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "WaitTimeViewController.h"
#import "Company.h"
#import "UpdateWaitViewController.h"

@implementation WaitTimeViewController
@synthesize companyList, didCreatePlan, sortedCompanies;//, updateWaitViewController;//, company;

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

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	NSSortDescriptor *sortDes;
	sortDes = [[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES] autorelease];
	NSArray * newSortDes = [NSArray arrayWithObject:sortDes];
	self.sortedCompanies = [self.companyList sortedArrayUsingDescriptors:newSortDes];
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
	return [self.sortedCompanies count];
//	UID465AppDelegate * del = ((UID465AppDelegate *)([[UIApplication sharedApplication] delegate]));
//	return [del.companyList count];
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
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
    
	// Configure the cell.
//	UID465AppDelegate * del = ((UID465AppDelegate *)([[UIApplication sharedApplication] delegate]));
	cell.textLabel.text = [[self.sortedCompanies objectAtIndex:indexPath.row] name];
//	cell.textLabel.text = [[del.companyList objectAtIndex:indexPath.row] name];
	return cell;
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    // Navigation logic may go here -- for example, create and push another view controller.
	
//	self.company = [self.companyList objectAtIndex:indexPath.row];
//	self.personLoan.loan = self.loan;
	
//	self.personLoan.personsTotalLoans = [NSMutableArray array];

	UpdateWaitViewController * updateWaitView = [[UpdateWaitViewController alloc] initWithNibName:nil
																						bundle:nil];
//	UID465AppDelegate * del = ((UID465AppDelegate *)([[UIApplication sharedApplication] delegate]));
//	updateWaitView.select = indexPath.row;

//	[del.companyList objectAtIndex:indexPath.row];//
	updateWaitView.company = [self.sortedCompanies objectAtIndex:indexPath.row];
	updateWaitView.didCreatePlan = self.didCreatePlan;
	[self presentModalViewController:updateWaitView animated:YES];

	//[self.navigationController pushViewController:updateWaitView animated:YES];
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
