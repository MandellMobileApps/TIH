//
//  AbstractViewController.h
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/iAd.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "DatePickerView.h"

@class Goal;
@class ProgressViewController;
@class AppDelegate;

enum CornerType {
	CornerTypeRounded = 0,
	CornerTypeSquare = 1,
};


@interface AbstractViewController : UIViewController <ADBannerViewDelegate,MFMailComposeViewControllerDelegate>

@property (nonatomic, weak) AppDelegate *appDelegate;

-(void)bannerViewDidLoadAd:(ADBannerView *)banner;
@property(nonatomic) BOOL loadAd;
-(void)viewDidAppear:(BOOL)animated;
@property (nonatomic, strong) IBOutlet UIView *baseContentView;

- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;
-(void) openEmailClientWithTo:(NSString*)to andSubject:(NSString*)subject andBody:(NSString*)body;

@property (nonatomic, strong) Goal* goal;

@property (nonatomic) int goalNumber;

@property (nonatomic, weak) ProgressViewController* progressViewController;

@property (nonatomic, strong) NSMutableArray* goalPackage;
@property (nonatomic, strong) NSMutableArray* goal2Package;
@property (nonatomic, strong) NSMutableArray* goal3Package;
@property (nonatomic, strong) NSMutableArray *goals;


//- (IBAction)buttonTapped1:(id)sender;
//- (IBAction)buttonTapped2:(id)sender;
//- (IBAction)buttonTapped3:(id)sender;
//- (IBAction)buttonTapped4:(id)sender;
//- (IBAction)buttonTapped5:(id)sender;

@property (nonatomic, strong) IBOutlet UIButton *step1;
@property (nonatomic, strong) IBOutlet UIButton *step2;
@property (nonatomic, strong) IBOutlet UIButton *step3;
@property (nonatomic, strong) IBOutlet UIButton *step4;
@property (nonatomic, strong) IBOutlet UIButton *step5;
@property (nonatomic, strong) IBOutlet UIButton *clearAllButton;
@property (nonatomic, strong) IBOutlet UIButton *resignKeyboardButton;
//-(IBAction)resignKeyboard:(id)sender;


//@property (weak, nonatomic) IBOutlet UITextField *textFieldGoal;
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

//-(IBAction)trackProgress:(id)sender;
//-(IBAction)checkGoal:(id)sender;
//-(IBAction)gamePlan:(id)sender;
//-(IBAction)clearAll:(id)sender;
//-(void)saveDefaults;

//@property (nonatomic, strong) IBOutlet UIButton *gamePlanButton;
//@property (nonatomic, strong) IBOutlet UIButton *goalCheckButton;
//@property (nonatomic) BOOL buttonTappedStep1On;
//@property (nonatomic) BOOL buttonTappedStep2On;
//@property (nonatomic) BOOL buttonTappedStep3On;
//@property (nonatomic) BOOL buttonTappedStep4On;
//@property (nonatomic) BOOL buttonTappedStep5On;


//-(void) saveGoal1Persistent;
//-(void) loadGoal1Persistent;
//-(void) saveGoal2Persistent;
//-(void) loadGoal2Persistent;
//-(void) saveGoal3Persistent;
//-(void) loadGoal3Persistent;
//-(void) createGoalPackage;

-(NSArray*)objectsForFilename:(NSString*)filename;
-(NSString*)pathForFilename:(NSString*)filename;
-(void) updateForOrientationChange;
-(BOOL)string:(NSString*)string containsString:(NSString*)other;


@property(nonatomic,strong) UIView* keyboardView;
@property(nonatomic,strong) NSMutableString* keyboardEntry;
@property(nonatomic,strong) UILabel* keyboardTitleLabel;
@property(nonatomic,strong) UILabel* keyboardUnitsLabel;
@property(nonatomic,strong) UILabel* keyboardEntryLabel;
@property (nonatomic)  NSInteger  keyboardTag;

@property (nonatomic) BOOL stepsKeypadShowing;
- (void)keyboardButtonClicked:(UIButton*)button;
- (void)keyboardEntryUpdated:(NSString*)entry tag:(NSInteger)tag;
-(void)addNumberPadForString:(NSString*)currentValue withTitle:(NSString*)title andUnits:(NSString*)units tag:(NSInteger)tag;

-(void)addBorderAround:(id)object cornerType:(NSInteger)corner withColor:(UIColor*)color;
-(void)removeBorderFrom:(id)object;

-(void)updateData;

-(void) shrinkTable:(float)height;
-(void) enlargeTable:(float)height;

-(void)resetDay;



@end
