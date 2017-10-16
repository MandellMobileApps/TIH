//
//  Goal1ViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "Goal1ViewController.h"
#import "GoalSetViewController.h"
#import "GoalGamePlanViewController.h"
#import "GoalCalendarViewController.h"
#import "GoalCheckViewController.h"
#import "AbstractViewController.h"
#import "Goal.h"

@class GoalSetViewController;

@interface Goal1ViewController ()

@end

@implementation Goal1ViewController

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

-(IBAction)buttonTapped1:(id)sender
{
    if (self.goal.Step1IsOn) {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step1IsOn = YES;
        
        
    }
    else {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step1IsOn = NO;
        
        
    }
}

-(IBAction)buttonTapped2:(id)sender
{
    if (self.goal.Step2IsOn) {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step2IsOn = NO;
    }
    
    
    
    else {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step2IsOn = YES;
    }
    
}


-(IBAction)buttonTapped3:(id)sender
{
    if (self.goal.Step3IsOn) {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step3IsOn = NO;
    }
    else {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step3IsOn = YES;
    }
    
    
}
-(IBAction)buttonTapped4:(id)sender
{
    if (self.goal.Step4IsOn) {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        
        self.goal.Step4IsOn = NO;
    }
    else {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step4IsOn = YES;
    }
    
}
-(IBAction)buttonTapped5:(id)sender
{
    if (self.goal.Step5IsOn) {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step5IsOn = NO;
    }
    else {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step5IsOn = YES;
    }
}

-(IBAction)clearAll:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to clear all?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear all",nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
    }
    else if (buttonIndex == 1) {
        self.goalTextField.text = @"";
        self.daysTextField.text = @"";
        self.timesTextField.text = @"";
        self.whereTextField.text = @"";
        self.amountTextField.text = @"";
        self.step1TextField.text = @"";
        self.step2TextField.text = @"";
        self.step3TextField.text = @"";
        self.step4TextField.text = @"";
        self.step5TextField.text = @"";

        self.goal.Step1IsOn = NO;
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
        self.goal.Step2IsOn = NO;
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
        self.goal.Step3IsOn = NO;
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
        self.goal.Step4IsOn = NO;
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
        self.goal.Step5IsOn = NO;
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
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
