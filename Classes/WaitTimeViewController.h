//
//  WaitTimeViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class Company;
//@class UpdateWaitViewController;

@interface WaitTimeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	NSArray * companyList;
//	UpdateWaitViewController * updateWaitViewController;
//	Company * company;
	NSMutableArray * didCreatePlan;
	NSArray * sortedCompanies;
}

@property(nonatomic,retain) NSArray * companyList;
@property(nonatomic,retain) NSArray * sortedCompanies;
@property(nonatomic,retain) NSMutableArray * didCreatePlan;
//@property(nonatomic, retain) UpdateWaitViewController * updateWaitViewController;
//@property(nonatomic, retain) Company * company;
-(IBAction)back;

@end
