//
//  Company.m
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import "Company.h"


@implementation Company


@synthesize name, companyView, location, about, majors, freshman, sophomore, junior, senior, gradstudent, gpa, citizenship, wait_time, distance, ranking, years;

+(id) companyWithName: (NSString *) newName location: (NSString *) newLocation about: (NSString *) newAbout majors: (NSString *) newMajors gpa: (double) newGPA citizenship: (NSString *) newCitizenship wait_time: (NSString *) newWait_Time distance: (double) newDistance ranking: (int) newRanking freshman: (BOOL) newFreshman sophomore: (BOOL) newSophomore junior: (BOOL) newJunior senior: (BOOL) newSenior gradstudent: (BOOL) newGradStudent years:(NSString *) newYears
{
	Company * company = [[[Company alloc] init] autorelease];
	company.name = newName;
	company.location = newLocation;
    company.about = newAbout;
    company.majors = newMajors;
    company.gpa = newGPA;
    company.citizenship = newCitizenship;
    company.wait_time = newWait_Time;
    company.distance = newDistance;
    company.ranking = newRanking;
    company.years = newYears;
    company.freshman = newFreshman;
    company.sophomore = newSophomore;
    company.junior = newJunior;
    company.senior = newSenior;
    company.gradstudent = newGradStudent;
	company.companyView = [[UIView alloc] init];
	return company;
}


@end
