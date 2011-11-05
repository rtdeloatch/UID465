//
//  Company.m
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "Company.h"


@implementation Company

@synthesize name, location, about, majors, wantsFreshman, wantsSophomore;
@synthesize wantsJunior, wantsSenior, wantsGrad, gpa, wantsCitizen, waitStatus;

+(id) companyWithName: (NSString *) newName location: (NSString *) newLocation{
	Company * company = [[[Company alloc] init] autorelease];
	company.name = newName;
	company.location = newLocation;
	return company;
}


@end
