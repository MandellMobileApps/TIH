//
//  GoalGamePlanViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/13/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"
#import "GoalGP1ViewController.h"
#import "GoalGP2ViewController.h"
#import "GoalGP3ViewController.h"

@interface GoalGamePlanViewController : AbstractViewController

@property (nonatomic, strong)  GoalGP1ViewController* goalGP1ViewController;
@property (nonatomic, strong)  GoalGP2ViewController* goalGP2ViewController;
@property (nonatomic, strong)  GoalGP3ViewController* goalGP3ViewController;
@property (nonatomic) NSInteger gamePlanIndex;
@property (nonatomic, strong) IBOutlet UIButton* goalGP1Button;
@property (nonatomic, strong) IBOutlet UIButton* goalGP2Button;
@property (nonatomic, strong) IBOutlet UIButton* goalGP3Button;

@end
