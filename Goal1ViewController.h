//
//  Goal1ViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoalSetViewController.h"

@class GoalSetViewController;

@interface Goal1ViewController : AbstractViewController

@property (nonatomic, weak) GoalSetViewController *goalSetViewController;
@property (nonnull, strong) IBOutlet UIScrollView *thisScrollView;

- (IBAction)gamePlan:(id)sender;
- (IBAction)buttonTapped1:(id)sender;
- (IBAction)buttonTapped2:(id)sender;
- (IBAction)buttonTapped3:(id)sender;
- (IBAction)buttonTapped4:(id)sender;
- (IBAction)buttonTapped5:(id)sender;


@property (nonatomic, strong) IBOutlet UIButton *step1;
@property (nonatomic, strong) IBOutlet UIButton *step2;
@property (nonatomic, strong) IBOutlet UIButton *step3;
@property (nonatomic, strong) IBOutlet UIButton *step4;
@property (nonatomic, strong) IBOutlet UIButton *step5;

@property (nonatomic, strong) Goal *goal;

@property (nonnull, strong) IBOutlet UITextField *goalTextField;
@property (nonnull, strong) IBOutlet UITextField *daysTextField;
@property (nonnull, strong) IBOutlet UITextField *timesTextField;
@property (nonnull, strong) IBOutlet UITextField *whereTextField;
@property (nonnull, strong) IBOutlet UITextField *amountTextField;
@property (nonnull, strong) IBOutlet UITextField *step1TextField;
@property (nonnull, strong) IBOutlet UITextField *step2TextField;
@property (nonnull, strong) IBOutlet UITextField *step3TextField;
@property (nonnull, strong) IBOutlet UITextField *step4TextField;
@property (nonnull, strong) IBOutlet UITextField *step5TextField;


@end
