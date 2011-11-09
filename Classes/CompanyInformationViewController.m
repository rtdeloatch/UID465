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

@implementation CompanyInformationViewController
@synthesize company, scrollView, name, majors, about, location, gpa, citizenship, freshman, sophomore, junior, senior, gradstudent;

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
