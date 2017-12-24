//
//  AddMenuItemCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuPlan;
@interface AddMenuItemCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *mealNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *mealTextLabel;
@property (nonatomic, strong) MenuPlan *menuPlan;
@property (nonatomic) NSInteger row;
-(void)refreshUI;
@end
