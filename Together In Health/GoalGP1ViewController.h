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
@property(nonatomic,strong) NSDictionary* object;
@property(nonnull, strong) IBOutlet UITextView* holidaysTextView;
@property(nonnull, strong) IBOutlet UITextView* vacationTextView;
@property(nonnull, strong) IBOutlet UITextView* sickDaysTextView;
@property(nonnull, strong) IBOutlet UITextField* other1TextView;
@property(nonnull, strong) IBOutlet UITextField* other2TextView;
@property(nonnull, strong) IBOutlet UITextView* other1InfoTextView;
@property(nonnull, strong) IBOutlet UITextView* other2InfoTextView;


@end
