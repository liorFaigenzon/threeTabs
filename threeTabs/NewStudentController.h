//
//  NewStudentController.h
//  three
//
//  Created by Admin on 11/24/15.
//  Copyright © 2015 Faigenzon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Model.h"

@protocol NewStudentDelegate <NSObject>

-(void)onSave:(Student*)txt;
-(void)onCancel;

@end

@interface NewStudentController : UIViewController

@property id<NewStudentDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *iFirst;
@property (weak, nonatomic) IBOutlet UITextField *iLast;
@property (weak, nonatomic) IBOutlet UITextField *iPhone;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)onSave:(id)sender;
- (IBAction)clear:(id)sender;

@end
