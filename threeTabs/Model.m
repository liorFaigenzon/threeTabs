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
        for (int i=1; i<6; i++) {
            Student* st = [[Student alloc] init:@"DUDU" lname:@"Cohen" stId:[NSString stringWithFormat:@"%d",i] phone:@"asdfasdf"];
            [students addObject:st];
        }
    }
    return self;
}

-(void)addStudent:(Student*)st{
    [students addObject:st];
}

-(void)addStudent:(NSString*)fname lastname:(NSString*)lname phone:(NSString*)phone{
    Student* newStudent;
    NSInteger nMaxID = -1;
    
    // Find the student with the max id
    for (Student* curr in students)
    {
        if (curr.stId.integerValue > nMaxID)
            nMaxID = curr.stId.integerValue;
    }
    
    newStudent = [[Student alloc] init:fname lname:lname stId:[NSString stringWithFormat:@"%ld", nMaxID + 1] phone:phone];
    [students addObject:newStudent];
}


-(Student*)getStudent:(NSString*)stId{
    Student* std;
    
    for (Student* curr in students)
    {
        if (curr.stId == stId)
            std = curr;
    }
    
    return std;
}

-(void)deleteStudent:(Student*)st{
    [students removeObject:st];
}

-(NSArray*)getAllStudents{
    return students;
}

@end

















