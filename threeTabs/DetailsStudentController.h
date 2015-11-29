//
//  DetailsStudentController.h
//  three
//
//  Created by Admin on 11/24/15.
//  Copyright © 2015 Faigenzon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface DetailsStudentController : UIViewController
@property NSString* fname;
@property NSString* lname;
@property NSString* stId;
@property NSString* phonet;
@property Student* DetailStudent;

@property (weak, nonatomic) IBOutlet UILabel *first;
@property (weak, nonatomic) IBOutlet UILabel *last;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *ids;

@end
