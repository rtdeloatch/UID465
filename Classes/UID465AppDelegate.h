//
//  UID465AppDelegate.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright UMBC 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UID465ViewController;

@interface UID465AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UID465ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UID465ViewController *viewController;

@end

