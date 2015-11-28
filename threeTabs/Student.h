//
//  Student.h
//  Class4Demo2
//
//  Created by Admin on 11/18/15.
//  Copyright (c) 2015 menachi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property NSString* fname;
@property NSString* lname;
@property NSString* stId;
@property NSString* phone;

-(id)init:(NSString*)fname lname:(NSString*)lname stId:(NSString*)stId phone:(NSString*)phone;


@end
