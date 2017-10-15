//
//  GoalGP1ViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/13/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class GoalGamePlanViewController;

@interface GoalGP1ViewController : AbstractViewController

@property (nonatomic, weak) GoalGamePlanViewController *goalGamePlanViewController;

@property(nonatomic,strong) IBOutlet UIScrollView* thisScrollView;

@end
