//
//  StudentsTableViewController.h
//  three
//
//  Created by Admin on 11/24/15.
//  Copyright © 2015 Faigenzon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewStudentController.h"

@interface StudentsTableViewController :UIViewController <NewStudentDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray* data;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
