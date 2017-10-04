//
//  MasterTrackerViewController.h
//  Together In Health
//
//  Created by Jon Mandell on 10/4/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "AbstractViewController.h"
#import "FoodTrackerViewController.h"
#import "SleepTrackerViewController.h"
#import "ActivityTrackerViewController.h"
#import "DrinkTrackerViewController.h"
#import "StressTrackerViewController.h"

@interface MasterTrackerViewController : AbstractViewController

@property (nonatomic, strong)FoodTrackerViewController* foodTrackerViewController;
@property (nonatomic, strong)SleepTrackerViewController* sleepTrackerViewController;
@property (nonatomic, strong)ActivityTrackerViewController* activityTrackerViewController;
@property (nonatomic, strong)DrinkTrackerViewController* drinkTrackerViewController;
@property (nonatomic, strong)StressTrackerViewController* stressTrackerViewController;
@property (nonatomic, strong) IBOutlet UIButton* foodButton;
@property (nonatomic, strong) IBOutlet UIButton* sleepButton;
@property (nonatomic, strong) IBOutlet UIButton* activityButton;
@property (nonatomic, strong) IBOutlet UIButton* drinkButton;
@property (nonatomic, strong) IBOutlet UIButton* stressButton;
@property (nonatomic, strong) IBOutlet UILabel *dayLabel;

-(IBAction)drink:(id)sender;
-(IBAction)activity:(id)sender;
-(IBAction)sleep:(id)sender;
-(IBAction)food:(id)sender;
-(IBAction)stress:(id)sender;


@end
