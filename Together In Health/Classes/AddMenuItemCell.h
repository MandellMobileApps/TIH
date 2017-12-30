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

@interface AddMenuItemCell : UITableViewCell

@property (nonatomic, strong) MenuItem *menuItem;
@property (nonatomic, strong) CheckBoxView *menuItemCheckBox;
@property (nonatomic, strong) UILabel *menuItemLabel;
-(void)refreshUI;
@end
