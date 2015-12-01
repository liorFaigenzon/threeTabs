//
//  NewStudentController.m
//  three
//
//  Created by Admin on 11/24/15.
//  Copyright © 2015 Faigenzon. All rights reserved.
//

#import "NewStudentController.h"
#import "Model.h"
@implementation NewStudentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem.enabled = NO;
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender {
    NSInteger nNewID = [[Model instance] getAllStudents].count;
    Student* st = [[Student alloc] init:self.iFirst.text lname:self.iLast.text stId:[NSString stringWithFormat:@"%ld", nNewID] phone:self.iPhone.text];
    [self.delegate onSave:st];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSave:(id)sender {
    Student* st = [[Student alloc] init:self.iFirst.text lname:self.iLast.text stId:0 phone:self.iPhone.text];
    [self.delegate onSave:st];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clear:(id)sender {
    self.iFirst.text = @"";
    self.iLast.text = @"";
    self.iPhone.text = @"";
}

@end
