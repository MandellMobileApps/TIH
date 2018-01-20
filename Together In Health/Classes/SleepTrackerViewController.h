//
//  SleepTrackerViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class Sleep;
@class Day;
@class MasterTrackerViewController;

@interface SleepTrackerViewController : AbstractViewController

//@property (nonatomic, retain) IBOutlet UIDatePicker *pickerView;
//@property (nonatomic, retain) IBOutlet UIView *pickerViewContainer;
//@property (nonatomic, retain) IBOutlet UITableView* thisTableView;
//@property (nonatomic, retain) NSDate *beginWorkhours;
//@property (nonatomic, retain) NSDate *endWorkhours;
//@property (nonatomic, retain) NSArray *dataArray;
//@property (nonatomic, retain) NSArray *detaildataArray;
//@property (nonatomic, retain) NSDateFormatter *dateFormatter;
//@property (nonatomic) int currentSelection;
//
//- (IBAction)dateAction:(id)sender;
//-(IBAction)datePickerDoneButtonTapped:(id)sender;
//-(void) showDatePickerForIndex:(int)selection;
//-(IBAction)resetHours:(id)sender;
@property (nonatomic, weak) MasterTrackerViewController *masterTrackerViewController;

@property (nonatomic, strong) IBOutlet UIScrollView *thisScrollView;
@property (nonatomic, strong) IBOutlet UILabel *dayLabel;

@property (nonatomic, strong) IBOutlet UIView *baseContentView;
@property (nonatomic, strong) NSMutableArray *sleepPackage;
@property (nonatomic, strong) Sleep* sleep;

@property (nonatomic, weak) AppDelegate *appDelegate;

@property (nonatomic, strong) IBOutlet UISegmentedControl *rateSleepSegment;
@property (nonatomic, strong) IBOutlet UISegmentedControl *restedSegment;

-(IBAction)rateSleep:(id)sender;
-(IBAction)rested:(id)sender;


@property (nonatomic, strong) NSDate *beginSleephours;
@property (nonatomic, strong) NSDate *endSleephours;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *detaildataArray;
@property (nonatomic, strong) NSArray *opendetaildataArray;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic) NSInteger currentSelection;

- (IBAction)dateAction:(id)sender;
-(IBAction)datePickerDoneButtonTapped:(id)sender;
-(void) showDatePickerForIndex:(NSInteger)selection;
-(IBAction)resetHours:(id)sender;


@property (nonatomic, strong) IBOutlet UIButton* foodButton;
@property (nonatomic, strong) IBOutlet UIButton* sleepButton;
@property (nonatomic, strong) IBOutlet UIButton* stresButton;
@property (nonatomic, strong) IBOutlet UIButton* activityButton;
@property (nonatomic, strong) IBOutlet UIButton* drinkButton;

-(IBAction)food:(id)sender;
-(IBAction)stress:(id)sender;
-(IBAction)activity:(id)sender;
-(IBAction)drink:(id)sender;

-(IBAction)resetRested:(id)sender;
-(IBAction)resetRate:(id)sender;
-(IBAction)backDay:(id)sender;
-(IBAction)forwardDay:(id)sender;

@property (nonatomic, strong) IBOutlet UIButton *forwardButton;
@property (nonatomic, strong) IBOutlet UIButton *backwardButton;
@property (nonatomic) int dayOffset;

-(IBAction)changeDay:(id)sender;


@end
