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
	BOOL wantsFreshman;
	BOOL wantsSophomore;
	BOOL wantsJunior;
	BOOL wantsSenior;
	BOOL wantsGrad;
	double gpa;
	BOOL wantsCitizen;
	int waitStatus;
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * about;
@property (nonatomic, retain) NSString * majors;
@property (nonatomic) BOOL wantsFreshman;
@property (nonatomic) BOOL wantsSophomore;
@property (nonatomic) BOOL wantsJunior;
@property (nonatomic) BOOL wantsSenior;
@property (nonatomic) BOOL wantsGrad;
@property (nonatomic) double gpa;
@property (nonatomic) BOOL wantsCitizen;
@property (nonatomic) int waitStatus;

+(id) companyWithName: (NSString *) newName location: (NSString *) newLocation;

@end
