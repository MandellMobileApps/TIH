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

@property (nonatomic) BOOL isAgree;

@property (nonatomic, strong)FoodTrackerViewController* foodTrackerViewController;
@property (nonatomic, strong)SleepTrackerViewController* sleepTrackerViewController;
@property (nonatomic, strong)ActivityTrackerViewController* activityTrackerViewController;
@property (nonatomic, strong)DrinkTrackerViewController* drinkTrackerViewController;
@property (nonatomic, strong)StressTrackerViewController* stressTrackerViewController;


@property (nonatomic, strong) IBOutlet UIButton* foodButton;
@property (nonatomic, strong) IBOutlet UIButton* activityButton;
@property (nonatomic, strong) IBOutlet UIButton* stressButton;
@property (nonatomic, strong) IBOutlet UIImageView* stressLockImage;
@property (nonatomic, strong) IBOutlet UIButton* sleepButton;
@property (nonatomic, strong) IBOutlet UIImageView* sleepLockImage;
@property (nonatomic, strong) IBOutlet UIButton* drinkButton;
@property (nonatomic, strong) IBOutlet UIImageView* drinkLockImage;

@property (nonatomic) NSUInteger trackerIndex;
@property (nonatomic, strong) IBOutlet UIView *datePickerViewContainer;
//@property (nonatomic, strong) IBOutlet UIDatePicker* datePickerView;
@property (nonatomic, strong) IBOutlet DatePickerView *datePickerView;
@property (nonatomic, strong) IBOutlet UILabel* dayLabel;

// Food Sub Contollers
-(void) addFood:(ChoosePlateViewController*)choosePlateViewController;


@end
