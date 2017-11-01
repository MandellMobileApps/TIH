//
//  GoalSetViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/3/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "GoalSetViewController.h"
#import "AppDelegate.h"
#import "GoalGamePlanViewController.h"
#import "GoalCheckViewController.h"
#import "ProgressViewController.h"



@interface GoalSetViewController ()

@end

@implementation GoalSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
//    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
//    self.navigationController.navigationBar.titleTextAttributes = size;
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
//
    self.changeMade = NO;
    self.appDelegate.goalSetViewController = self;
    self.thisScrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);
    self.thisScrollView.contentSize = CGSizeMake( self.view.bounds.size.width, 700);
    [self loadGoalIntoUI];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(CGRect)baseRect
//{
//    CGRect baseRect = self.view.bounds;
//    NSInteger menuHeight = 105;
//    baseRect.origin.y = menuHeight;
//    baseRect.size.height = self.view.frame.size.height-menuHeight;
//    return baseRect;
//    
//}

-(IBAction)navbuttonTapped:(UIButton*)sender
{
    if (sender.tag == 0)
    {
        if (self.changeMade)
        {
           // alert first
            [self.navigationController popViewControllerAnimated:YES];

        }
        else
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else if (sender.tag == 1)
    {
        [self saveGoalFromUI];
        [self.appDelegate saveGoals];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)loadGoalIntoUI
{
    self.titleLabel.text = self.goal.goalName;
    self.goalTextField.text = self.goal.goalName;
//    self.daysTextField.text = self.goal.;
//    self.timesTextField.text = self.goal;
//    self.whereTextField.text = self.goal;
//    self.amountTextField.text = self.goal;
//    self.step1TextField.text = self.goal;
//    self.step2TextField.text = self.goal;
//    self.step3TextField.text = self.goal;
//    self.step4TextField.text = self.goal;
//    self.step5TextField.text = self.goal

    self.Step1IsOn = self.goal.Step1IsOn;
    self.Step2IsOn = self.goal.Step2IsOn;
    self.Step3IsOn = self.goal.Step3IsOn;
    self.Step4IsOn = self.goal.Step4IsOn;
    self.Step5IsOn = self.goal.Step5IsOn;
    [self updateCheckBoxImages];
}

-(void)saveGoalFromUI
{
    self.goal.goalName = self.goalTextField.text;


    self.goal.Step1IsOn = self.Step1IsOn;
    self.goal.Step2IsOn = self.Step2IsOn;
    self.goal.Step3IsOn = self.Step3IsOn;
    self.goal.Step4IsOn = self.Step4IsOn;
    self.goal.Step5IsOn = self.Step5IsOn;
        
}

-(void)updateCheckBoxImages
{
    if (self.Step1IsOn) {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
 
    if (self.Step2IsOn) {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
    
    if (self.Step3IsOn) {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
    
    if (self.Step4IsOn) {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
    
   if (self.Step5IsOn) {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
}
-(IBAction)buttonTapped1:(id)sender
{
    self.Step1IsOn = !self.Step1IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}

-(IBAction)buttonTapped2:(id)sender
{
    self.Step2IsOn = !self.Step2IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}


-(IBAction)buttonTapped3:(id)sender
{
    self.Step3IsOn = !self.Step3IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
    
}
-(IBAction)buttonTapped4:(id)sender
{
    self.Step4IsOn = !self.Step4IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}
-(IBAction)buttonTapped5:(id)sender
{
    self.Step5IsOn = !self.Step5IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}

-(IBAction)clearAll:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to clear all?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear all",nil];
    alert.tag = 1;
    [alert show];
    
}

-(IBAction)verifyCancel:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You've made changes, are you sure you want to close goal?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Close Goal",nil];
    alert.tag = 2;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex

{
    if (alertView.tag == 1)
    {
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
    } else if (alertView.tag == 2)
    {
        if (buttonIndex == 1) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
        
        
    }
}
#pragma mark - Navigation

//#import "GoalCheckViewController.h"
//#import "ProgressViewController.h"

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"GoalGamePlan"])
    {
            GoalGamePlanViewController* goalGamePlanViewController = [segue destinationViewController];
        goalGamePlanViewController.goal = self.goal;
    }
    else if ([segue.identifier isEqualToString:@"GoalCheck"])
    {
        GoalCheckViewController* goalCheckViewController = [segue destinationViewController];
        goalCheckViewController.goal = self.goal;
    }

    
}


@end



