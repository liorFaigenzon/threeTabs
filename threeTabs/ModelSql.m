//
//  ModelSql.m
//  SqlDemo
//
//  Created by Admin on 12/2/15.
//  Copyright (c) 2015 menachi. All rights reserved.
//

#import "ModelSql.h"
#import "StudentSql.h"

@implementation ModelSql

-(id)init{
    self = [super init];
    if (self) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        
        NSArray* paths = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        
        NSURL* directoryUrl = [paths objectAtIndex:0];
        
        NSURL* fileUrl = [directoryUrl URLByAppendingPathComponent:@"database.db"];
        
        NSString* filePath = [fileUrl path];
        
        const char* cFilePath = [filePath UTF8String];
        
        int res = sqlite3_open(cFilePath,&database);
        
        if(res != SQLITE_OK){
            NSLog(@"ERROR: fail to open db");
            database = nil;
        }
        
        char* errormsg;
        //sqlite3_exec(database, "DROP TABLE  STUDENTS", NULL, NULL, &errormsg);
        res = sqlite3_exec(database, "CREATE TABLE IF NOT EXISTS STUDENTS (ST_ID TEXT PRIMARY KEY, FNAME TEXT, LNAME TEXT, PHONE TEXT)", NULL, NULL, &errormsg);
        
        if(res != SQLITE_OK){
            NSLog(@"ERROR: failed creating STUDENTS table");
        }
    }
    return self;
}


-(void)addStudent:(Student*)st{
    NSInteger nMaxID = -1;
    
    // Find the student with the max id
    for (Student* curr in self.getAllStudents)
    {
        if (curr.stId.integerValue > nMaxID)
            nMaxID = curr.stId.integerValue;
    }
    
    st.stId = [NSString stringWithFormat:@"%ld", nMaxID + 1];
    [StudentSql addStudent:database st:st];
}
-(void)deleteStudent:(Student*)st{
    [StudentSql deleteStudent:database st:st];
}
-(Student*)getStudent:(NSString*)stId{
    return [StudentSql getStudent:database stId:stId];
}
-(NSArray*)getAllStudents{
    return [StudentSql getStudents:database];
}


@end
