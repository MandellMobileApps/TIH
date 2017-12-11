//
//  ChooseDrinkViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class ChooseDrinkCell;
@class Drink;
@class DrinkTrackerViewController;
@class Day;


@interface ChooseDrinkViewController : AbstractViewController <UITableViewDataSource, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIView *containerView;

@property (nonatomic, strong) ChooseDrinkCell *chooseDrinkCell;
@property (nonatomic, strong) Drink *drink;
@property (nonatomic, strong) DrinkTrackerViewController *drinkTrackerViewController;

@property (nonatomic, strong) IBOutlet UITableView *thisTableView;
@property (nonatomic, strong) NSMutableArray *healthyDrinkArray;
@property (nonatomic, strong) NSMutableArray *sugaryDrinkArray;
@property (nonatomic, strong) NSMutableArray *caffeineDrinkArray;
@property (nonatomic, strong) NSMutableArray *alcoholDrinkArray;
@property (nonatomic, strong) NSMutableArray *otherDrinkArray;
@property (nonatomic, strong) NSMutableArray *healthyDrinkFilteredArray;
@property (nonatomic, strong) NSMutableArray *sugaryDrinkFilteredArray;
@property (nonatomic, strong) NSMutableArray *caffeineDrinkFilteredArray;
@property (nonatomic, strong) NSMutableArray *alcoholDrinkFilteredArray;
@property (nonatomic, strong) NSMutableArray *otherDrinkFilteredArray;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;


@property (nonatomic, strong) NSDate *healthyDrinks;
@property (nonatomic, strong) NSDate *sugaryDrinks;
@property (nonatomic, strong) NSDate *caffeineDrinks;
@property (nonatomic, strong) NSDate *alcoholDrinks;
@property (nonatomic, strong) NSMutableDictionary* thisDrinkDict;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *detaildataArray;
@property (nonatomic, strong) NSArray *opendetaildataArray;
@property (nonatomic, strong) NSArray *amtArray;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic) NSInteger currentSelection;

@property (nonatomic, retain) IBOutlet UISearchBar* searchBar;
@property (nonatomic)  CGRect searchBarHideRect;
@property (nonatomic)  CGRect searchBarShowRect;
@property (nonatomic, retain) IBOutlet UILabel* searchLabel;
@property NSInteger selectedDrinkType;
-(void)addDrink;
-(void)addHealthDrinkArrayObjectAtIndex;
-(IBAction)datePickerDoneButtonTapped:(id)sender;
-(void) showDatePickerForIndex:(NSInteger)selection;

-(IBAction)buttonTapped:(id)sender;

@end
