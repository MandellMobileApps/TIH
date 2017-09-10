//
//  ChooseDrinkViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChooseDrinkCell;
@class Drink;
@class DrinkTrackerViewController;
@class Day;


@interface ChooseDrinkViewController : UIViewController <UITableViewDataSource, UITableViewDataSource>

@property (nonatomic, strong) ChooseDrinkCell *chooseDrinkCell;
@property (nonatomic, strong) Drink *drink;
@property (nonatomic, strong) DrinkTrackerViewController *drinkTrackerViewController;
@property (nonatomic, strong) Day *day;

@property (nonatomic, strong) IBOutlet UITableView *thisTableView;
@property (nonatomic, strong) NSMutableArray *healthyDrinkArray;
@property (nonatomic, strong) NSMutableArray *sugaryDrinkArray;
@property (nonatomic, strong) NSMutableArray *caffeineDrinkArray;
@property (nonatomic, strong) NSMutableArray *alcoholDrinkArray;
@property (nonatomic, strong) NSMutableArray *otherDrinkArray;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@property (nonatomic, strong) IBOutlet UILabel *drinkPickerLabel;

@property (nonatomic, strong) IBOutlet UIView *pickerViewContainer;
@property (nonatomic, strong) IBOutlet UIPickerView* pickerView;
@property (nonatomic, strong) NSDate *healthyDrinks;
@property (nonatomic, strong) NSDate *sugaryDrinks;
@property (nonatomic, strong) NSDate *caffeineDrinks;
@property (nonatomic, strong) NSDate *alcoholDrinks;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *detaildataArray;
@property (nonatomic, strong) NSArray *opendetaildataArray;
@property (nonatomic, strong) NSArray *amtArray;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic) int currentSelection;

-(void)addDrink;
-(void)addHealthDrinkArrayObjectAtIndex;
-(IBAction)datePickerDoneButtonTapped:(id)sender;
-(void) showDatePickerForIndex:(NSInteger)selection;

-(IBAction)buttonTapped:(id)sender;

@end
