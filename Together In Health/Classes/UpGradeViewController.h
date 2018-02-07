//
//  UpGradeViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 11/7/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface UpGradeViewController : AbstractViewController <UITextFieldDelegate>

@property(nonatomic, strong) IBOutlet UIButton* doneButton;
@property(nonatomic, strong) IBOutlet UIActivityIndicatorView* activityView;
@property (nonatomic, strong) IBOutlet UIScrollView *thisScrollView;

@property(nonatomic, strong) IBOutlet UIView* emailContainerView;
@property(nonatomic) BOOL emailShowing;
@property(nonatomic, strong) IBOutlet UISegmentedControl* thisSegmentControl;
@property(nonatomic) NSInteger selectedPaymentTerm;
@property(nonatomic, strong) IBOutlet UITextField* emailTextField;
@property(nonatomic, strong) IBOutlet UIButton* sub1Button;
@property(nonatomic, strong) IBOutlet UIButton* sub2Button;

@property(nonatomic, strong)  NSTimer* timeoutTimer;

-(void)subscriptionCompleteWithSuccess:(BOOL)success;

@end
