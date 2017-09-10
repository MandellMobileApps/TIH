//
//  OpeningViewController.h
//  SimpleTable
//
//  Created by Cami Mandell on 12/28/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class ViewControllerGoal;
@class ProgressViewController;
@class GoalsMenuViewController;



@interface GoalMoreViewController : UIViewController

@property (nonatomic,weak) ProgressViewController* progressViewController;
@property (nonatomic, weak) ViewControllerGoal* viewControllerGoal;
@property (nonatomic, weak) GoalsMenuViewController* goalsMenuViewController;

@property (strong, nonatomic) AppDelegate *appDelegate;

@property(nonatomic,strong) NSArray* listArray;
@property(nonatomic,strong) NSArray* listArray2;
@property(nonatomic,strong) NSArray* listArray3;
@property (nonatomic,strong) NSArray* listArray4;
@property(nonatomic,strong) NSArray* listArrayImage;

@property (nonatomic, strong) NSString* by1text;
@property (nonatomic, strong) NSString* by2text;

@property (nonatomic, strong) IBOutlet UIView *baseContentView;



@end
