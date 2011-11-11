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
@class Person;
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
	int currentBoothPos;
	NSMutableArray * didCreatePlan; //so that it's passed by reference
	Person * me;
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
@property(nonatomic) int currentBoothPos;
@property(nonatomic, retain) NSMutableArray * didCreatePlan;
@property(nonatomic,retain) Person * me;

-(IBAction)viewCompanies;
-(IBAction)viewWaitTime;
-(IBAction)createPlan;
-(IBAction)updatePosition;
-(void)draw:(NSInteger) currPosition start:(BOOL)begin;
- (NSArray *)assembleCompanies;
-(UIColor *)getBackgroundColor:(Company *)comp;
-(void)updateBottomBar;
@end

