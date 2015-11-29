//
//  Model.m
//  Class4Demo2
//
//  Created by Admin on 11/18/15.
//  Copyright (c) 2015 menachi. All rights reserved.
//

#import "Model.h"

@interface Model(){
    NSMutableArray* students;
}

@end

@implementation Model

static Model* instance = nil;

+(Model*)instance{
    @synchronized(self){
        if(instance == nil){
            instance = [[Model alloc] init];
        }
    }
    return instance;
}

-(id)init{
    self = [super init];
    if (self) {
        students = [[NSMutableArray alloc] init];
        for (int i=0; i<5; i++) {
            Student* st = [[Student alloc] init:@"DUDU" lname:@"Cohen" stId:[NSString stringWithFormat:@"%d",i] phone:@"asdfasdf"];
            [students addObject:st];
        }
    }
    return self;
}

-(void)addStudent:(Student*)st{
    [students addObject:st];
}
-(Student*)getStudent:(NSString*)stId{
    return nil;
}
-(void)deleteStudent:(Student*)st{
    [students removeObject:st];
}
-(NSArray*)getAllStudents{
    return students;
}

@end

















