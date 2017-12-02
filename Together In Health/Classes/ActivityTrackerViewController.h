//
//  ActivityTrackerViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"
#import <CoreMotion/CoreMotion.h>

@class Activity;
@class ActivityTrackerCell;
@class ChooseActivityCell;
@class ChooseActivityViewController;
@class Day;
@class MasterTrackerViewController;

@interface ActivityTrackerViewController : AbstractViewController <UITableViewDelegate, UITableViewDataSource, NSCopying>

//@property (nonatomic, strong) NSArray *testActivity;
//@property (nonatomic, strong) NSArray *testTime;
@property (nonatomic, weak) MasterTrackerViewController *masterTrackerViewController;

@property (nonatomic) int currentSelection;
@property (nonatomic, retain) IBOutlet UIView *pickerViewContainer;
@property (nonatomic, strong) IBOutlet UITableView* thisTableView;



@property (nonatomic, strong) NSMutableArray *dailyActivityArray;
@property (nonatomic, strong) NSMutableArray *addActivityArray;

@property (nonatomic, strong) Activity *addActivity;
@property (nonatomic, strong) Activity *editActivity;
-(void)activitySelected:(Activity*)activity;

//@property (nonatomic, strong) NSMutableArray* favoritesArray;
//@property (nonatomic, strong) NSMutableArray* addActivitiesArray;

//@property (nonatomic, strong) NSArray* timeArray;
//@property (nonatomic, strong) NSArray* chosenActivityArray;
//@property (nonatomic, strong) NSArray* chosenTimeArray;
//@property (nonatomic, strong) NSArray* addActivityArray;

@property (nonatomic, strong) Activity* activity;
@property (nonatomic, strong) ActivityTrackerCell* activityTrackerCell;
@property (nonatomic, strong) ChooseActivityCell* chooseActivityCell;
@property (nonatomic, strong) ChooseActivityViewController* chooseActivityViewController;


@property (nonatomic, strong) ActivityTrackerCell *lastSelectedCell;

@property (nonatomic, strong) NSMutableArray* activityPackage;

-(IBAction)food:(id)sender;

-(IBAction)sleep:(id)sender;
-(IBAction)stress:(id)sender;
-(IBAction)drink:(id)sender;

-(IBAction)backDay:(id)sender;
-(IBAction)forwardDay:(id)sender;
@property (nonatomic) int dayOffset;


@property (nonatomic, strong) IBOutlet UILabel *dayLabel;

@property (nonatomic, strong) IBOutlet UIView *paidMenuView;
@property (nonatomic, strong) IBOutlet UIView *freeMenuView;

@property (nonatomic, strong) IBOutlet UIButton *changeDayButton;
-(IBAction)changeDay:(id)sender;

@property (nonatomic, strong) IBOutlet UIView *datePickerViewContainer;
@property (nonatomic, strong) IBOutlet UIDatePicker* datePickerView;
@property (nonatomic, strong) NSDate* datePickerDate;

-(void)activityUpdated:(Activity*)activity;

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;



@property (nonatomic, strong) CMPedometer *cmPedometer;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
- (IBAction)startTrackingSteps:(id)sender;
- (IBAction)stopTrackingSteps:(id)sender;
- (void)updateStepCounterLabelWithStepCounter:(NSInteger)countedSteps;
- (void)updateLabels:(CMPedometerData *)pedometerData;
- (NSOperationQueue *)operationQueue;




@end
