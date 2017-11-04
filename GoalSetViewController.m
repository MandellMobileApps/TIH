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
// Goal Color Methods

- (IBAction)colorButtonTapped:(UIButton*)sender
{
    if (sender.tag == 11)
    {
        [self showColorSelection];
    }
    else
    {
    
        self.goal.goalColor = [self colorForTag:sender.tag];
        self.colorView.backgroundColor = self.goal.goalColor;
        [self.colorSelectionView removeFromSuperview];
        self.changeMade = YES;
    }
 
}

-(void)showColorSelection
{
    NSInteger numberOfColors = 5;
    float h = self.colorView.frame.origin.y + self.colorView.frame.size.height + 10;
    CGRect frame1 = CGRectMake(10,h,(numberOfColors*30)+20,40);
    self.colorSelectionView = [[UIView alloc]initWithFrame:frame1];
    self.colorSelectionView.backgroundColor = [UIColor whiteColor];
    int t=0;
    for (t=0;t<numberOfColors;t++)
    {
        [self.colorSelectionView addSubview:[self viewWithTag:t]];
    }
    [self.thisScrollView addSubview:self.colorSelectionView];
}

-(UIView*)viewWithTag:(NSInteger)tag
{
    CGRect frame = CGRectMake(10+(30*tag),10,20,20);
    UIView* view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [self colorForTag:tag];
    CGRect frameB = CGRectMake(0,0,20,20);
    UIButton* button = [[UIButton alloc]initWithFrame:frameB];
    button.tag = tag;
    [button addTarget:self action:@selector(colorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    return view;
}


-(UIColor*)colorForTag:(NSInteger)tag
{
  switch (tag) {
      case 0: // blue
            return [UIColor blueColor];
        break;
      case 1: // yellow
            return [UIColor yellowColor];
        break;
      case 2: // red
            return [UIColor redColor];
        break;
      case 3: // green
            return [UIColor greenColor];
        break;
      case 4:  // cyan
            return [UIColor cyanColor];
        break;
    }
    return [UIColor whiteColor];
}


-(IBAction)navbuttonTapped:(UIButton*)sender
{
    if (sender.tag == 0)
    {
        if (self.changeMade)
        {
           [self verifyCancel:0];

        }
        else
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else if (sender.tag == 1)
    {
        [self resignFirstResponders];
        [self.appDelegate.goalsArray replaceObjectAtIndex:self.goalIndex withObject:self.goal];
        [self.appDelegate saveGoals];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)loadGoalIntoUI
{
    self.titleLabel.text = self.goal.goalName;
    self.goalTextField.text = self.goal.goalName;
    self.colorView.backgroundColor = self.goal.goalColor;
    self.daysTextField.text = self.goal.days;
    self.timesTextField.text = self.goal.times;
    self.whereTextField.text = self.goal.where;
    self.amountTextField.text = self.goal.amount;
    self.step1TextField.text = self.goal.step1;
    self.step2TextField.text = self.goal.step2;
    self.step3TextField.text = self.goal.step3;
    self.step4TextField.text = self.goal.step4;
    self.step5TextField.text = self.goal.step5;
  
      // set textfields delegate
    self.goalTextField.delegate = self;
    self.daysTextField.delegate = self;
    self.timesTextField.delegate = self;
    self.whereTextField.delegate = self;
    self.amountTextField.delegate = self;
    self.step1TextField.delegate = self;
    self.step2TextField.delegate = self;
    self.step3TextField.delegate = self;
    self.step4TextField.delegate = self;
    self.step5TextField.delegate = self;
    
    // set tags for textfield delegate
    self.goalTextField.tag = 0;
    self.daysTextField.tag = 1;
    self.timesTextField.tag = 2;
    self.whereTextField.tag = 3;
    self.amountTextField.tag = 4;
    self.step1TextField.tag = 5;
    self.step2TextField.tag = 6;
    self.step3TextField.tag = 7;
    self.step4TextField.tag = 8;
    self.step5TextField.tag = 9;

    [self updateCheckBoxImages];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag> 5)
    {
        CGRect newRect = self.thisScrollView.frame;
        newRect.origin.y = newRect.origin.y-150;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            self.thisScrollView.frame = newRect;
        }
        completion:^(BOOL finished){

        }];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
            self.goal.goalName = textField.text;
        break;
        case 1:
            self.goal.days = textField.text;
        break;
        case 2:
            self.goal.times = textField.text;
        break;
        case 3:
            self.goal.where = textField.text;
        break;
        case 4:
            self.goal.amount = textField.text;
        break;
        case 5:
            self.goal.step1 = textField.text;
        break;
        case 6:
            self.goal.step2 = textField.text;
        break;
        case 7:
            self.goal.step3 = textField.text;
        break;
        case 8:
            self.goal.step4 = textField.text;
        break;
        case 9:
            self.goal.step5 = textField.text;
        break;
        default:
            NSLog(@"textField tag not set");
        break;
    }
    self.changeMade = YES;
    if (textField.tag> 5)
    {
        CGRect newRect = self.thisScrollView.frame;
        newRect.origin.y = newRect.origin.y+150;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            self.thisScrollView.frame = newRect;
        }
        completion:^(BOOL finished){

        }];
    }
}

-(void)resignFirstResponders
{
    [self.goalTextField resignFirstResponder];
    [self.colorView resignFirstResponder];
    [self.daysTextField resignFirstResponder];
    [self.timesTextField resignFirstResponder];
    [self.whereTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
    [self.step1TextField resignFirstResponder];
    [self.step2TextField resignFirstResponder];
    [self.step3TextField resignFirstResponder];
    [self.step4TextField resignFirstResponder];
    [self.step5TextField resignFirstResponder];
}

-(void)updateCheckBoxImages
{
    if (self.goal.Step1IsOn) {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
 
    if (self.goal.Step2IsOn) {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
    
    if (self.goal.Step3IsOn) {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
    
    if (self.goal.Step4IsOn) {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
    
   if (self.goal.Step5IsOn) {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
    }
}
-(IBAction)buttonTapped1:(id)sender
{
    self.goal.Step1IsOn = !self.goal.Step1IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}

-(IBAction)buttonTapped2:(id)sender
{
    self.goal.Step2IsOn = !self.goal.Step2IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}


-(IBAction)buttonTapped3:(id)sender
{
    self.goal.Step3IsOn = !self.goal.Step3IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
    
}
-(IBAction)buttonTapped4:(id)sender
{
    self.goal.Step4IsOn = !self.goal.Step4IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}
-(IBAction)buttonTapped5:(id)sender
{
    self.goal.Step5IsOn = !self.goal.Step5IsOn;
    self.changeMade = YES;
    [self updateCheckBoxImages];
}

-(IBAction)clearAll:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to clear all?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear all",nil];
    alert.tag = 1;
    [alert show];
    
}

-(IBAction)verifyCancel:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You've made changes, are you sure you want to cancel changes?" message:@"" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"YES",nil];
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
            [self.navigationController popViewControllerAnimated:YES];
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



