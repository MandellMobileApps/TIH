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

@property (nonatomic, strong) NSMutableArray *goalArray;
@property (nonatomic, strong) NSMutableArray *activityArray;
@property (nonatomic, strong) NSMutableArray *timeArray;

@property (nonatomic, strong) UIButton *goalButton;

@property (nonatomic, strong) UILabel *label;

@end
