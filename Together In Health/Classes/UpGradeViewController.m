//
//  UpGradeViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 11/7/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "UpGradeViewController.h"
#import "AppDelegate.h"

@interface UpGradeViewController ()

@end

@implementation UpGradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
    [self enableControls];
    self.emailContainerView.hidden = YES;
    CGRect scrollViewFrame = CGRectMake(0,64,self.view.bounds.size.width,self.view.bounds.size.height-64);
    self.thisScrollView.frame = scrollViewFrame;
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 2000);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)enableControls
{
    self.doneButton.enabled = YES;
    self.sub1Button.enabled = YES;
    self.sub2Button.enabled = YES;
    self.emailTextField.enabled = YES;
    [self.activityView stopAnimating];
}
-(void)disableControls
{
    self.doneButton.enabled = NO;
    self.sub1Button.enabled = NO;
    self.sub2Button.enabled = NO;
    self.emailTextField.enabled = NO;
    [self.activityView startAnimating];
}
-(void)updateUI
{
    // update if existing email and subscription
}

-(IBAction)doneButtonTapped:(UIButton*)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(IBAction)buttonTapped:(UIButton*)sender
{
    if ([self validEmail:self.emailTextField.text])
    {
        [self disableControls];
        switch (sender.tag) {
            case 0:
                [self.appDelegate upsertContactForEmail:self.emailTextField.text atSubcriptionLevel:1 inController:self];
                break;
            case 1:
                [self.appDelegate upsertContactForEmail:self.emailTextField.text atSubcriptionLevel:2 inController:self];
                break;
            default:
                break;
        }
    }
    else
    {
        [self displayAlert:@"Invalid Email Format"];
        
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL) validEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}



-(void)subscriptionCompleteWithSuccess:(BOOL)success
{
    if (success)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self enableControls];
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
