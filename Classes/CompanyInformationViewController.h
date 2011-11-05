//
//  CompanyInformationViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/4/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Company;
@interface CompanyInformationViewController : UIViewController <UIScrollViewDelegate>{
	Company * company;
	IBOutlet UIScrollView * scrollView;
}

@property (nonatomic, retain) Company * company;
@property (nonatomic, retain) UIScrollView * scrollView;
-(IBAction)back;

@end
