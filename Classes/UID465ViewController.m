//
//  UID465ViewController.m
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright UMBC 2011. All rights reserved.
//

#include <stdio.h>

#import "UID465ViewController.h"
#import "ViewCompaniesViewContoller.h"
#import "WaitTimeViewController.h"
#import "CreatePlanViewController.h"
#import "Company.h"
#import "Person.h"
#import "DDFileReader.h"


@implementation UID465ViewController

@synthesize viewCompaniesViewController, waitTimeViewController, myCompanies, companyList, currentBoothPos;
@synthesize createPlanViewController, map, me, mainView, toolbar, createPlanButton, updatePositionButton, didCreatePlan;


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
	return mainView;
}


-(IBAction)viewCompanies{
	ViewCompaniesViewContoller * companiesView = [[ViewCompaniesViewContoller alloc] initWithNibName:nil
																							  bundle:nil];
	companiesView.companyList = self.companyList;
	companiesView.myCompanies = self.myCompanies;
	companiesView.me = self.me;
	companiesView.didCreatePlan = self.didCreatePlan;
	[self presentModalViewController:companiesView animated:YES];
}

-(IBAction)viewWaitTime{
	WaitTimeViewController * waitView = [[WaitTimeViewController alloc] initWithNibName:nil bundle:nil];
	waitView.companyList = self.companyList;
	waitView.didCreatePlan = self.didCreatePlan;
	[self presentModalViewController:waitView animated:YES];
}

-(IBAction)createPlan{
	CreatePlanViewController * createPlanView = [[CreatePlanViewController alloc] initWithNibName:nil bundle:nil];
	createPlanView.companyList = self.companyList;
	createPlanView.myCompanies = self.myCompanies;
	createPlanView.mainView = self;
	createPlanView.didCreatePlan = self.didCreatePlan;
	createPlanView.me = self.me;
	[self presentModalViewController:createPlanView animated:YES];
}

-(void)previousCompany:(id)sender{
	//CreatePlanViewController * createPlanView = [[CreatePlanViewController alloc] initWithNibName:nil bundle:nil];
	//createPlanView.companyList = self.companyList;
	//createPlanView.myCompanies = self.myCompanies;
	//createPlanView.mainView = self;
	//[self presentModalViewController:createPlanView animated:YES];
	//NSLog(@"HelloMoto");
	[self draw:1 start:NO];
}

-(void)dummyMethod:(id)sender
{
    
}

-(void)leftB:(id)sender
{
	//Meaning we are at the beginning of the list
    if (self.currentBoothPos == [self.myCompanies count]-1){
		self.currentBoothPos--;
		NSString * buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos] name];
        UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
                                                                      style:UIBarButtonItemStyleDone 
                                                                     target:self
                                                                     action:@selector(leftB:)] autorelease];
		
		buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos+1] name];
        UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
																	   style:UIBarButtonItemStyleDone 
																	  target:self
																	  action:@selector(rightB:)] autorelease];
        
		
        NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
        [toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
        [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];
        toolbar.items = toolbarItems;
		[self draw:self.currentBoothPos start:NO];
	}else if ((self.currentBoothPos < [self.myCompanies count]-1) && 
			  (self.currentBoothPos > 0)) {
		self.currentBoothPos--;
		NSString * buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos] name];
        UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
                                                                      style:UIBarButtonItemStyleDone 
                                                                     target:self
                                                                     action:@selector(leftB:)] autorelease];
		
		buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos+1] name];
        UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
																	   style:UIBarButtonItemStyleDone 
																	  target:self
																	  action:@selector(rightB:)] autorelease];
        
		
        NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
        [toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
        [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];
        toolbar.items = toolbarItems;
		[self draw:self.currentBoothPos start:NO];
	}else if (self.currentBoothPos == 0) {
		self.currentBoothPos--;
        UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:@"" 
                                                                      style:UIBarButtonItemStylePlain 
                                                                     target:self
                                                                     action:@selector(dummyMethod:)] autorelease];

		NSString * buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos+1] name];
        UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName
																	   style:UIBarButtonItemStyleDone 
																	  target:self
																	  action:@selector(rightB:)] autorelease];
        
		
        NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
        [toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
        [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];
        toolbar.items = toolbarItems;
		[self draw:self.currentBoothPos start:NO];
	}
	
    
}

