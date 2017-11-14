//
//  GoalCalendarViewController.h
//  Together In Health
//
//  Created by Jon Mandell on 9/3/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "AbstractViewController.h"
#import "Calendar.h"
#import "ColorsClass.h"
#import <QuartzCore/QuartzCore.h>
#import "DatePickerView.h"
#import "CheckBoxView.h"






@interface GoalCalendarViewController : AbstractViewController <CAAnimationDelegate>




@property (nonatomic, strong) IBOutlet UIView *calendarview;
@property (nonatomic, strong) IBOutlet UIView *calendarDaysview;
@property (nonatomic, strong) IBOutlet UIView *calendarnavview;
@property (nonatomic, strong)  Calendar    *calendarcurrent;


@property (nonatomic	) NSInteger			currentYear;
@property (nonatomic	) NSInteger			currentMonth;

@property (nonatomic, strong) IBOutlet UILabel *otherLabels; 

@property (nonatomic, strong) IBOutlet UILabel *monthNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *yearLabel;
@property (nonatomic, strong) IBOutlet UILabel *monthLabel;

@property (nonatomic, strong) IBOutlet UIButton		*prevYearButton;
@property (nonatomic, strong) IBOutlet UIButton		*prevMonthButton;
@property (nonatomic, strong) IBOutlet UIButton		*nextMonthButton;
@property (nonatomic, strong) IBOutlet UIButton		*nextYearButton;

@property (nonatomic, strong) IBOutlet UIButton        *goal1Button;
@property (nonatomic, strong) IBOutlet UIButton        *goal2Button;
@property (nonatomic, strong) IBOutlet UIButton        *goal3Button;

@property (nonatomic, strong) IBOutlet UILabel        *goal1Label;
@property (nonatomic, strong) IBOutlet UILabel        *goal2Label;
@property (nonatomic, strong) IBOutlet UILabel        *goal3Label;

@property (nonatomic, strong) IBOutlet UIView *swipeview;
@property (nonatomic, strong) IBOutlet UIImageView *pictureview;

@property (nonatomic) BOOL transitioning;
@property (nonatomic, strong) NSMutableArray *settings;
@property (nonatomic) CGPoint startTouchPosition;
@property (nonatomic, strong) NSString *displayoption;
@property (nonatomic, strong) NSTimer	*timer;

@property (nonatomic, strong) DatePickerView *datePickerView;
@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) IBOutlet UIView *goal1ColorView;
@property (nonatomic, strong) IBOutlet UIView *goal2ColorView;
@property (nonatomic, strong) IBOutlet UIView *goal3ColorView;

@property (nonatomic, strong) IBOutlet UIButton  *coverButton;
@property (nonatomic, strong) IBOutlet UIView *dayGoalsView;
@property (nonatomic, strong) Day *selectedGoalsDay;

@property (nonatomic, strong) IBOutlet UILabel  *dayViewTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel  *dayViewGoal1Label;
@property (nonatomic, strong) IBOutlet UILabel  *dayViewGoal2Label;
@property (nonatomic, strong) IBOutlet UILabel  *dayViewGoal3Label;
@property (nonatomic, strong) IBOutlet CheckBoxView  *dayViewGoal1Checkbox;
@property (nonatomic, strong) IBOutlet CheckBoxView  *dayViewGoal2Checkbox;
@property (nonatomic, strong) IBOutlet CheckBoxView  *dayViewGoal3Checkbox;

-(IBAction)dayViewButtonTapped:(UIButton*)sender;

-(IBAction)setGoal:(id)sender;


-(void)updateNavigationBarTitle;
-(void)flipView;
-(void) fliptoCalendarWithAnimation:(BOOL)animated;
-(void) fliptoPictureWithAnimation:(BOOL)animated;
-(IBAction)showSettingsView:(id)sender;
-(void)updatelabelsWithReset:(bool)reset;
-(void)starttimer;

-(NSInteger)getviewheight;
-(void)GotoToday;
- (IBAction)prevMonth:(id)sender;
- (IBAction)nextMonth:(id)sender;
- (IBAction)prevYear:(id)sender;
- (IBAction)nextYear:(id)sender;
-(void)performTransition:(NSInteger)direction;
- (void)daySelectedSingleTap:(id)sender;
- (void)dayButtonTapped:(id)sender;

-(NSString*)monthName:(NSInteger)month;



-(IBAction)gamePlan:(id)sender;

@end
