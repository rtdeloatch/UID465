//
//  UpdateWaitViewController.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Company;

@interface UpdateWaitViewController : UIViewController {
	Company * company;
	UILabel * companyName;
}

@property (nonatomic, retain) Company * company;
@property (nonatomic, retain) IBOutlet UILabel * companyName;

-(IBAction)back;

@end
