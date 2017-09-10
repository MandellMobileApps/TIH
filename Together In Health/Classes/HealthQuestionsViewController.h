//
//  HealthQuestionsViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

//enum searchScope {
//    BeginsWith = 1,
//    EndsWith = 2,
//    Contains = 3,
//};

@class HQViewController;

@interface HealthQuestionsViewController : AbstractViewController

@property (nonatomic, strong) HQViewController* hQViewController;

-(void)updateDatabase;
-(void)checkVersion;
@property(nonatomic,strong) NSArray* objects0;
@property(nonatomic,strong) NSArray* objects1;
@property (nonatomic, strong) IBOutlet UITableView* thisTableView;
@property (nonatomic, strong) NSArray* testArray;
@property (nonatomic, strong) NSArray* filteredAgents;
//-(void)showSearchScope;
@property (nonatomic, strong) IBOutlet UISearchBar* searchBar;
@property (nonatomic, strong) IBOutlet UILabel *filteredLabel;
@property (nonatomic, strong) IBOutlet UILabel* tableStatusMessage;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
//-(void)hideSearchScope;
//-(void) sortAgents;
//-(void)updateSelectedButton;
//-(void)addNewTableData;
//-(void)scrollToSelectedAgent;
-(void)getUserData;
-(void)getData;
//-(void)loadBaseViewForObject:(NSDictionary*)object;
@property (nonatomic, strong) NSArray* filteredContentList;

@end
