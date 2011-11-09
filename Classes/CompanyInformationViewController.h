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
    UILabel * location;
    UILabel * gpa;
    UILabel * citizenship;
    
    UILabel * freshman;
    UILabel * sophomore;
    UILabel * junior;
    UILabel * senior;
    UILabel * gradstudent;
}

@property (nonatomic, retain) Company * company;
@property (nonatomic, retain) IBOutlet UILabel * name;
@property (nonatomic, retain) IBOutlet UITextView * majors;
@property (nonatomic, retain) IBOutlet UITextView * about;
@property (nonatomic, retain) IBOutlet UIScrollView * scrollView;
@property (nonatomic, retain) IBOutlet UILabel * location;
@property (nonatomic, retain) IBOutlet UILabel * gpa;
@property (nonatomic, retain) IBOutlet UILabel * citizenship;
@property (nonatomic, retain) IBOutlet UILabel * freshman;
@property (nonatomic, retain) IBOutlet UILabel * sophomore;
@property (nonatomic, retain) IBOutlet UILabel * junior;
@property (nonatomic, retain) IBOutlet UILabel * senior;
@property (nonatomic, retain) IBOutlet UILabel * gradstudent;


-(IBAction)back;

@end
