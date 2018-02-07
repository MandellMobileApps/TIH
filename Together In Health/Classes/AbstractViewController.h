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
#import "PickerContainerView.h"
#import <QuartzCore/QuartzCore.h>
#import "Activity.h"
#import "Food.h"
#import "Plate.h"
#import "Mood.h"
#import "TIHDate.h"
#import "SQLiteAccess.h"
#import "Day.h"
#import "Goal.h"



@class ProgressViewController;
@class AppDelegate;
@class UpGradeViewController;

enum CornerType {
	CornerTypeRounded = 0,
	CornerTypeSquare = 1,
};

enum ButtonIndex {
    ButtonIndexCancel = 20,
    ButtonIndexDone = 21,
    ButtonIndexSave = 22,
    ButtonIndexBackspace = 23,
};

@interface AbstractViewController : UIViewController <ADBannerViewDelegate,MFMailComposeViewControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, weak) AppDelegate *appDelegate;

@property(nonatomic,strong) IBOutlet UILabel* navbarTitleLabel;
@property(nonatomic,strong) IBOutlet UIView* navbarView;
@property(nonatomic,strong) IBOutlet UIButton* leftNavbarButton;
@property(nonatomic,strong) IBOutlet UIButton* RightNavbarButton;
@property (strong, nonatomic) IBOutlet UITableView *thisTableView;

@property(nonatomic) BOOL changeMade;

-(void)bannerViewDidLoadAd:(ADBannerView *)banner;
@property(nonatomic) BOOL loadAd;

@property (nonatomic, strong) IBOutlet UIView *baseContentView;

- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;
-(void) openEmailClientWithTo:(NSString*)to andSubject:(NSString*)subject andBody:(NSString*)body;


@property (nonatomic, weak) ProgressViewController* progressViewController;


@property (nonatomic, strong) IBOutlet UIButton *resignKeyboardButton;

-(NSArray*)objectsForFilename:(NSString*)filename;
-(NSString*)pathForFilename:(NSString*)filename;
-(void) updateForOrientationChange;
-(BOOL)string:(NSString*)string containsString:(NSString*)other;



@property (nonatomic) BOOL transitioning;
@property (nonatomic) BOOL keypadShowing;

@property (nonatomic, strong) DatePickerView *datePickerView;
@property (nonatomic, strong) PickerContainerView *pickerContainerView;

@property(nonatomic,strong) IBOutlet UILabel* drinkPickerLabel;

@property(nonatomic,strong) UIView* numberPadView;
@property(nonatomic,strong) NSMutableString* numberPadCurrentValue;
@property(nonatomic) NSInteger numberPadTag;
@property(nonatomic,strong) UILabel* numberPadTitleLabel;
@property(nonatomic,strong) UILabel* numberPadUnitsLabel;
@property(nonatomic,strong) UILabel* numberPadEntryLabel;
@property(nonatomic) float numberPadHeight;
@property(nonatomic) float numberPadWidth;

@property (nonatomic, strong) IBOutlet UIView *pickerViewContainer;
@property (nonatomic, strong) IBOutlet UIPickerView* pickerView;
@property(nonatomic,strong) UILabel* pickerTitleLabel;
@property(nonatomic,strong) NSArray* pickerComponentsArrays;
@property (nonatomic)  NSInteger  pickerTag;
@property(nonatomic) float pickerHeight;
@property(nonatomic) float pickerWidth;
@property (nonatomic) CGRect pickerHideRect;
@property (nonatomic) CGRect pickerShowRect;


-(void)addNumberPadForString:(NSString*)currentValue withTitle:(NSString*)title andUnits:(NSString*)units tag:(NSInteger)tag;
- (void)numberPadButtonClicked:(UIButton*)button;
- (void)numberPadEntryUpdated:(NSString*)entry forTag:(NSInteger)tag;
- (void)removeNumberPad;

-(void)addDatePickerForDate:(NSDate*)date withTitle:(NSString*)title tag:(NSInteger)tag;
- (void)datePickerButtonClicked:(UIButton*)button;
- (void)datePickerDidChange:(NSDate*)date tag:(NSInteger)tag;

-(void)addPickerViewForArrays:(NSArray*)arrays defaultValues:(NSArray*)defaults animated:(BOOL)animated withTitle:(NSString*)title tag:(NSInteger)tag;
- (void)pickerViewButtonClicked:(UIButton*)button;
- (void)pickerViewDidSelect:(UIPickerView *)pickerView tag:(NSInteger)tag;

-(void)addBorderAround:(id)object cornerType:(NSInteger)corner withColor:(UIColor*)color;
-(void)removeBorderFrom:(id)object;

-(void)updateData;

-(void) shrinkTable:(float)height;
-(void) enlargeTable:(float)height;

-(void)resetDay;
-(void)displayAlert:(NSString*)message;

@property (nonatomic, strong)UpGradeViewController* upGradeViewController;
-(IBAction)loadUpgradeViewController;
@property(nonatomic, strong) IBOutlet UIButton* upgradeNowButton;

-(void)verifyCancel;

@end
