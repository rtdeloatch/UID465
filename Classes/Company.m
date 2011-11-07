//
//  Company.m
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "Company.h"


@implementation Company

@synthesize name, location, about, majors, years, gpa, citizenship, wait_time, distance, ranking;

+(id) companyWithName: (NSString *) newName location: (NSString *) newLocation about: (NSString *) newAbout majors: (NSString *) newMajors years: (NSString *) newYears gpa: (double) newGPA citizenship: (NSString *) newCitizenship wait_time: (int) newWait_Time distance: (double) newDistance ranking: (int) newRanking
{
	Company * company = [[[Company alloc] init] autorelease];
	company.name = newName;
	company.location = newLocation;
    company.about = newAbout;
    company.majors = newMajors;
    company.years = newYears;
    company.gpa = newGPA;
    company.citizenship = newCitizenship;
    company.wait_time = newWait_Time;
    company.distance = newDistance;
    company.ranking = newRanking;
	return company;
}


@end
