//
//  SubscriptionViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 1/29/18.
//  Copyright © 2018 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface SubscriptionViewController : AbstractViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *thisScrollView;
@property(nonatomic, strong) IBOutlet UIView* emailContainerView;
@property(nonatomic) BOOL emailShowing;

@property(nonatomic, strong) IBOutlet UISegmentedControl* levelSegmentControl;
@property(nonatomic, strong) IBOutlet UISegmentedControl* termSegmentControl;
@property(nonatomic) NSInteger selectedSubscriptionLevel;
@property(nonatomic) NSInteger selectedPaymentTerm;

@property(nonatomic, strong) IBOutlet UIActivityIndicatorView* activityView;

@property(nonatomic, strong) IBOutlet UITextField* emailTextField;
@property(nonatomic, strong) IBOutlet UIButton* sub1Button;
@property(nonatomic, strong) IBOutlet UIButton* changeButton;
@property(nonatomic, strong) IBOutlet UIButton* doneButton;



@property(nonatomic, strong) IBOutlet UILabel* subLevelLabel;


@property(nonatomic, strong)  NSTimer* timeoutTimer;

-(void)subscriptionCompleteWithSuccess:(BOOL)success;


@end
