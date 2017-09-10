//
//  SeasonalVegGameViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/7/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class SeasonalVegCell;

@interface SeasonalVegGameViewController : AbstractViewController

@property (nonatomic, strong) IBOutlet UIView* baseContentView;
@property (nonatomic, strong) IBOutlet UIScrollView* thisScrollView;

@property (nonatomic, strong) IBOutlet UIButton *showInfoButton;
@property (nonatomic, strong) IBOutlet UIButton *cSAButton;
@property (nonatomic, strong) IBOutlet UIButton *marketButton;
@property (nonatomic, strong) IBOutlet UITextField *stateField;
@property (nonatomic, strong) IBOutlet UITextField *monthField;
@property (nonatomic, strong) IBOutlet UITextField* myProduceField;
@property (nonatomic, strong) IBOutlet UIImageView* myProduceImage;
@property (nonatomic, strong) IBOutlet UIPickerView* pickerViewMonth;
@property (nonatomic, strong) IBOutlet UIPickerView* pickerViewState;
@property (nonatomic, strong) IBOutlet UIButton* recipeButton;
@property (nonatomic, strong) IBOutlet UIButton* doneButton;
@property (nonatomic, strong) IBOutlet UIButton* showVegButton;

@property(nonatomic,strong) NSString* filename;
@property(nonatomic,strong) NSArray* objects0;
@property (strong, nonatomic) NSOperationQueue* mgOperationsQueue;
@property (nonatomic, strong) NSDictionary *object;

@property (nonatomic, strong) IBOutlet UITableView* thisTableView;

@property (nonatomic, strong) SeasonalVegCell* seasonalVegCell;

@property (nonatomic) BOOL doneButtonOn;
-(IBAction)done:(id)sender;
-(IBAction)CSA:(id)sender;
-(IBAction)Market:(id)sender;

-(IBAction)recipes:(id)sender;
-(void)showPickerView;
-(IBAction)showVegetable:(id)sender;
-(IBAction)vegInfo:(id)sender;

-(void)saveDefaults;
@property (nonatomic) int* currentStateSelection;
@property (nonatomic) int* currentMonthSelection;
@property (nonatomic, strong) NSString* currentSelection;

@property (strong, nonatomic) NSArray *updatedRecords;
@property (strong, nonatomic) NSArray *updatedVersions;
@property (strong, nonatomic) NSArray *userArray;
@property (nonatomic) NSInteger currentVersion;
@property (nonatomic) NSInteger newVersion;
@property (nonatomic) BOOL updateEnabled;
@property (strong, nonatomic) NSMutableArray *filesToUpdate;
- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;
-(NSArray*)objectsForFilename:(NSString*)filename;
-(NSString*)pathForFilename:(NSString*)filename;

@property (nonatomic, strong) NSArray* testArray;

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

@property (nonatomic, strong) NSArray* filteredAgents;
@property (nonatomic, strong) NSMutableArray* randomArray;

-(void)getUserData;
-(void)getData;
-(void)recipe;
-(void)createRandomArray;
-(int)getRandomNumberWithMax;

@property (nonatomic, strong) NSArray *stateArray;
@property (nonatomic, strong) NSArray *monthArray;
@property (nonatomic, strong) NSArray *tableViewArray;
@property (nonatomic, strong) IBOutlet UIView* pickerViewContainer;

@property (nonatomic, strong) NSMutableArray *saveArray;


-(void)updateViewController;

@end

