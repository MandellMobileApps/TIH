//
//  Goal2ViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class GoalSetViewController;

@interface Goal2ViewController : AbstractViewController

@property (nonatomic, weak) GoalSetViewController *goalSetViewController;
@property (nonatomic, strong) IBOutlet UIScrollView *thisScrollView;

@end
