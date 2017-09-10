//
//  ActivityTrackerCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Activity;
@class ActivityTrackerViewController;
@class ChooseActivityViewController;

@interface ActivityTrackerCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* activityLabel;
@property (nonatomic, strong) IBOutlet UILabel* timeLabel;
@property (nonatomic, strong) IBOutlet UILabel* distanceLabel;

@property (nonatomic, strong) IBOutlet UITextField* stepField;
@property (nonatomic, strong) Activity* activity;
@property (nonatomic, strong) ActivityTrackerViewController* activityTrackerViewController;
@property (nonatomic, strong) ChooseActivityViewController* chooseActivityViewController;
-(void)refreshActivityCell;
@property (nonatomic) NSInteger row;


@end
