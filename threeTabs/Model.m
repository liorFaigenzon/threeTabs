//
//  Model.m
//  Class4Demo2
//
//  Created by Admin on 11/18/15.
//  Copyright (c) 2015 menachi. All rights reserved.
//

#import "Model.h"
#import <sqlite3.h>
#import "ModelSql.h"


@interface Model(){
    NSMutableArray* students;
}

@end

@implementation Model
static Model* instance = nil;

+(Model*)instance{
    @synchronized(self){
        if (instance == nil) {
            instance = [[Model alloc] init];
        }
    }
    return instance;
}

-(id)init{
    self = [super init];
    if (self) {
        modelImpl = [[ModelSql alloc] init];
    }
    return self;
}

-(void)addStudent:(Student*)newStudent{
    [modelImpl addStudent:newStudent];
}
-(void)deleteStudent:(Student*)st{
    [modelImpl deleteStudent:st];
}
-(Student*)getStudent:(NSString*)stId{
    return [modelImpl getStudent:stId];
}
-(NSArray*)getAllStudents{
    return [modelImpl getAllStudents];
}

@end

















