//
//  ExercisePlanSetupViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 9/18/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExercisePlanCell.h"

@interface ExercisePlanSetupViewController : UIViewController

@property (nonatomic, strong) NSArray *goalArray;
@property (nonatomic, strong) NSArray *activityArray;
@property (nonatomic, strong) NSArray *timeArray;

@property (nonatomic, strong) UIButton *goalButton;

@property (nonatomic, strong) UILabel *label;

@end
