//
//  OpeningViewViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 12/2/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "OpeningViewViewController.h"
#import "AbstractViewController.h"
#import "DisclaimerViewController.h"
#import "FoodTrackerViewController.h"

@implementation OpeningViewViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.signInButton.enabled = NO;
    self.loadAd = NO;
    
    NSString *path = [self pathForFilename:@"Disclaimer.html"];
    NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [self.thisWebView loadHTMLString:webString baseURL:baseURL];

    self.webViewContainer.hidden = YES;
    
    self.continueButton.enabled = NO;
    
}

-(IBAction)continueProgram:(id)sender {

    [[NSUserDefaults standardUserDefaults] setBool:self.isAgree forKey:@"isAgree"];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    //self.navigationItem.title = @"Track food";
    
//    FoodTrackerViewController* foodTrackerViewController = (FoodTrackerViewController*)
//    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//     instantiateViewControllerWithIdentifier:@"FoodTrackerViewController"];
//    [self.navigationController pushViewController:foodTrackerViewController animated:NO];
}

-(IBAction)termsConditions:(id)sender
{
    [self animateTermsIn];
}
    
-(void)animateTermsIn
{
        CGRect hideRect = self.view.bounds;
        hideRect.origin.y = self.view.bounds.size.height;
        self.webViewContainer.frame = hideRect;
        self.webViewContainer.hidden = NO;
        [UIView animateWithDuration:0.3
            animations:^{
                self.webViewContainer.frame = self.view.bounds;
            }
            completion:^(BOOL finished){

            }];
}

-(void)animateTermsOut
{

    CGRect hideRect = self.view.bounds;
    hideRect.origin.y = self.view.bounds.size.height;
    [UIView animateWithDuration:0.3
        animations:^{
            self.webViewContainer.frame = hideRect;
            
        }
        completion:^(BOOL finished){
            self.webViewContainer.hidden = YES;
        }];

}
    
    
//    DisclaimerViewController* disclaimerViewController = (DisclaimerViewController*)
//    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//     instantiateViewControllerWithIdentifier:@"DisclaimerViewController"];
//    [self.navigationController pushViewController:disclaimerViewController animated:NO];
    




-(IBAction)agree:(id)sender {
    
    
    if (self.isAgree) {
        self.isAgree = NO;
        [self.agreeButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.continueButton.enabled = NO;
        
        
    }
    else {
        
        self.isAgree = YES;
        [self.agreeButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
        self.continueButton.enabled = YES;
    }
    
}

-(IBAction)done:(id)sender {
    
    [self animateTermsOut];
    
}

-(IBAction)signIn:(id)sender {
    
//    if ((self.usernameField.text = @"username")) {
//        
//        if ((self.passwordField.text = @"password")) {
//            self.signInButton.enabled = YES;
//            
//        }
//        
//    }
//    
//    else {
//        
//        self.signInButton.enabled = NO;
//        
//    }
//    
//    self.foodTrackerViewController.paidMenuView.hidden = YES;
//    self.foodTrackerViewController.freeMenuView.hidden = NO;
//    
}

@end
