//
//  MenuMealViewController.h
//  Together In Health
//
//  Created by Jon Mandell on 12/26/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "AbstractViewController.h"

@class MenuItem;
@class MenuDay;

@interface MenuDayViewController : AbstractViewController

@property (nonatomic, strong) MenuItem *selectedMenuItem;
@property (nonatomic, strong) MenuDay *selectedMenuDay;
@property (nonatomic, strong) NSString *selectedMenuDayName;

@end
