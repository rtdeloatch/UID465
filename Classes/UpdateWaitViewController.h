//
//  UpdateWaitViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Company;

@interface UpdateWaitViewController : UIViewController {
	Company * company;
//	NSUInteger select;
	UILabel * companyName;
	UIButton * shortWait;
	UIButton * mediumWait;
	UIButton * longWait;
	NSMutableArray * didCreatePlan;
}

@property (nonatomic, retain) Company * company;
@property (nonatomic, retain) IBOutlet UILabel * companyName;
@property (nonatomic, retain) IBOutlet UIButton * shortWait;
@property (nonatomic, retain) IBOutlet UIButton * mediumWait;
@property (nonatomic, retain) IBOutlet UIButton * longWait;
@property(nonatomic,retain) NSMutableArray * didCreatePlan;
//@property (nonatomic) NSUInteger select;

-(IBAction)back;
-(IBAction)shortWaitPress;
-(IBAction)mediumWaitPress;
-(IBAction)longWaitPress;

@end
