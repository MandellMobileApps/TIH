//
//  ViewControllerGamePlan.h
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"
#import "Goal.h"

@interface ViewControllerGamePlan : AbstractViewController

@property (nonatomic, strong) Goal* goal;
@property (nonatomic, strong) NSMutableArray* goals;

@property(nonatomic,strong) IBOutlet UIScrollView* thisScrollView;
@property (nonatomic, strong) IBOutlet UITextView* textViewVacation;
@property (nonatomic, strong) IBOutlet UITextView* textViewHolidays;
@property (nonatomic, strong) IBOutlet UITextView* textViewSick;
@property (nonatomic, strong) IBOutlet UITextView* textViewOther1;
@property (nonatomic, strong) IBOutlet UITextView* textViewOther2;
@property (nonatomic, strong) IBOutlet UITextField* textFieldOther1Text;
@property (nonatomic, strong) IBOutlet UITextField* textFieldOther2Text;


@property (nonatomic, strong) IBOutlet UIButton *resignKeyboardButton;
-(IBAction)resignKeyboard:(id)sender;

@property (nonatomic, strong) IBOutlet UIView *baseContentView;

- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;

@end
