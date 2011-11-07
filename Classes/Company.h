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
    NSString * years;
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
@property (nonatomic, retain) NSString * years;
@property (nonatomic) double gpa;
@property (nonatomic, retain) NSString * citizenship;
@property (nonatomic) int wait_time;
@property (nonatomic) double distance;
@property (nonatomic) int ranking;


+(id) companyWithName: (NSString *) newName location: (NSString *) newLocation about: (NSString *) newAbout majors: (NSString *) newMajors years: (NSString *) newYears gpa: (double) newGPA citizenship: (NSString *) newCitizenship wait_time: (int) newWait_Time distance: (double) newDistance ranking: (int) newRanking;

@end
