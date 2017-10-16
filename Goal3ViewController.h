//
//  Goal3ViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class GoalSetViewController;

@interface Goal3ViewController : AbstractViewController

@property (nonatomic, weak) GoalSetViewController *goalSetViewController;
@property (nonnull, strong) IBOutlet UIScrollView *thisScrollView;

@end
