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
	UIToolbar * bottomBar;
	UIBarButtonItem * leftButton;
	UIBarButtonItem * rightButton;
}

@property(nonatomic,retain) ViewCompaniesViewContoller* viewCompaniesViewController;
@property(nonatomic,retain) WaitTimeViewController* waitTimeViewController;
@property(nonatomic,retain) CreatePlanViewController* createPlanViewController;
@property(nonatomic,retain) NSMutableArray * myCompanies;
@property(nonatomic,retain) NSArray * companyList;
@property(nonatomic,retain) UIView * mainView;
@property(nonatomic,retain) IBOutlet UIScrollView * map;
@property(nonatomic,retain) IBOutlet UIToolbar * bottomBar;
@property(nonatomic,retain) IBOutlet UIBarButtonItem * leftButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem * rightButton;
-(IBAction)viewCompanies;
-(IBAction)viewWaitTime;
-(IBAction)createPlan;
-(IBAction)updatePosition;
-(void)draw;
- (NSArray *)assembleCompanies;
-(UIColor *)getBackgroundColor:(Company *)comp;
-(void)updateBottomBar:(BOOL)checked;
@end

