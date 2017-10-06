//
//  StressTrackerViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/27/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class Stress;
@class Day;
@class MasterTrackerViewController;

enum stressType {
    stressStress = 1,
    energy = 2,
    concentration = 3,
    mood = 4,
    coping = 5,

};

@interface StressTrackerViewController : AbstractViewController
@property (nonatomic, weak) MasterTrackerViewController *masterTrackerViewController;

@property (nonatomic, strong) Stress *stress;
@property (nonatomic, strong) Day *day;
@property (nonatomic, strong) AppDelegate *appDelegate;

@property (nonatomic, strong) IBOutlet UIScrollView *thisScrollView;

@property (nonatomic, strong) IBOutlet UISegmentedControl *stressSegmentControl;
@property (nonatomic, strong) IBOutlet UISegmentedControl *energySegmentControl;
@property (nonatomic, strong) IBOutlet UISegmentedControl *moodSegmentControl;
@property (nonatomic, strong) IBOutlet UISegmentedControl *concentrationSegmentControl;
@property (nonatomic, strong) IBOutlet UISegmentedControl *copingSegmentControl;
@property (nonatomic, strong) IBOutlet UIButton *resetButton;

@property (nonatomic) int stressType;

-(IBAction)stress:(id)sender;
-(IBAction)energy:(id)sender;
-(IBAction)mood:(id)sender;
-(IBAction)concentration:(id)sender;
-(IBAction)coping:(id)sender;
-(IBAction)resetStress:(id)sender;
-(IBAction)resetEnergy:(id)sender;
-(IBAction)resetConcentraton:(id)sender;
-(IBAction)resetMood:(id)sender;
-(IBAction)resetCoping:(id)sender;

@property (nonatomic, strong) NSMutableArray *stressArray;

//@property (nonatomic) BOOL isStress;
@property (nonatomic) BOOL isEnergy;
@property (nonatomic) BOOL isMood;
@property (nonatomic) BOOL isConcentration;
@property (nonatomic) BOOL isCoping;

@property (nonatomic) int dayOffset;
@property (nonatomic, strong) IBOutlet UILabel *dayLabel;

@property (nonatomic, strong) IBOutlet UIDatePicker *pickerView;
@property (nonatomic, strong) IBOutlet UIView *pickerViewContainer;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic) int currentSelection;

@property (nonatomic, strong) IBOutlet UIButton *changeDayButton;
-(IBAction)changeDay:(id)sender;

@property (nonatomic, strong) IBOutlet UIView *datePickerViewContainer;
@property (nonatomic, strong) IBOutlet UIDatePicker* datePickerView;
@property (nonatomic, strong) NSDate* datePickerDate;

-(IBAction)backDay:(id)sender;
-(IBAction)forwardDay:(id)sender;


@end