-(void)rightB:(id)sender
{
	//Meaning we are at the beginning of the list
    if (self.currentBoothPos == -1){
		self.currentBoothPos++;
		NSString * buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos] name];
        UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
                                                                      style:UIBarButtonItemStyleDone 
                                                                     target:self
                                                                     action:@selector(leftB:)] autorelease];
		
		buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos+1] name];
        UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
																	   style:UIBarButtonItemStyleDone 
																	  target:self
																	  action:@selector(rightB:)] autorelease];
        
		
        NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
        [toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
        [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];
        toolbar.items = toolbarItems;
		[self draw:self.currentBoothPos start:NO];
	}else if ((self.currentBoothPos > -1) && (self.currentBoothPos < [self.myCompanies count]-2)) {
		self.currentBoothPos++;
		NSString * buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos] name];
        UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
                                                                      style:UIBarButtonItemStyleDone 
                                                                     target:self
                                                                     action:@selector(leftB:)] autorelease];
		
		buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos+1] name];
        UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
																	   style:UIBarButtonItemStyleDone 
																	  target:self
																	  action:@selector(rightB:)] autorelease];
        
		
        NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
        [toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
        [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];
        toolbar.items = toolbarItems;
		[self draw:self.currentBoothPos start:NO];
	}else if (self.currentBoothPos == [self.myCompanies count]-2) {
		self.currentBoothPos++;
		NSString * buttonName = [[self.myCompanies objectAtIndex:self.currentBoothPos] name];
        UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
                                                                      style:UIBarButtonItemStyleDone 
                                                                     target:self
                                                                     action:@selector(leftB:)] autorelease];
		
        UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:@"" 
																	   style:UIBarButtonItemStylePlain 
																	  target:self
																	  action:@selector(dummyMethod:)] autorelease];
        
		
        NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
        [toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
        [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];
        toolbar.items = toolbarItems;
		[self draw:self.currentBoothPos start:NO];
	}
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
 [super viewDidLoad];
 CGRect frame = CGRectMake(0, 0, 320, 480);
 self.view = [[UIView alloc] initWithFrame:frame];
 self.view.backgroundColor = [UIColor darkGrayColor];
 
 self.bottomBar = [[UIToolbar alloc] init];
 [self.bottomBar sizeToFit];
 }*/


-(void)updateBottomBar{
	self.currentBoothPos = -1;
	NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
	UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:@"" 
																  style:UIBarButtonItemStylePlain 
																 target:self
																 action:@selector(leftB:)] autorelease];
    
   // self.currentBoothPos = 0;
    NSString * buttonName = [[self.myCompanies objectAtIndex:0] name];
    
    UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:buttonName 
                                                                   style:UIBarButtonItemStyleDone 
                                                                  target:self
                                                                  action:@selector(rightB:)] autorelease];
    
	[toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
    [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];	
	
	toolbar.items = toolbarItems;
}


-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];

	if ([self.didCreatePlan count] == 1 &&
		 [[self.didCreatePlan objectAtIndex:0] isEqualToString:@"YES"]) {
		NSLog(@"Did create plan");
		[self.didCreatePlan removeAllObjects];
		[self updateBottomBar];
		[self draw:-2 start:NO]; //what vlaue?
		//POSSIBLY have an elseif that changes the didcreatePlan to domething else to know it's from
		//a button press
	}else if ([self.didCreatePlan count] == 1) {
		[self.didCreatePlan removeAllObjects];
		if (self.currentBoothPos == -1) {
			[self draw:self.currentBoothPos start:YES];			
		}else {
			[self draw:self.currentBoothPos start:NO];
		}

	} else{
		NSLog(@"Did not create plan");
		if ([self.myCompanies count] == 0) {
			self.currentBoothPos = -1;
			[self draw:-1 start:YES];
		}else {
			
		}

	}
}

