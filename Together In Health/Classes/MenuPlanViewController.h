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
@class MenuMeal;
@class MenuPlanViewController;
@class AppDelegate;
@class MenuDay;

@interface MenuPlanViewController : AbstractViewController

@property (nonatomic, strong) AddMenuItemViewController *addMenuItemViewController;
@property (nonatomic, strong) MenuDay *selectedMenuDay;
@property (nonatomic, strong) NSString *selectedMenuDayName;
@property (nonatomic, strong) NSArray *weekdays;


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
