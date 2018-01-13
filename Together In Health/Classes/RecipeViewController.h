//
//  RecipeViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/11/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"
#import "MenuPlan.h"


@class RecipeDetailViewController;
@class FullOpeningViewController;

@interface RecipeViewController : AbstractViewController

@property (nonatomic, strong) RecipeDetailViewController* recipeDetailViewController;
@property (nonatomic, strong) MenuPlan* menuPlan;
@property (nonatomic, strong) FullOpeningViewController* fullOpeningViewController;

@property (nonatomic) BOOL myButtonOn;


@property(nonatomic,strong) NSString* filename;
@property(nonatomic,strong) NSArray* objects0;
@property(nonatomic,strong) NSArray* objects1;
@property(nonatomic,strong) NSArray* objects2;
@property(nonatomic,strong) NSArray* objects3;
@property(nonatomic,strong) NSArray* objects4;

@property(nonatomic,strong) NSArray* objects0Filtered;
@property(nonatomic,strong) NSArray* objects1Filtered;
@property(nonatomic,strong) NSArray* objects2Filtered;
@property(nonatomic,strong) NSArray* objects3Filtered;
@property(nonatomic,strong) NSArray* objects4Filtered;



@property (nonatomic, strong) IBOutlet UITableView* thisTableView;
@property (nonatomic, strong) NSArray* testArray;

@property(nonatomic,strong) NSDictionary* object;


@property (nonatomic, strong) NSMutableData *buffer;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

//-(void)showSearchScope;
@property (nonatomic, strong) IBOutlet UISearchBar* searchBar;
@property (nonatomic)  CGRect searchBarHideRect;
@property (nonatomic)  CGRect searchBarShowRect;
@property (nonatomic, retain) IBOutlet UILabel* searchLabel;
@property (nonatomic, strong) NSString *filterString;


@property (nonatomic, strong) IBOutlet UILabel *filteredLabel;

@property (nonatomic, strong) IBOutlet UILabel* tableStatusMessage;

@property (nonatomic, strong) NSString* currentSelection;

@property (nonatomic, strong) NSArray* filteredAgents;
@property (nonatomic, strong) NSMutableArray* randomArray;

@property (nonatomic, strong) IBOutlet UISearchController *searchController;
@property (nonatomic, strong) IBOutlet UITableView *searchResultsTableView;
@property (nonatomic, strong) NSArray* filteredContentList;

@property (nonatomic, strong) NSArray* myArray2;

//-(void)hideSearchScope;
//-(void) sortAgents;
//-(void)updateSelectedButton;
//-(void)addNewTableData;
//-(void)scrollToSelectedAgent;

//-(void)recipe;
//-(void)createRandomArray;
//-(int)getRandomNumberWithMax;

@property (nonatomic, strong) IBOutlet UIView *alarmSearchView;
-(void)generateRandom;
-(IBAction)random:(id)sender;
@property (nonatomic, strong) IBOutlet UIButton *someButton;

-(void)updateViewController;
@property(nonatomic,strong) NSMutableArray* myRecipes;

@property (nonatomic, strong) IBOutlet UIView *menuPlanView;

@property (nonatomic) BOOL breakfastIsOn;
@property (nonatomic) BOOL lunchIsOn;
@property (nonatomic) BOOL dinnerIsOn;
@property (nonatomic) BOOL snackIsOn;


@end
