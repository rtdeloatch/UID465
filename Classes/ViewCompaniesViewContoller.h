//
//  ViewCompaniesViewContoller.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewCompaniesViewContoller : UIViewController <UITableViewDataSource, UITableViewDelegate>{
	NSArray * companyList;
}

@property(nonatomic,retain) NSArray * companyList;
-(IBAction)back;

@end
