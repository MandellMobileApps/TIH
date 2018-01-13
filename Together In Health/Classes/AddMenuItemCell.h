//
//  AddMenuItemCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuItem;
@class CheckBoxView;
@class AddMenuItemViewController;

@interface AddMenuItemCell : UITableViewCell

@property (nonatomic, weak) AddMenuItemViewController *addMenuItemViewController;
@property (nonatomic, strong) MenuItem *menuItem;
@property (nonatomic, strong) IBOutlet UILabel *menuItemLabel;
@property (nonatomic, strong) IBOutlet UIButton *recipeButton;
@property (nonatomic, strong) IBOutlet UIImageView *recipeImageView;
-(void)refreshUI;
@end
