//
//  CreatePlanViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/4/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreatePlanViewController : UIViewController <UITextFieldDelegate>{
	NSArray * companyList;
	NSMutableArray * myCompanies;
	UITextField * major;
	UITextField * year;
	UITextField * gpa;
	
}

@property (nonatomic,retain) NSArray * companyList;
@property (nonatomic,retain) NSMutableArray * myCompanies;
@property (nonatomic,retain) IBOutlet UITextField * major;
@property (nonatomic,retain) IBOutlet UITextField * year;
@property (nonatomic,retain) IBOutlet UITextField * gpa;

-(IBAction)back;
-(IBAction)generateQualifyList;

@end
