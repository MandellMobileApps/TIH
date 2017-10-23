//
//  GoalSetViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/3/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"


enum goalIndex {
    Goal1Index = 0,
    Goal2Index = 1,
    Goal3Index = 2,
    
    
};

@interface GoalSetViewController : AbstractViewController

@property (nonatomic) NSInteger goalIndex;

- (IBAction)gamePlan:(id)sender;
- (IBAction)buttonTapped1:(id)sender;
- (IBAction)buttonTapped2:(id)sender;
- (IBAction)buttonTapped3:(id)sender;
- (IBAction)buttonTapped4:(id)sender;
- (IBAction)buttonTapped5:(id)sender;

@property (nonatomic, strong) Goal *goal;

@property (nonatomic, strong) IBOutlet UITextField *goalTextField;
@property (nonatomic, strong) IBOutlet UITextField *daysTextField;
@property (nonatomic, strong) IBOutlet UITextField *timesTextField;
@property (nonatomic, strong) IBOutlet UITextField *whereTextField;
@property (nonatomic, strong) IBOutlet UITextField *amountTextField;
@property (nonatomic, strong) IBOutlet UITextField *step1TextField;
@property (nonatomic, strong) IBOutlet UITextField *step2TextField;
@property (nonatomic, strong) IBOutlet UITextField *step3TextField;
@property (nonatomic, strong) IBOutlet UITextField *step4TextField;
@property (nonatomic, strong) IBOutlet UITextField *step5TextField;

@end