/*Function will need more parameters to allow the main view to only be drawn once*/
/*Maybe pass the views and frames and then push them??*/
-(void)draw:(NSInteger) currPosition start:(BOOL)begin{
	map.contentSize = CGSizeMake(640, 750);
	CGRect myFrame = CGRectMake(0, 0, 640, 750);
	UIView * backgroundView = [[UIView alloc] initWithFrame:myFrame];
	backgroundView.backgroundColor = [UIColor grayColor];
	
	NSString * currCompany;
	if (!begin && (currPosition > -1)) {
		currCompany = [[NSString alloc] initWithString:[[self.myCompanies objectAtIndex:currPosition] name]];
	}
	
	
	int table_width = 100;
	int table_height = 50;
	int aisle_y = 50;
	int offset = 70;
	int index = 0;
	for (int sections = 0; sections < 4; sections++) {
		for (int row = 0; row < 2; row++) {
			for (int i = 0; i < 5; i++) {		
				myFrame = CGRectMake((i*table_width) + offset, aisle_y, table_width, table_height);
				UIView * booth1 = [[UIView alloc] initWithFrame:myFrame];
				CGRect frameLabel = CGRectMake(10, 10, 90, 50);
				UILabel * nameLab = [[UILabel alloc] initWithFrame:frameLabel];
				nameLab.backgroundColor = [UIColor clearColor];
				nameLab.text = [[self.companyList objectAtIndex:index] name];
				
				
				myFrame = CGRectMake(20, 0, 38, 38);
				//Works
				
				UIImage * img = [[UIImage alloc] initWithContentsOfFile:@"/Users/robertdeloatch/UID465/gps.png"];
				UIImageView * dot = [[UIImageView alloc] initWithFrame:myFrame];
				[dot setImage:img];
				
				UIImage * img2 = [[UIImage alloc] initWithContentsOfFile:@"/Users/robertdeloatch/UID465/TrackingDot.png"];
				UIImageView * dot2 = [[UIImageView alloc] initWithFrame:myFrame];
				[dot2 setImage:img2];

				UIImage * img3 = [[UIImage alloc] initWithContentsOfFile:@"/Users/robertdeloatch/New_UID465/UID465/greendot.png"];
				UIImageView * dot3 = [[UIImageView alloc] initWithFrame:myFrame];
				[dot3 setImage:img3];

				for(Company * c in self.myCompanies){
					if ((!begin) && (currPosition > -1) 
						&& [[[c name] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
						 isEqualToString:[currCompany stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]
						&& [[[c name] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
							isEqualToString:[nameLab.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]) {
							[nameLab addSubview:dot3];
					}//if draw = -2
					else if ([[[c name] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
							  isEqualToString:[nameLab.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]) {
						[nameLab addSubview:dot];
					}

				}
/*				
				if ([[nameLab.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] 
					isEqualToString:@"Apple"] && currPosition == -2) {
					[nameLab addSubview:dot2];
				}
*/
				[booth1 addSubview:nameLab]; //adds comapny name to the box
				booth1.backgroundColor = [self getBackgroundColor:[self.companyList objectAtIndex:index]];
				[backgroundView addSubview:booth1];
				[booth1 release];
				index++;
			}
			aisle_y = aisle_y + 50;
		}
		aisle_y = aisle_y + 50;
	}
	
	
	
	mainView = backgroundView;
	
	[map addSubview:backgroundView];
	[backgroundView release];
	map.maximumZoomScale = 2.2;
	map.minimumZoomScale = 0.5;
	[map setZoomScale:0.5 animated:NO];
	map.clipsToBounds = YES;
	map.delegate = self;
	
	//Make the initial view
	if (begin){
        NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
        UIBarButtonItem *leftButt = [[[UIBarButtonItem alloc] initWithTitle:@"" 
																	  style:UIBarButtonItemStylePlain 
																	 target:self
																	 action:@selector(dummyMethod:)] autorelease];
        UIBarButtonItem *rightButt = [[[UIBarButtonItem alloc] initWithTitle:@"" 
																	   style:UIBarButtonItemStylePlain 
																	  target:self
                                                                      action:@selector(dummyMethod:)] autorelease];
        [toolbarItems replaceObjectAtIndex:0 withObject:leftButt];
        [toolbarItems replaceObjectAtIndex:4 withObject:rightButt];
        toolbar.items = toolbarItems;
    }else {
		NSMutableArray * toolbarItems = [[NSMutableArray arrayWithArray:toolbar.items] retain];
		UIBarButtonItem * middle = [[[UIBarButtonItem alloc] initWithTitle:@"Edit plan or position" 
																	 style:UIBarButtonItemStyleBordered
																	target:self
																	action:@selector(createPlan)] autorelease];
		[toolbarItems replaceObjectAtIndex:2 withObject:middle];
        toolbar.items = toolbarItems;
	}

}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
	/**	
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
	 **/    
	
    
    self.companyList = [self assembleCompanies];
	
	self.myCompanies = [[NSMutableArray alloc] init];
//	NSLog(@"%d", [self.companyList count]);
	self.didCreatePlan = [[NSMutableArray alloc] init];
	self.currentBoothPos = -5;
	self.me = [[[Person alloc] init] autorelease];
	/*	
	 UIImageView *temp = [[UIImageView alloc] initWithImage:[UIImage imageWithData:
	 [NSData dataWithContentsOfURL:
	 [NSURL URLWithString:@"http://www.lonelyplanet.com/maps/pacific/papua-new-guinea/map_of_papua-new-guinea.jpg"]]]];
	 [self setImage:temp];
	 */	
	//	map.contentSize = CGSizeMake(temp.frame.size.width, temp.frame.size.height);
	/*	
	 map.contentSize = CGSizeMake(700, 900);
	 CGRect myFrame = CGRectMake(0, 0, 700, 900);
	 UIView * backgroundView = [[UIView alloc] initWithFrame:myFrame];
	 backgroundView.backgroundColor = [UIColor grayColor];
	 
	 //mainView = backgroundView;
	 
	 int x = 100;
	 int y = 50;
	 int index = 0;
	 
	 for (int sections = 0; sections < 4; sections++) {
	 for (int row = 0; row < 2; row++) {
	 for (int i = 0; i < 5; i++) {
	 myFrame = CGRectMake((i*x) + x, y, 100, 50);
	 UIView * booth1 = [[UIView alloc] initWithFrame:myFrame];
	 CGRect frameLabel = CGRectMake(10, 10, 70, 30);
	 UILabel * nameLab = [[UILabel alloc] initWithFrame:frameLabel];
	 nameLab.backgroundColor = [UIColor clearColor];
	 nameLab.text = [[self.companyList objectAtIndex:index] name];
	 [booth1 addSubview:nameLab];
	 booth1.backgroundColor = [self getBackgroundColor:[self.companyList objectAtIndex:index]];
	 
	 if (i % 2 == 0) {
	 booth1.backgroundColor = [UIColor yellowColor];				
	 }else{
	 booth1.backgroundColor = [UIColor orangeColor];	
	 }
	 [backgroundView addSubview:booth1];
	 [booth1 release];
	 index++;
	 }
	 y = y + 50;
	 }
	 y = y + 50;
	 }
	 
	 
	 
	 mainView = backgroundView;
	 
	 [map addSubview:backgroundView];
	 [backgroundView release];
	 map.maximumZoomScale = 2.2;
	 map.minimumZoomScale = 0.45;
	 map.clipsToBounds = YES;
	 map.delegate = self;
	 */

	
}

-(UIColor *)getBackgroundColor:(Company *) comp{
	NSString * color = [[NSString alloc] initWithString:[[comp wait_time] 
														 stringByTrimmingCharactersInSet:
														 [NSCharacterSet whitespaceAndNewlineCharacterSet]]];
	if ([color isEqualToString:@"h"]) {
		return [UIColor redColor];
	}else if ([color isEqualToString:@"m"]) {
		return [UIColor orangeColor];		
	}else {
		return [UIColor yellowColor];
	}
}


- (NSArray *)assembleCompanies
{
	
    NSMutableArray * companyInfo = [[NSMutableArray alloc] init];
	
    NSString * new_name;
	NSString * new_location;
	NSString * new_about;
	NSString * new_majors;
    NSString * new_years;
	double new_gpa;
	NSString * new_citizenship;
    NSString * new_wait_time;
    double new_distance;
    int new_ranking;
    
    BOOL new_freshman = false;
    BOOL new_sophomore = false;
    BOOL new_junior = false;
    BOOL new_senior = false;
    BOOL new_gradstudent = false;
    
    int count = 0;
    int line_num = 1;
    
    DDFileReader * reader = [[DDFileReader alloc] initWithFilePath:@"/Users/robertdeloatch/UID465/company_info.txt"];
    NSString * line = nil;
    while ((line = [reader readLine]))
    {
        //NSLog(@"read line: %@", line);
        
        if (count % 2)
        {
            if(line_num == 1)
            {
                new_name = line;
            }
            if(line_num == 2)
            {
                new_location = line;
            }
            if(line_num == 3)
            {
                new_about = line;
            }
            if(line_num == 4)
            {
                new_majors = line;
                new_majors = [new_majors stringByReplacingOccurrencesOfString:(@",") withString:(@"\n")];
            }
            if(line_num == 5)
            {
                new_years = line;
                if([new_years rangeOfString:(@"Freshman")].location != NSNotFound)
                {
                    new_freshman = true;
                }
                if([new_years rangeOfString:(@"Sophomore")].location != NSNotFound)
                {
                    new_sophomore = true;
                }
                if([new_years rangeOfString:(@"Junior")].location != NSNotFound)
                {
                    new_junior = true;
                }
                if([new_years rangeOfString:(@"Senior")].location != NSNotFound)
                {
                    new_senior = true;
                }
                if([new_years rangeOfString:(@"Graduate Student")].location != NSNotFound)
                {
                    new_gradstudent = true;
                }
                
                //NSLog(new_years);
                //NSLog(@"%@\n", (new_freshman ? @"YES" : @"NO"));
                //NSLog(@"%@\n", (new_sophomore ? @"YES" : @"NO"));
                //NSLog(@"%@\n", (new_junior ? @"YES" : @"NO"));
                //NSLog(@"%@\n", (new_senior ? @"YES" : @"NO"));
                //NSLog(@"%@\n", (new_gradstudent ? @"YES" : @"NO"));
				
            }
            if(line_num == 6)
            {
                new_gpa = [line doubleValue];
            }
            if(line_num == 7)
            {
                new_citizenship = line;
            }
            if(line_num == 8)
            {
                new_wait_time = line;
            }
            if(line_num == 9)
            {
                new_distance = [line doubleValue];
            }
            if(line_num == 10)
            {
                new_ranking = [line intValue];
                line_num = 0;
                
                Company * new_company = [Company companyWithName: new_name location: new_location about: new_about majors: new_majors gpa: new_gpa citizenship: new_citizenship wait_time: new_wait_time distance: new_distance ranking:  new_ranking freshman: new_freshman sophomore: new_sophomore junior:  new_junior senior: new_senior gradstudent: new_gradstudent years: new_years];
				
                
                [companyInfo addObject:new_company];
                
                new_freshman = false;
                new_sophomore = false;
                new_junior = false;
                new_senior = false;
                new_gradstudent = false;
                
            }
            
            line_num++;
            
        }
        
        count++;
    }
    [reader release];
    
    NSArray * temp_array = [[NSArray alloc] initWithArray:companyInfo];
    
    return temp_array;
    
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
