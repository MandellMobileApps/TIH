//
//  SubscriptionViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 1/29/18.
//  Copyright © 2018 MandellMobileApps. All rights reserved.
//

#import "SubscriptionViewController.h"
#import "AbstractViewController.h"
#import "AppDelegate.h"

@interface SubscriptionViewController ()

@end

@implementation SubscriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.navigationController.navigationBar setHidden:YES];
    self.navbarView.backgroundColor =  [UIColor colorWithRed:255/255.0 green:243/255.0 blue:177/255.0 alpha:1];
    self.navbarTitleLabel.font = [UIFont fontWithName:@"Arial" size:24.0];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    self.navbarTitleLabel.text = @"Subscription";
    
    self.thisScrollView.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-44);
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 2500);

    self.keypadShowing = NO;
    self.emailShowing = NO;
    self.emailContainerView.hidden = YES;
    
    self.selectedSubscriptionLevel = self.appDelegate.subscriptionLevel;
    self.selectedPaymentTerm = self.appDelegate.paymentTerm;
    
//    self.appDelegate.contactEmail = @"";
//    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"contactEmail"];
    
    self.emailTextField.text = [self.appDelegate.contactEmail copy];
    [self.levelSegmentControl setSelectedSegmentIndex:self.selectedSubscriptionLevel];
    [self.termSegmentControl setSelectedSegmentIndex:self.selectedPaymentTerm];
    
    [self updateUI];
    
    if (self.selectedSubscriptionLevel == 0)
    {
        self.subTextView.text = @"Enjoy a free week of Together In Health Premium when you subscribe now! To continue using all the great features in Premium follow the instructions in the email you'll receive. Enjoy and happy tracking!";
    }
    else if  (self.selectedSubscriptionLevel == 1)
    {
        self.subTextView.text = @"To cancel your Premium membership subscribe to the Free membership";

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doneButtonTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)updateUI
{
    switch (self.appDelegate.subscriptionLevel) {
      case SubscriptionFree:
            self.subLevelLabel.text = @"Free";
        break;
      case SubscriptionPaid1:
            self.subLevelLabel.text = @"Premium";
        break;
      case SubscriptionPaid2:
            self.subLevelLabel.text = @"Paid 2";
        break;
      default:
        break;
    }

   
    if (self.selectedSubscriptionLevel == 0)
    {
        self.termSegmentControl.hidden = YES;
    }
    else if  (self.selectedSubscriptionLevel == 1)
    {
        self.termSegmentControl.hidden = NO;
    }

}

-(IBAction)segmentControlIndexChanged:(UISegmentedControl*)segmentControl
{
    if (segmentControl.tag == 0)
    {
        self.selectedSubscriptionLevel = segmentControl.selectedSegmentIndex;
    
    }
    else if (segmentControl.tag == 1)
    {
        self.selectedPaymentTerm = segmentControl.selectedSegmentIndex;
    }
    
    [self updateUI];
}

-(IBAction)subscribeButtonTapped:(id)sender
{

    [self.emailTextField resignFirstResponder];
    if ((self.selectedSubscriptionLevel == self.appDelegate.subscriptionLevel)&&
        (self.selectedPaymentTerm == self.appDelegate.paymentTerm))
    {
        [self displayAlert:@"You have not made any changes."];
    }
    else
    {
        if ([self validEmail:self.emailTextField.text])
        {
            [self disableControls];
            self.timeoutTimer = [NSTimer timerWithTimeInterval:12 target:self selector:@selector(submitTimedOut) userInfo:nil repeats:NO];
            [[NSRunLoop mainRunLoop] addTimer:self.timeoutTimer forMode:NSDefaultRunLoopMode];
            [self disableControls];
           [self.appDelegate upsertContactForEmail:self.emailTextField.text atSubcriptionLevel:self.selectedSubscriptionLevel forPaymentTerm:self.selectedPaymentTerm inController:self];

        }
        else
        {
            [self displayAlert:@"Invalid Email Format"];
            
        }
    
        
    
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
        CGRect showRect= CGRectMake(0, 64, self.view.bounds.size.width, 300);
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

-(IBAction)hideEmailView
{
    if (self.emailShowing)
    {
         self.emailShowing = NO;
         CGRect hideRect = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 0);
         [UIView animateWithDuration:0.3
                         animations:^
         {
             self.emailContainerView.frame = hideRect;
             
         }
                         completion:^(BOOL finished)
         {
              self.emailContainerView.hidden = YES;
         }];
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - API

-(void)subscriptionCompleteWithSuccess:(BOOL)success
{
    [self.timeoutTimer invalidate];
    if (success)
    {
        [self hideEmailView];
        [self enableControls];
        [self updateUI];
        [self displayMessage:@"Success!\nYour Subscription Level has been changed." withTitle:@"Message"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self enableControls];
        [self displayAlert:@"Failure!\nPlease Contact Support"];
    }

}

-(void)enableControls
{
    self.doneButton.enabled = YES;
    self.sub1Button.enabled = YES;
    self.changeButton.enabled = YES;
    self.sub1Button.enabled = YES;
    self.emailTextField.enabled = YES;
    self.levelSegmentControl.enabled = YES;
    self.termSegmentControl.enabled = YES;
    [self.activityView stopAnimating];
}
-(void)disableControls
{
    self.doneButton.enabled = NO;
    self.sub1Button.enabled = NO;
    self.changeButton.enabled = NO;
    self.emailTextField.enabled = NO;
    self.levelSegmentControl.enabled = NO;
     self.termSegmentControl.enabled = NO;
    [self.activityView startAnimating];
}

-(void)submitTimedOut
{
    [self displayAlert:@"Upgrade Timed Out\nPlease Verify Intenet Connection\nOr Contact Support"];
    [self enableControls];

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

@end
