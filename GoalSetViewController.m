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
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.appDelegate.goalSetViewController = self;
    self.thisScrollView.contentSize = CGSizeMake( self.view.bounds.size.width, 700);
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGRect)baseRect
{
    CGRect baseRect = self.view.bounds;
    NSInteger menuHeight = 105;
    baseRect.origin.y = menuHeight;
    baseRect.size.height = self.view.frame.size.height-menuHeight;
    return baseRect;
    
}


-(IBAction)buttonTapped1:(id)sender
{
    if (self.goal.Step1IsOn) {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step1IsOn = NO;
        
        
    }
    else {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step1IsOn = YES;
        
        
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
    else if ([segue.identifier isEqualToString:@"GoalProgress"])
    {
        ProgressViewController* progressViewController = [segue destinationViewController];
        progressViewController.goal = self.goal;
    }
    
}


@end

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//
//-(IBAction)goal1:(UIButton*)sender
//{
//
//    if (!self.goal1ViewController)
//    {
//        self.goal1ViewController = (Goal1ViewController*)
//        [[UIStoryboard storyboardWithName:@"Goals" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"Goal1ViewController"];
//        self.goal1ViewController.view.frame = [self baseRect];
//        self.goal1ViewController.goalSetViewController = self;
//    }
//
//
//
//
//
//    [self addChildViewController:self.goal1ViewController];
//    [self.view addSubview:self.goal1ViewController.view];
//    [self.goal1ViewController didMoveToParentViewController:self];
//    self.title = @"Goal1";
//    self.goalIndex = Goal1Index;
//    [self updateMenuButtons];
//    //     [self unloadOtherViewControllersExceptIndex:FoodIndex];
//
//
//}
//
//
//-(IBAction)goal2:(UIButton*)sender
//{
//
//    if (!self.goal2ViewController)
//    {
//        self.goal2ViewController = (Goal2ViewController*)
//        [[UIStoryboard storyboardWithName:@"Goals" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"Goal2ViewController"];
//    }
//
//    self.goal2ViewController.view.frame = [self baseRect];
//
//    self.goal2ViewController.goalSetViewController = self;
//
//    [self addChildViewController:self.goal2ViewController];
//    [self.view addSubview:self.goal2ViewController.view];
//    [self.goal2ViewController didMoveToParentViewController:self];
//    self.title = @"Goal 2";
//    self.goalIndex = Goal2Index;
//    [self updateMenuButtons];
//
//    //   [self unloadOtherViewControllersExceptIndex:SleepIndex];
//
//
//}
//
//
//-(IBAction)goal3:(UIButton*)sender
//{
//
//    if (!self.goal3ViewController)
//    {
//        self.goal3ViewController = (Goal3ViewController*)
//        [[UIStoryboard storyboardWithName:@"Goals" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"Goal3ViewController"];
//    }
//
//    self.goal3ViewController.view.frame = [self baseRect];
//
//    self.goal3ViewController.goalSetViewController = self;
//
//    [self addChildViewController:self.goal3ViewController];
//    [self.view addSubview:self.goal3ViewController.view];
//    [self.goal3ViewController didMoveToParentViewController:self];
//    self.title = @"Goal 3";
//    self.goalIndex = Goal3Index;
//    [self updateMenuButtons];
//
//}
//
//
//-(IBAction)backDay:(id)sender {
//
//    //    self.appDelegate.day = [self.appDelegate dayForDate:[TIHDate dateYesterdayAtMidnightFromDate:self.appDelegate.day.date]];
//    //
//    //    [self resetDay];
//    //
//
//
//}

