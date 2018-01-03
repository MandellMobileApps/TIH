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
#import "AddMenuItemViewController.h"

@implementation AddMenuItemCell
-(void)refreshUI
{
     self.menuItemLabel.text = [NSString stringWithFormat:@"%@",self.menuItem.menuItemName];


}




@end
