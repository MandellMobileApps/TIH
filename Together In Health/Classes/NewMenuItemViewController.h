//
//  AddMenuItemViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class MenuItem;
@class AddMenuItemViewController;
@class MenuDayViewController;

@interface NewMenuItemViewController : AbstractViewController

@property (nonatomic,weak) AddMenuItemViewController* addMenuItemViewController;
@property (nonatomic,weak) MenuDayViewController* menuDayViewController;

@property (nonatomic,strong) MenuItem* menuItem;
@property (nonatomic) BOOL newMenuItem;
@property (nonatomic,strong) IBOutlet UITextField* nameTextField;
@property (nonatomic,strong) IBOutlet UITextView* descriptionTextView;
@property (nonatomic,strong) IBOutlet UIImageView* photoImageView;
-(void)thisMenuItem:(MenuItem*)menuItem;
@end
