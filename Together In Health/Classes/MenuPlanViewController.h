//
//  MenuPlanViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuPlanCell;
@class AddMenuItemViewController;
@class MenuPlan;

@interface MenuPlanViewController : UIViewController

@property (nonatomic, strong) MenuPlanCell *menuPlanCell;
@property (nonatomic, strong) AddMenuItemViewController *addMenuItemViewController;
@property (nonatomic, strong) MenuPlan *menuPlan;

@property (nonatomic, strong) NSArray *menuDayArray;
@property (nonatomic, strong) NSMutableArray *sundayArray;
@property (nonatomic, strong) NSMutableArray *mondayArray;
@property (nonatomic, strong) NSMutableArray *tuesdayArray;
@property (nonatomic, strong) NSMutableArray *wednesdayArray;
@property (nonatomic, strong) NSMutableArray *thursdayArray;
@property (nonatomic, strong) NSMutableArray *fridayArray;
@property (nonatomic, strong) NSMutableArray *saturdayArray;
@property (nonatomic, strong) IBOutlet UITableView *thisTableView;

-(IBAction)recipes:(id)sender;


-(IBAction)textFieldReturn:(id)sender;
-(IBAction)reset:(id)sender;




@end
