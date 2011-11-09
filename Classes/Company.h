//
//  Company.h
//  UID465
//
//  Created by Robert Deloatch on 11/3/11.
//  Copyright 2011 UMBC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Company : NSObject {
	NSString * name;
	NSString * location;
	NSString * about;
	NSString * majors;
    BOOL freshman;
    BOOL sophomore;
    BOOL junior;
    BOOL senior;
    BOOL gradstudent;
	double gpa;
	NSString * citizenship;
    int wait_time;
    double distance;
    int ranking;
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * about;
@property (nonatomic, retain) NSString * majors;
@property (nonatomic) double gpa;
@property (nonatomic, retain) NSString * citizenship;
@property (nonatomic) int wait_time;
@property (nonatomic) double distance;
@property (nonatomic) int ranking;
@property (nonatomic) BOOL freshman;
@property (nonatomic) BOOL sophomore;
@property (nonatomic) BOOL junior;
@property (nonatomic) BOOL senior;
@property (nonatomic) BOOL gradstudent;





+(id) companyWithName: (NSString *) newName location: (NSString *) newLocation about: (NSString *) newAbout majors: (NSString *) newMajors gpa: (double) newGPA citizenship: (NSString *) newCitizenship wait_time: (int) newWait_Time distance: (double) newDistance ranking: (int) newRanking freshman: (BOOL) newFreshman sophomore: (BOOL) newSophomore junior: (BOOL) newJunior senior: (BOOL) newSenior gradstudent: (BOOL) newGradStudent;

@end
