//
//  GoalGamePlanViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/13/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "GoalGamePlanViewController.h"
#import "AppDelegate.h"





@interface GoalGamePlanViewController ()

@end

@implementation GoalGamePlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [self.navigationController setNavigationBarHidden:YES];

   self.changeMade = NO;
//   self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
//    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
//    self.navigationController.navigationBar.titleTextAttributes = size;
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
//
    self.appDelegate.goalGamePlanViewController = self;
    
    self.titleLabel.text = self.goal.goalName;
    
    [self.thisScrollView setFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 720);
    
    self.holidaysTextView.text = self.goal.holidays;
    self.vacationTextView.text = self.goal.vacation;
    self.sickDaysTextView.text = self.goal.sick;
    self.other1InfoTextView.text = self.goal.other1;
    self.other2InfoTextView.text = self.goal.other2;
    self.other1TextView.text = self.goal.other1Text;
    self.other2TextView.text = self.goal.other2Text;


}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
    
}
-(void)viewWillDisappear:(BOOL)animated {
    
    [self.holidaysTextView resignFirstResponder];
    [self.vacationTextView resignFirstResponder];
    [self.sickDaysTextView resignFirstResponder];
    [self.other1TextView resignFirstResponder];
    [self.other2TextView resignFirstResponder];
    [self.other1InfoTextView resignFirstResponder];
    [self.other2InfoTextView resignFirstResponder];
    
    
//    NSString* RecordId = [self.object objectForKey:@"RecordId"];
//
//    NSString* sql2 = [NSString stringWithFormat:@"UPDATE Goal1 Set Holidays = \"%@\" WHERE RecordId = \"%@\" ",self.holidaysTextView.text,RecordId];
//    [SQLiteAccess updateWithSQL:sql2];
//
//    NSString* sql3 = [NSString stringWithFormat:@"UPDATE Goal1 Set Vacations = \"%@\" WHERE RecordId = \"%@\" ",self.vacationTextView.text,RecordId];
//    [SQLiteAccess updateWithSQL:sql3];
//
//    NSString* sql4 = [NSString stringWithFormat:@"UPDATE Goal1 Set SickDays = \"%@\" WHERE RecordId = \"%@\" ",self.sickDaysTextView.text,RecordId];
//    [SQLiteAccess updateWithSQL:sql4];
//
//    NSString* sql5 = [NSString stringWithFormat:@"UPDATE Goal1 Set Other1 = \"%@\" WHERE RecordId = \"%@\" ",self.other1TextView.text,RecordId];
//    [SQLiteAccess updateWithSQL:sql5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGRect)baseRect
{
    CGRect baseRect = self.view.bounds;
    NSInteger menuHeight = 170;
    baseRect.origin.y = menuHeight;
    baseRect.size.height = self.view.frame.size.height-menuHeight;
    return baseRect;
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    self.goal.holidays = self.holidaysTextView.text;
    self.goal.vacation = self.vacationTextView.text;
    self.goal.sick = self.sickDaysTextView.text;
    self.goal.other1 = self.other1InfoTextView.text;
    self.goal.other2 = self.other2InfoTextView.text;
    self.goal.other1Text = self.other1TextView.text;
    self.goal.other2Text = self.other2TextView.text;
    self.changeMade = YES;
}

-(IBAction)navbuttonTapped:(UIButton*)sender
{
    if (sender.tag == 0)
    {
        if (self.changeMade)
        {
           // alert
        
        }
        else
        {
            [self dismissViewControllerAnimated:YES completion:^{
 
            }];
        }
    }
    else if (sender.tag == 1)
    {
        [self.appDelegate saveGoals];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
        
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
            self.holidaysTextView.text = @"";
            self.vacationTextView.text = @"";
            self.sickDaysTextView.text = @"";
            self.other1InfoTextView.text = @"";
            self.other2InfoTextView.text = @"";
            self.other1TextView.text = @"";
            self.other2TextView.text = @"";
        }
    } else if (alertView.tag == 2)
    {
        if (buttonIndex == 1) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
        
        
    }
}

@end



