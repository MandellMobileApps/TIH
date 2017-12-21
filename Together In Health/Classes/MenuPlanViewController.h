//
//  MenuPlanViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class MenuPlanCell;
@class AddMenuItemViewController;
@class MenuPlan;
@class MenuPlanViewController;
@class AppDelegate;

@interface MenuPlanViewController : AbstractViewController

@property (nonatomic, strong) MenuPlanCell *menuPlanCell;
@property (nonatomic, strong) AddMenuItemViewController *addMenuItemViewController;
@property (nonatomic, strong) MenuPlan *menuPlan;
@property (nonatomic, strong) MenuPlanViewController *menuPlanViewController;
@property (nonatomic, strong) AppDelegate *appDelegate;

@property (nonatomic, strong) NSArray *menuDayArray;
@property (nonatomic, strong) NSMutableArray *sundayArray;
@property (nonatomic, strong) NSMutableArray *mondayArray;
@property (nonatomic, strong) NSMutableArray *tuesdayArray;
@property (nonatomic, strong) NSMutableArray *wednesdayArray;
@property (nonatomic, strong) NSMutableArray *thursdayArray;
@property (nonatomic, strong) NSMutableArray *fridayArray;
@property (nonatomic, strong) NSMutableArray *saturdayArray;
@property (nonatomic, strong) IBOutlet UITableView *thisTableView;
@property (nonatomic,strong) UISegmentedControl *menutypeSegment;
@property (nonatomic) int menuTypeRating;
@property (nonatomic, strong) IBOutlet UIButton *upgradeButton;
@property(nonatomic,strong) NSDictionary* object;
@property (nonatomic) BOOL updateEnabled;
@property (strong, nonatomic) NSArray *updatedVersions;
@property (strong, nonatomic) NSMutableArray *filesToUpdate;
@property (nonatomic) NSInteger currentVersion;
@property (nonatomic) NSInteger newVersion;

@property (nonatomic, strong) IBOutlet UIButton *menuPlanButton;
@property (nonatomic, strong) IBOutlet UIButton *addMenuItemButton;
@property (nonatomic) NSUInteger menuPlanIndex;

-(IBAction)menuPlan:(id)sender;
-(IBAction)addMenuItem:(id)sender;

-(IBAction)recipes:(id)sender;


-(IBAction)textFieldReturn:(id)sender;
-(IBAction)reset:(id)sender;




@end
