//
//  Student.m
//  Class4Demo2
//
//  Created by Admin on 11/18/15.
//  Copyright (c) 2015 menachi. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id)init:(NSString*)fname lname:(NSString*)lname stId:(NSString*)stId phone:(NSString*)phone{
    self = [super init];
    if (self) {
        _fname = fname;
        _lname = lname;
        _stId = stId;
        _phone = phone;
    }
    return self;
}


@end
