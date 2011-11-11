//
//  ViewCompaniesViewContoller.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@interface ViewCompaniesViewContoller : UIViewController <UITableViewDataSource, UITableViewDelegate>{
	NSArray * companyList;
	NSArray * sortedCompanies;
	NSMutableArray * myCompanies;
	NSMutableArray * didCreatePlan;
	Person * me;
}

@property(nonatomic,retain) NSArray * companyList;
@property(nonatomic,retain) NSArray * sortedCompanies;
@property(nonatomic,retain) NSMutableArray * myCompanies;
@property(nonatomic,retain) NSMutableArray * didCreatePlan;
@property(nonatomic,retain) Person * me;
-(IBAction)back;

@end
