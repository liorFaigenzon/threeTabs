//
//  NewStudentController.m
//  three
//
//  Created by Admin on 11/24/15.
//  Copyright © 2015 Faigenzon. All rights reserved.
//

#import "NewStudentController.h"
@implementation NewStudentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)cancel:(id)sender {
    [self.delegate onCancel];
    //[self dismissViewControllerAnimated:YES completion:nil]
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender {
    Student* st = [[Student alloc] init:self.iFirst.text lname:self.iLast.text stId:[NSString stringWithFormat:@"%d",12] phone:self.iPhone.text];
    [self.delegate onSave:st];
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
