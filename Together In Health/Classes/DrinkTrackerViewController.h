//
//  DrinkTrackerViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class DrinkTrackerCell;
@class Drink;
@class ChooseDrinkViewController;
@class Day;
@class MasterTrackerViewController;
@interface DrinkTrackerViewController : AbstractViewController
@property (nonatomic, weak) MasterTrackerViewController *masterTrackerViewController;

@property (nonatomic, strong) DrinkTrackerCell* drinkTrackerCell;
@property (nonatomic, strong) Drink* drink;
@property (nonatomic, strong) ChooseDrinkViewController* chooseDrinkViewController;



@property (nonatomic, strong) IBOutlet UITableView* thisTableView;

@property (nonatomic, strong) NSMutableArray* drinkPackage;
@property (nonatomic, strong) NSMutableArray* drinkArray;
@property (nonatomic, strong) NSArray* ounceArray;
@property (nonatomic, strong) NSArray* detaildataArray;
@property (nonatomic, strong) NSArray* addDrinkArray;
@property (nonatomic, strong) NSString* drinkString;

@property (nonatomic, strong) NSMutableArray *allDrinkArray;

@property (nonatomic, strong) IBOutlet UIView *pickerViewContainer;
@property (nonatomic, strong) IBOutlet UIPickerView* pickerView;
@property (nonatomic) int currentSelection;


@property (nonatomic, strong) IBOutlet UITextView* thisTextView;


-(void)createDrinkPackage;

-(IBAction)food:(id)sender;
-(IBAction)activity:(id)sender;
-(IBAction)sleep:(id)sender;
-(IBAction)stress:(id)sender;

-(void)resetDay;
-(IBAction)backDay:(id)sender;
-(IBAction)forwardDay:(id)sender;
@property (nonatomic) int dayOffset;
@property (nonatomic, strong) IBOutlet UILabel *dayLabel;

@property (nonatomic, strong) IBOutlet UIView *datePickerViewContainer;
@property (nonatomic, strong) IBOutlet UIDatePicker* datePickerView;
@property (nonatomic, strong) NSDate* datePickerDate;


@end
