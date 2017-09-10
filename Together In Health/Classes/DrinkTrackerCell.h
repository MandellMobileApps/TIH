//
//  DrinkTrackerCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Drink;

@interface DrinkTrackerCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UITextField* thisTextField;
@property (nonatomic, strong) IBOutlet UILabel* drinkLabel;
@property (nonatomic, strong) IBOutlet UIButton* addDrinkButton;
@property (nonatomic) BOOL drinkButtonOn;

@property (nonatomic, strong) Drink* drink;
-(IBAction)addDrink:(id)sender;

@end
