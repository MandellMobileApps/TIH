//
//  ChooseDrinkCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Drink;
@class ChooseDrinkViewController;
@class Day;

@interface ChooseDrinkCell : UITableViewCell

@property (nonatomic, strong) Drink *drink;
@property (nonatomic, strong) ChooseDrinkViewController *chooseDrinkViewController;
@property (nonatomic, strong) Day *day;

@property (nonatomic, strong) IBOutlet UILabel *drinkLabel;
@property (nonatomic, strong) IBOutlet UIImageView *checkImage;
@property (nonatomic, strong) IBOutlet UIButton *addDrinkButton;
@property (nonatomic) BOOL addDrinkButtonOn;
@property (nonatomic, strong) IBOutlet UITextField *amtTextField;

-(IBAction)addDrink:(id)sender;

@end
