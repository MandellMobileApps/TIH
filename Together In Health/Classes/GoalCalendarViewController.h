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





@interface GoalCalendarViewController : AbstractViewController <CAAnimationDelegate>


@property (nonatomic, strong) Calendar	*calendarcurrent;
@property (nonatomic, strong) Calendar	*calendarnext;

@property (nonatomic	) NSInteger			currentYear;
@property (nonatomic	) NSInteger			currentMonth;

@property (nonatomic	) NSInteger			nextYear;
@property (nonatomic	) NSInteger			nextMonth;

@property (nonatomic, strong) IBOutlet UILabel *otherLabels; 

@property (nonatomic, strong) IBOutlet UILabel *monthNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *yearLabel;
@property (nonatomic, strong) IBOutlet UILabel *monthLabel;

@property (nonatomic, strong) IBOutlet UIButton		*prevYearButton;
@property (nonatomic, strong) IBOutlet UIButton		*prevMonthButton;
@property (nonatomic, strong) IBOutlet UIButton		*nextMonthButton;
@property (nonatomic, strong) IBOutlet UIButton		*nextYearButton;

@property (nonatomic, strong) IBOutlet UIView *overallView;
@property (nonatomic, strong) IBOutlet UIView *containerview;
@property (nonatomic, strong) IBOutlet UIView *calendarview;
@property (nonatomic, strong) IBOutlet UIView *calendarnavview;
@property (nonatomic, strong) IBOutlet UIView *calendardaysview;
@property (nonatomic, strong) IBOutlet UIView *swipeview;
@property (nonatomic, strong) IBOutlet UIImageView *pictureview;

@property (nonatomic) BOOL transitioning;
@property (nonatomic, strong) NSMutableArray *settings;
@property (nonatomic) CGPoint startTouchPosition;
@property (nonatomic, strong) NSString *displayoption;
@property (nonatomic, strong) NSTimer	*timer;
@property (nonatomic, strong) UIView *navbarView;



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


-(void)adjustCalendarframewith:(float)height;

-(IBAction)gamePlan:(id)sender;

@end
