//
//  ChooseActivityViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AbstractViewController.h"

@class ChooseActivityCell;
@class Activity;
@class ActivityTrackerViewController;
@class Day;


@interface ChooseActivityViewController : AbstractViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray* favoriteActivities;
//@property (nonatomic, strong) NSMutableArray* chosenActivityArray;
@property (nonatomic, strong) NSMutableArray* filteredActivityArray;

@property IBOutlet UISearchBar* activitySearchBar;

@property (nonatomic, strong) IBOutlet UITableView* thisTableView;

@property (nonatomic, strong) ChooseActivityCell* chooseActivityCell;
@property (nonatomic, strong) Activity* activity;
@property (nonatomic, weak) ActivityTrackerViewController* activityTrackerViewController;
@property (nonatomic, strong) Day* day;


//-(void)addFavoritesActivity;
//-(void)addFavoritesActivityArrayObjectAtIndex:(NSInteger)integer;
//-(void)addFavoritesActivityArrayObjectAtIndex;
//-(void)removeFavoritesActivityArrayObjectAtIndex;
//-(void)removeFavoritesActivity;

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope;
- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController;

-(IBAction)datePickerDoneButtonTapped:(id)sender;
-(void) showDatePickerForIndex:(NSInteger)selection;
@property (nonatomic, strong) IBOutlet UIView *pickerViewContainer;
@property (nonatomic, strong) IBOutlet UIPickerView* pickerView;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, strong) IBOutlet UILabel *activityPickerLabel;
@property (nonatomic) int currentSelection;
@property (nonatomic, strong) NSArray *amtArray;
@property (nonatomic, strong) NSArray *amtdescArray;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIView *titleView;
@property (nonatomic, strong) IBOutlet UIView *containerView;
@property (nonatomic)  CGRect searchBarHideRect;
@property (nonatomic)  CGRect searchBarShowRect;

@end


