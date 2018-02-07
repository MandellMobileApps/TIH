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
    

    CGRect scrollViewFrame = CGRectMake(0,64,self.view.bounds.size.width,self.view.bounds.size.height-64);
    self.thisScrollView.frame = scrollViewFrame;
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 2390);
    self.keypadShowing = NO;
    self.emailShowing = NO;
    self.emailContainerView.hidden = YES;
    // Do any additional setup after loading the view.
    
    [self updateUI];
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
    self.upgradeNowButton.enabled = YES;
    self.emailTextField.enabled = YES;
    [self.activityView stopAnimating];
}
-(void)disableControls
{
    self.doneButton.enabled = NO;
    self.sub1Button.enabled = NO;
    self.sub2Button.enabled = NO;
    self.upgradeNowButton.enabled = NO;
    self.emailTextField.enabled = NO;
    [self.activityView startAnimating];
}
-(void)updateUI
{
    NSString* email = [[NSUserDefaults standardUserDefaults] objectForKey:@"contactEmail"];
    self.emailTextField.text = email;
    
}

-(IBAction)doneButtonTapped:(UIButton*)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)submitButtonTapped:(UIButton*)sender
{
    if ([self validEmail:self.emailTextField.text])
    {
        [self disableControls];
        self.timeoutTimer = [NSTimer timerWithTimeInterval:30 target:self selector:@selector(submitTimedOut) userInfo:nil repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:self.timeoutTimer forMode:NSDefaultRunLoopMode];
        
        switch (sender.tag) {
            case 0:
                [self.appDelegate upsertContactForEmail:self.emailTextField.text atSubcriptionLevel:1 forPaymentTerm:self.selectedPaymentTerm inController:self];
                break;
            case 1:
                [self.appDelegate upsertContactForEmail:self.emailTextField.text atSubcriptionLevel:2 forPaymentTerm:self.selectedPaymentTerm inController:self];
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
-(IBAction)segmentControlIndexChanged:(UISegmentedControl*)segmentControl
{
    self.selectedPaymentTerm = segmentControl.selectedSegmentIndex;

}

-(void)submitTimedOut
{
    [self displayAlert:@"Upgrade Timed Out\nPlease Verify Intenet Connection\nOr Contact Support"];
    [self enableControls];

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
    [self.timeoutTimer invalidate];
    if (success)
    {
        [self displayAlert:@"Upgrade Succesful!"];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    else
    {
        [self displayAlert:@"Upgrade Not Successful\nPlease Contace Support"];
        [self enableControls];
    }
}

#pragma mark -  Show Email View methods
                                                       // array of rows in order of components
-(IBAction)showEmailView
{
    if (!self.emailShowing)
    {
        self.emailShowing = YES;
        
        CGRect hideRect = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 0);
        CGRect showRect= CGRectMake(0, 64, self.view.bounds.size.width, 240);
        self.emailContainerView.clipsToBounds = YES;
        self.emailContainerView.frame = hideRect;
        self.emailContainerView.backgroundColor = [UIColor lightGrayColor];
        self.emailContainerView.hidden = NO;

            [UIView animateWithDuration:0.3
                animations:^
                {
                    self.emailContainerView.frame = showRect;

                }
                completion:^(BOOL finished)
                {

                 }];
    }
}

//-(IBAction)showEmailViewNow
//{
//    if (!self.emailShowing)
//    {
//        self.emailShowing = YES;
//
//        CGRect showRect= CGRectMake(0, 64, self.view.bounds.size.width, 182);
//        self.emailContainerView.clipsToBounds = YES;
//        self.emailContainerView.frame = showRect;
//        self.emailContainerView.backgroundColor = [UIColor lightGrayColor];
//        self.emailContainerView.hidden = NO;
//
//    }
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
