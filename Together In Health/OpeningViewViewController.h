//
//  OpeningViewViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 12/2/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class FoodTrackerViewController;

@interface OpeningViewViewController : AbstractViewController


@property (nonatomic, weak) FoodTrackerViewController *foodTrackerViewController;
@property (nonatomic, strong) IBOutlet UITextField *usernameField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
-(IBAction)signIn:(id)sender;

@property (nonatomic, strong) IBOutlet UIView* openingView;
-(IBAction)agree:(id)sender;
@property (nonatomic, strong) IBOutlet UIButton* agreeButton;
-(IBAction)termsConditions:(id)sender;
-(IBAction)continueProgram:(id)sender;
@property (nonatomic, strong) IBOutlet UIButton *continueButton;
@property (nonatomic) BOOL isAgree;
@property (nonatomic) BOOL agreeIsOn;
-(void)saveDefaults;
@property (nonatomic, strong) IBOutlet UITextView *disclaimerTextView;
@property (nonatomic, strong) IBOutlet UIButton *doneButton;
-(IBAction)done:(id)sender;
@property (nonatomic, strong) IBOutlet UIImageView *aboutImage;
@property (nonatomic, strong) IBOutlet UILabel *agreeLabel;
@property (nonatomic, strong) IBOutlet UIButton *termsButton;
@property (nonatomic, strong) IBOutlet UIImageView *openingImage;
@property (nonatomic, strong) IBOutlet UITextView *tagLineTextView;

@property (nonatomic, strong) IBOutlet UIButton *signInButton;

@property (nonatomic, strong) IBOutlet UIWebView *thisWebView;
@property (nonatomic, strong) IBOutlet UIView *webViewContainer;

@end
