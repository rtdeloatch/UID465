//
//  CreatePlanViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/4/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@class UID465ViewController;
@interface CreatePlanViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate>{
	NSArray * companyList;
	NSMutableArray * myCompanies;
	UITextField * majorField;
	UITextField * yearField;
	UITextField * gpaField;
	UISegmentedControl * citizenField;
	Person * me;
	UID465ViewController * mainView;
	NSMutableArray * didCreatePlan;
}

@property (nonatomic,retain) NSArray * companyList;
@property (nonatomic,retain) NSMutableArray * myCompanies;
@property (nonatomic,retain) IBOutlet UITextField * majorField;
@property (nonatomic,retain) IBOutlet UITextField * yearField;
@property (nonatomic,retain) IBOutlet UITextField * gpaField;
@property (nonatomic,retain) IBOutlet UISegmentedControl * citizenField;
@property (nonatomic, retain) Person * me;
@property (nonatomic, retain) UID465ViewController * mainView;
@property(nonatomic, retain) NSMutableArray * didCreatePlan;

-(IBAction)back;
-(IBAction)generateQualifyList;
-(IBAction)editCurrentPlan;
-(IBAction)editCurrentPosition;

@end
