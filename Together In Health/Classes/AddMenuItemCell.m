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

     self.menuItemLabel.text = [NSString stringWithFormat:@"%@",self.menuItem.menuItemName];

    if (self.menuItem.currentlySelected)
    {
        [self.menuItemCheckBox setChecked:YES];
    }
    else
    {
        [self.menuItemCheckBox setChecked:NO];
    }
}

-(void) checkBoxStatusChanged:(CheckBoxView *)thisCheckbox
{
    if (thisCheckbox.checked)
    {
        self.menuItem.currentlySelected = YES;
    }
    else
    {
       self.menuItem.currentlySelected = NO;
    }

}

@end
