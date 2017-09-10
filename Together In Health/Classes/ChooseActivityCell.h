//
//  ChooseActivityCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Activity;
@class ActivityTrackerViewController;
@class ChooseActivityViewController;

@interface ChooseActivityCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* activityLabel;
@property (nonatomic, strong) IBOutlet UIButton* favoritesButton;

@property (nonatomic) BOOL myFavoritesButtonOn;
@property (nonatomic) BOOL myChooseButtonOn;

@property (nonatomic, strong) Activity* activity;
@property (nonatomic, strong) ActivityTrackerViewController* activityTrackerViewController;
@property (nonatomic, strong) ChooseActivityViewController* chooseActivityViewController;
@property (nonatomic) NSInteger row;
-(void)refreshActivtyCell;

@end
