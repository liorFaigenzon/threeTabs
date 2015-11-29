//
//  DetailsStudentController.m
//  three
//
//  Created by Admin on 11/24/15.
//  Copyright © 2015 Faigenzon. All rights reserved.
//

#import "DetailsStudentController.h"

@interface DetailsStudentController ()

@end

@implementation DetailsStudentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.first.text = self.DetailStudent.fname;
    self.last.text = self.DetailStudent.lname;
    self.phone.text = self.DetailStudent.phone;
    self.ids.text = self.DetailStudent.stId;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
