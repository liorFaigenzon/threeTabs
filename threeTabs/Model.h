//
//  Model.h
//  Class4Demo2
//
//  Created by Admin on 11/18/15.
//  Copyright (c) 2015 menachi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"



@protocol ModelProtocol <NSObject>

-(void)addStudent:(Student*)st;
-(Student*)getStudent:(NSString*)stId;
-(void)deleteStudent:(Student*)st;
-(NSArray*)getAllStudents;

@end

@interface Model : NSObject<ModelProtocol>{
    id<ModelProtocol> modelImpl;
}



+(Model*)instance;

@end