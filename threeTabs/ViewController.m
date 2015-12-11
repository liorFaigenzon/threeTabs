//
//  ViewController.m
//  three
//
//  Created by Admin on 11/24/15.
//  Copyright © 2015 Faigenzon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSegueWithIdentifier:@"StudentsCustomSeague" sender:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation MyCustomSeague

-(void)perform {
    ViewController* parentVC = self.sourceViewController;
    UIViewController* childVC = self.destinationViewController;
    [parentVC addChildViewController:childVC];
    
    // fit the size of the child to the container
    CGRect cg = parentVC.ViewContainer.frame;
    cg.origin.x = 0;
    cg.origin.y = 0;
    childVC.view.frame = cg;
    
    // Show child
    [parentVC.view addSubview:childVC.view];
    [childVC didMoveToParentViewController:parentVC];
}

@end
