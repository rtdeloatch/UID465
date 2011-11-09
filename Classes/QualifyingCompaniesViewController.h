//
//  QualifyingCompaniesViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/5/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UID465ViewController;
@interface QualifyingCompaniesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
	NSArray * companyList;
	NSMutableArray * myCompanies;
	UID465ViewController * mainView;
}

@property (nonatomic, retain) NSArray * companyList;
@property (nonatomic, retain) NSMutableArray * myCompanies;
@property (nonatomic, retain) UID465ViewController * mainView;

-(IBAction)back;
-(IBAction)done;

@end
