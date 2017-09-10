//
//  FoodTrackerCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Food;
@class FoodTrackerViewController;

@interface FoodTrackerCell : UITableViewCell

@property (nonatomic, strong) FoodTrackerViewController *foodTrackerViewController;

@property (nonatomic, strong) IBOutlet UIImageView* plateImage;
@property (nonatomic, strong) IBOutlet UILabel *locationLabel;
@property (nonatomic, strong) IBOutlet UILabel *proteinLabel;
@property (nonatomic, strong) IBOutlet UILabel *vegetableLabel;
@property (nonatomic, strong) IBOutlet UILabel *carbsLabel;

@property (nonatomic, strong) IBOutlet UIImageView* moodImage;

@property (nonatomic, strong) IBOutlet UILabel *waterLabel;
@property (nonatomic, strong) IBOutlet UILabel *cupsLabel;


-(void)refreshFoodCell;

@property (nonatomic, strong) Food* food;
@property (nonatomic, strong) NSString* waterCups;

@property (nonatomic) NSInteger row;

@end
