//
//  AddMenuItemViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface AddMenuItemViewController : AbstractViewController

@property (nonatomic, strong) NSMutableArray *breakfastArray;
@property (nonatomic, strong) NSMutableArray *lunchArray;
@property (nonatomic, strong) NSMutableArray *dinnerArray;
@property (nonatomic, strong) NSMutableArray *snacksArray;

@end
