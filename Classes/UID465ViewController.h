//
//  UID465ViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright UMBC 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewCompaniesViewContoller;
@class WaitTimeViewController;
@class Company;
@class CreatePlanViewController;

@interface UID465ViewController : UIViewController <UIScrollViewDelegate> {
	UIScrollView * map;
	ViewCompaniesViewContoller* viewCompaniesViewController;
	WaitTimeViewController* waitTimeViewController;
	CreatePlanViewController* createPlanViewController;
	NSMutableArray * myCompanies;
	NSArray * companyList;
	UIView * mainView;
    
    UIToolbar * toolbar;
    UIBarButtonItem * createPlanButton;
    UIBarButtonItem * updatePositionButton;
    
}

@property(nonatomic,retain) ViewCompaniesViewContoller* viewCompaniesViewController;
@property(nonatomic,retain) WaitTimeViewController* waitTimeViewController;
@property(nonatomic,retain) CreatePlanViewController* createPlanViewController;
@property(nonatomic,retain) NSMutableArray * myCompanies;
@property(nonatomic,retain) NSArray * companyList;
@property(nonatomic,retain) UIView * mainView;
@property(nonatomic,retain) IBOutlet UIScrollView * map;
@property(nonatomic,retain) IBOutlet UIToolbar * toolbar;
@property(nonatomic,retain) IBOutlet UIBarButtonItem * createPlanButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem * updatePositionButton;

-(IBAction)viewCompanies;
-(IBAction)viewWaitTime;
-(IBAction)createPlan;
-(IBAction)updatePosition;
- (NSArray *)assembleCompanies;
@end

