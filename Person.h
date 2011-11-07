//
//  Person.h
//  UID465
//
//  Created by mac on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject 
{

    NSString * maj;
    NSString * year;
    double gpa;
    NSString * citizen;
    NSString * position;
    
}


@property (nonatomic, retain) NSString * maj;
@property (nonatomic, retain) NSString * year;
@property (nonatomic) double gpa;
@property (nonatomic, retain) NSString * citizen;
@property (nonatomic, retain) NSString * position;


+(id) personWithMajor: (NSString *) new_maj year: (NSString *) new_year gpa: (double) gpa citizenship: (NSString *) new_citizen position: (NSString *) new_position;

@end
