//
//  QualifyingCompaniesViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/5/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QualifyingCompaniesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
	NSArray * companyList;
}

@property (nonatomic, retain) NSArray * companyList;

-(IBAction)back;

@end