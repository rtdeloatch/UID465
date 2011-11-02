//
//  ConventionBuddyAppDelegate.m
//  ConventionBuddy
//
//  Created by Robert Deloatch on 10/8/11.
//  Copyright UMBC 2011. All rights reserved.
//

#import "ConventionBuddyAppDelegate.h"

@implementation ConventionBuddyAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
