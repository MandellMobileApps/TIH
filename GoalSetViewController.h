//
//  GoalSetViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 10/3/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"
#import "Goal1ViewController.h"
#import "Goal2ViewController.h"
#import "Goal3ViewController.h"

@interface GoalSetViewController : AbstractViewController

@property (nonatomic, strong)Goal1ViewController* goal1ViewController;
@property (nonatomic, strong)Goal2ViewController* goal2ViewController;
@property (nonatomic, strong)Goal3ViewController* goal3ViewController;


@property (nonatomic, strong) IBOutlet UIButton* goal1Button;
@property (nonatomic, strong) IBOutlet UIButton* goal2Button;
@property (nonatomic, strong) IBOutlet UIButton* goal3Button;


@property (nonatomic) NSUInteger goalIndex;


// Food Sub Contollers
-(IBAction)goal1:(id)sender;
-(IBAction)goal2:(id)sender;
-(IBAction)goal3:(id)sender;

@end

