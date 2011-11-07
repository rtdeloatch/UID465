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
	UIScrollView * scrollView;
	UITextView * majors;
	UITextView * about;
	UILabel * name;
}

@property (nonatomic, retain) Company * company;
@property (nonatomic, retain) IBOutlet UILabel * name;
@property (nonatomic, retain) IBOutlet UITextView * majors;
@property (nonatomic, retain) IBOutlet UITextView * about;
@property (nonatomic, retain) IBOutlet UIScrollView * scrollView;
-(IBAction)back;

@end
