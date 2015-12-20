//
//  StudentSql.m
//  SqlDemo
//
//  Created by Admin on 12/2/15.
//  Copyright (c) 2015 menachi. All rights reserved.
//

#import "StudentSql.h"
#import <sqlite3.h>
#import "Student.h"

@interface StudentSql()


@end

@implementation StudentSql
static NSString* STUDENT_TABLE = @"STUDENTS";
static NSString* STUDENT_ST_ID = @"ST_ID";
static NSString* STUDENT_FNAME = @"FNAME";
static NSString* STUDENT_LNAME = @"LNAME";
static NSString* STUDENT_PHONE = @"PHONE";
static NSString* STUDENT_IMAGE_NAME = @"IMAGE_NAME";

+(void)addStudent:(sqlite3*)database st:(Student*)st{
    sqlite3_stmt *statment;
    NSString* query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@,%@,%@,%@) values (?,?,?,?);",STUDENT_TABLE,STUDENT_ST_ID,STUDENT_FNAME,STUDENT_LNAME,STUDENT_PHONE];
    
    if (sqlite3_prepare_v2(database,[query UTF8String],-1,&statment,nil) == SQLITE_OK){
        sqlite3_bind_text(statment, 1,[st.stId UTF8String],-1,NULL);
        sqlite3_bind_text(statment, 2, [st.lname UTF8String],-1,NULL);
        sqlite3_bind_text(statment, 3,[st.fname UTF8String],-1,NULL);
        sqlite3_bind_text(statment, 4, [st.phone UTF8String],-1,NULL);
        if(sqlite3_step(statment) == SQLITE_DONE){
            return;
        }
    }
    
    NSLog(@"ERROR: addStudent failed %s",sqlite3_errmsg(database));
}

+(void)deleteStudent:(sqlite3*)database st:(Student*)st{
    NSString *sql_str=[NSString stringWithFormat:@"DELETE from %@ where %@ = %@",STUDENT_TABLE,STUDENT_ST_ID,st.stId];
    sqlite3_stmt *deleteStmt;
    sqlite3_prepare_v2(database, [sql_str UTF8String], -1, & deleteStmt, NULL);
    sqlite3_step(deleteStmt);
    //if (sqlite3_step(deleteStmt) == SQLITE_DONE)
}

+(Student*)getStudent:(sqlite3*)database stId:(NSString*)stId{
    NSString *sql_str=[NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ =%@; ",STUDENT_TABLE,STUDENT_ST_ID,stId];
    sqlite3_stmt *statment;
    Student* st = NULL;
    if (sqlite3_prepare_v2(database,[sql_str UTF8String],-1,&statment,nil) == SQLITE_OK)
    {
        while(sqlite3_step(statment) == SQLITE_ROW){
            NSString*  stId= [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,0)];
            NSString*  lname= [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,1)];
            NSString*  fname= [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,2)];
            NSString* phone = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,3)];
            st = [[Student alloc] init:fname lname:lname stId:stId phone:phone];
        }
    }else{
        NSLog(@"ERROR: getStudents failed %s",sqlite3_errmsg(database));
        return nil;
    }
    return st;
}

+(NSArray*)getStudents:(sqlite3*)database{
    NSString *sql_str=[NSString stringWithFormat:@"SELECT * from %@;",STUDENT_TABLE];
    NSMutableArray* data = [[NSMutableArray alloc] init];
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database,[sql_str UTF8String], -1,&statment,nil) == SQLITE_OK){
        while(sqlite3_step(statment) == SQLITE_ROW){
            NSString*  stId= [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,0)];
            NSString*  lname= [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,1)];
            NSString*  fname= [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,2)];
            NSString* phone = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,3)];
            Student* st = [[Student alloc] init:fname lname:lname stId:stId phone:phone];
            [data addObject:st];
        }
    }else{
        NSLog(@"ERROR: getStudents failed %s",sqlite3_errmsg(database));
        return nil;
    }
    return data;
}

@end
