//
//  Goal3ViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "Goal3ViewController.h"
#import "GoalSetViewController.h"

@interface Goal3ViewController ()

@end

@implementation Goal3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 700);
    [self.thisScrollView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
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

@end
