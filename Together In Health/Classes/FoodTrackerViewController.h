//
//  FoodTrackerViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"
#import "AbstractViewController.h"


enum webViewType2 {
    aboutTIH = 0,
    balance = 1,
    fAQs = 2,
    directions = 3,
    disclaimer = 7,
    
};

//@class FoodTrackerCell;
@class Food;
@class ActivityTrackerViewController;
@class ChoosePlateViewController;
@class UnderstandBalanceViewController;
@class MasterTrackerViewController;

//NSString *const UITextAttributeTextColor;

@interface FoodTrackerViewController : AbstractViewController

@property (nonatomic) int plateType;



@property (nonatomic, strong) NSArray *addCellArray;
@property (nonatomic, weak) MasterTrackerViewController *masterTrackerViewController;
@property (nonatomic, strong) NSArray *plateImageArray;
@property (nonatomic, strong) NSMutableArray *alldayFoodArray;

@property (nonatomic, strong) IBOutlet UILabel *dayLabel;
@property (nonatomic, strong) IBOutlet UILabel *locationLabel;
@property (nonatomic, strong) IBOutlet UITableView* thisTableView;
@property (nonatomic, strong) FoodTrackerViewController* foodTrackerViewController;
@property (nonatomic, strong) Food* food;
//@property (nonatomic, strong) FoodTrackerCell* foodTrackerCell;

@property (nonatomic, strong) ActivityTrackerViewController* activityTrackerViewController;
@property (nonatomic, strong) ChoosePlateViewController* choosePlateViewController;
@property (nonatomic, strong) UnderstandBalanceViewController* understandBalanceViewController;



-(IBAction)food:(id)sender;
-(IBAction)sleep:(id)sender;
-(IBAction)stress:(id)sender;
-(IBAction)activity:(id)sender;
-(IBAction)drink:(id)sender;

-(IBAction)doneSettings:(id)sender;

@property (nonatomic, strong) IBOutlet UIButton *backwardButton;
@property (nonatomic, strong) IBOutlet UIButton *forwardButton;


-(void)settings:(id)sender;

+ (NSCalendar *)currentCalendar;


@property (nonatomic, strong) NSMutableArray* foodPackage;

-(IBAction)addPlate:(id)sender;
-(IBAction)addWater:(id)sender;

-(IBAction)backDay:(id)sender;
-(IBAction)forwardDay:(id)sender;


@property (nonatomic, strong) IBOutlet UIView *paidMenuView;

-(void)hideFreeTabs;

@property (nonatomic, strong) IBOutlet UIView *pickerViewContainer;
@property (nonatomic, strong) IBOutlet UIPickerView* pickerView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *detaildataArray;
@property (nonatomic, strong) NSArray *opendetaildataArray;
@property (nonatomic, strong) NSArray *amtArray;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic) int currentSelection;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic,strong) NSString* thisReuseIdentifier;

@property (nonatomic, strong) NSArray *waterAmountArray;
@property (nonatomic, strong) NSArray *dessertAmountArray;

@property (nonatomic, strong) IBOutlet UIButton *changeDayButton;
-(IBAction)changeDay:(id)sender;

@property (nonatomic, strong) IBOutlet UIView *datePickerViewContainer;
@property (nonatomic, strong) IBOutlet UIDatePicker* datePickerView;
@property (nonatomic, strong) NSDate* datePickerDate;

//@property (nonatomic, strong) Food *addPlate;
//-(void)foodSelected:(Food*)food;
//-(void)foodUpdated:(Food*)food;
//-(void)moodSelected:(Food*)food;
//-(void)moodUpdated:(Food*)food;

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

-(IBAction)directions:(id)sender;
-(IBAction)doneDirectionView:(id)sender;
-(IBAction)noShow:(id)sender;
@property (nonatomic, strong) IBOutlet UIView *directionsView;
@property (nonatomic) BOOL isShow;
@property (nonatomic) BOOL showIsOn;
@property (nonatomic, strong) IBOutlet UIButton *noShowButton;

-(void)dismissOpeningViewController;

@end
