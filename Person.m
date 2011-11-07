//
//  Person.m
//  UID465
//
//  ali is a beast
//
//  Created by mac on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize maj, year, gpa, citizen, position;


+(id) personWithMajor: (NSString *) new_maj year: (NSString *) new_year gpa: (double) new_gpa citizenship: (NSString *) new_citizen position: (NSString *) new_position
{
    Person * person = [[[Person alloc] init] autorelease];
    person.maj = new_maj;
    person.gpa = new_gpa;
    person.citizen = new_citizen;
    person.position = new_position;
    return person;
}

@end
