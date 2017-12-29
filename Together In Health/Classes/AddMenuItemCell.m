//
//  AddMenuItemCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "AddMenuItemCell.h"
#import "MenuItem.h"
#import "CheckBoxView.h"

@implementation AddMenuItemCell
-(void)refreshUI
{

  //   self.mealNameLabel.text = @"Snacks";
     self.itemNameLabel.text = [NSString stringWithFormat:@"          %@",self.menuItem.menuItemName];

}
-(void) checkBoxStatusChanged:(CheckBoxView *)thisCheckbox
{
    self.menuItem.currentlySelected = thisCheckbox.checked;
}
@end
