//
//  ProblemsViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface ProblemsViewController : AbstractViewController

@property (nonatomic, strong) IBOutlet UITableView *thisTableView;

@property (strong, nonatomic) NSArray *updatedRecords;
@property (strong, nonatomic) NSArray *updatedVersions;
@property (strong, nonatomic) NSArray *userArray;

@property (strong, nonatomic) NSOperationQueue* mgOperationsQueue;
@property (strong, nonatomic) NSMutableArray *filesToUpdate;
@property(nonatomic,strong) NSString* filename;
@property(nonatomic,strong) NSArray* objects0;
@property (nonatomic, strong) NSArray* objects1;

-(NSArray*)objectsForFilename:(NSString*)filename;
-(NSString*)pathForFilename:(NSString*)filename;

@property(nonatomic,strong) NSDictionary* object;

@property (nonatomic, strong) NSURLConnection *myConnection;

@property (nonatomic, strong) NSMutableData *buffer;

@property (strong, nonatomic) IBOutlet UIView *updateView;
@property (nonatomic, strong) IBOutlet UIButton* updateVersionButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

-(void)showSearchScope;
@property (nonatomic, strong) IBOutlet UISearchBar* searchBar;
@property (nonatomic, strong) IBOutlet UILabel *filteredLabel;
@property (nonatomic, strong) IBOutlet UILabel* tableStatusMessage;

@property (nonatomic, strong) IBOutlet UIView *randomView;

@property (nonatomic, strong) NSString* currentSelection;

@property (nonatomic, strong) NSArray* filteredAgents;
@property (nonatomic, strong) NSMutableArray* randomArray;

@property (nonatomic, strong) IBOutlet UISearchController *searchController;
@property (nonatomic, strong) IBOutlet UITableView *searchResultsTableView;
@property (nonatomic, strong) NSArray* filteredContentList;

-(void)hideSearchScope;
-(void) sortAgents;
-(void)updateSelectedButton;
-(void)addNewTableData;
-(void)scrollToSelectedAgent;
-(void)getUserData;
-(void)getData;
-(void)recipe;
-(void)createRandomArray;
-(int)getRandomNumberWithMax;

@property (nonatomic, strong) IBOutlet UIView *alarmSearchView;
-(void)generateRandom;
-(IBAction)random:(id)sender;
@property (nonatomic, strong) IBOutlet UIButton *someButton;

@property (nonatomic, strong) IBOutlet UISearchBar *thisSearchBar;

-(IBAction)settings:(id)sender;

@property (nonatomic, strong) NSArray *totalArray;

@end
