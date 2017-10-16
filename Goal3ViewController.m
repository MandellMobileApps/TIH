//
//  Goal3ViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "Goal3ViewController.h"
#import "GoalSetViewController.h"
#import "GoalGamePlanViewController.h"
#import "GoalCalendarViewController.h"
#import "GoalCheckViewController.h"

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

-(IBAction)gamePlan:(id)sender {
    GoalGamePlanViewController* goalGamePlanViewController = (GoalGamePlanViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"GoalGamePlanViewController"];
    [self.navigationController pushViewController:goalGamePlanViewController animated:YES];
    
}

-(IBAction)goalCalendar:(id)sender {
    GoalCalendarViewController* goalCalendarViewController = (GoalCalendarViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"GoalCalendarViewController"];
    [self.navigationController pushViewController:goalCalendarViewController animated:YES];
    
}

-(IBAction)goalCheck:(id)sender {
    GoalCheckViewController* goalCheckViewController = (GoalCheckViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"GoalCheckViewController"];
    [self.navigationController pushViewController:goalCheckViewController animated:YES];
    
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
