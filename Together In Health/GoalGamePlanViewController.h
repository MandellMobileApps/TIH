//
//  GoalGamePlanViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/13/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"




@interface GoalGamePlanViewController :AbstractViewController


@property (nonatomic, strong) Goal *goal;

@property(nonatomic,strong) IBOutlet UIScrollView* thisScrollView;
@property(nonatomic,strong) NSDictionary* object;
@property(nonatomic, strong) IBOutlet UITextView* holidaysTextView;
@property(nonatomic, strong) IBOutlet UITextView* vacationTextView;
@property(nonatomic, strong) IBOutlet UITextView* sickDaysTextView;
@property(nonatomic, strong) IBOutlet UITextField* other1TextView;
@property(nonatomic, strong) IBOutlet UITextField* other2TextView;
@property(nonatomic, strong) IBOutlet UITextView* other1InfoTextView;
@property(nonatomic, strong) IBOutlet UITextView* other2InfoTextView;
@end
