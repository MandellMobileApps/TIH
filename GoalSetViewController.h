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

@interface GoalSetViewController : AbstractViewController <UITextFieldDelegate>

@property (nonatomic) NSInteger goalIndex;


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
@property (nonatomic, strong) IBOutlet UIButton *clearAllButton;

@property (nonatomic, strong) Goal *goal;
@property (nonatomic, strong) IBOutlet UIScrollView *thisScrollView;
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
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIView *colorView;
@property (nonatomic, strong) IBOutlet UILabel *colorLabel;
@property (nonatomic, strong) IBOutlet UIView *colorSelectionView;
- (IBAction)colorButtonTapped:(id)sender;
@end

