//
//  ViewControllerGoal1.h
//  SimpleTable
//
//  Created by Cami Mandell on 8/12/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "AppDelegate.h"
#import "Goal.h"
#import "AbstractViewController.h"

@class ProgressViewController;
@class OpeningViewController;
@class GoalsMenuViewController;


@interface ViewControllerGoal : AbstractViewController <UITextViewDelegate>

@property (nonatomic) int goalNumber;

@property (nonatomic, strong) IBOutlet UISegmentedControl* goalControlSegment;
//-(IBAction)goalControl:(id)sender;

@property (nonatomic, weak) ProgressViewController* progressViewController;
@property (nonatomic, weak) OpeningViewController* openingViewController;
@property (nonatomic, weak) GoalsMenuViewController* goalsMenuViewController;

@property (weak, nonatomic) AppDelegate *appDelegate;

@property (nonatomic, strong) Goal* goal;

@property (nonatomic, strong) IBOutlet UIButton *goal1Button;
@property (nonatomic, strong) IBOutlet UIButton *goal2Button;
@property (nonatomic, strong) IBOutlet UIButton *goal3Button;
-(IBAction)changeGoalName:(id)sender;

- (IBAction)buttonTapped1:(id)sender;
- (IBAction)buttonTapped2:(id)sender;
- (IBAction)buttonTapped3:(id)sender;
- (IBAction)buttonTapped4:(id)sender;
- (IBAction)buttonTapped5:(id)sender;

@property (nonatomic, strong) IBOutlet UIButton *step1;
@property (nonatomic, strong) IBOutlet UIButton *step2;
@property (nonatomic, strong) IBOutlet UIButton *step3;
@property (nonatomic, strong) IBOutlet UIButton *step4;
@property (nonatomic, strong) IBOutlet UIButton *step5;
@property (nonatomic, strong) IBOutlet UIButton *clearAllButton;
@property (nonatomic, strong) IBOutlet UIButton *resignKeyboardButton;
-(IBAction)resignKeyboard:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *textFieldGoal;
@property (nonatomic, strong) IBOutlet UITextView *goalTextView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldBy1;
@property (weak, nonatomic) IBOutlet UITextField *textFieldBy2;

@property (nonatomic, strong) IBOutlet UITextField *textFieldWhen;
@property (nonatomic, strong) IBOutlet UITextField *textFieldWhere;
@property (nonatomic, strong) IBOutlet UITextField *textFieldOften;
@property (nonatomic, strong) IBOutlet UITextField *textFieldWhen2;
@property (nonatomic, strong) IBOutlet UITextField *textFieldWhere2;
@property (nonatomic, strong) IBOutlet UITextField *textFieldOften2;

@property (nonatomic, strong) IBOutlet UITextField *textFieldStep1;
@property (nonatomic, strong) IBOutlet UITextField *textFieldStep2;
@property (nonatomic, strong) IBOutlet UITextField *textFieldStep3;
@property (nonatomic, strong) IBOutlet UITextField *textFieldStep4;
@property (nonatomic, strong) IBOutlet UITextField *textFieldStep5;

@property (nonatomic, strong) IBOutlet UITextField *goalNickname;


-(IBAction)trackProgress:(id)sender;
-(IBAction)checkGoal:(id)sender;
-(IBAction)gamePlan:(id)sender;
-(IBAction)clearAll:(id)sender;
-(void)saveDefaults;

@property (nonatomic, strong) IBOutlet UIButton *gamePlanButton;
@property (nonatomic, strong) IBOutlet UIButton *goalCheckButton;
@property (nonatomic) BOOL buttonTappedStep1On;
@property (nonatomic) BOOL buttonTappedStep2On;
@property (nonatomic) BOOL buttonTappedStep3On;
@property (nonatomic) BOOL buttonTappedStep4On;
@property (nonatomic) BOOL buttonTappedStep5On;

@property (nonatomic, strong) IBOutlet UIView *baseContentView;

-(void) saveGoal1Persistent;
-(void) loadGoal1Persistent;
-(void) saveGoal2Persistent;
-(void) loadGoal2Persistent;
-(void) saveGoal3Persistent;
-(void) loadGoal3Persistent;
-(void) createGoalPackage;

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;

- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;

-(void)saveGoal1Defaults;
-(void)saveGoal2Defaults;


@end
