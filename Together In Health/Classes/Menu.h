//
//  MenuMeal.h
//  Together In Health
//
//  Created by Jon Mandell on 12/22/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Menu;

@interface Menu : NSObject <NSCoding>


// array of menuItems
@property (nonatomic, strong) NSMutableArray *breakfastMenuItems;
@property (nonatomic, strong) NSMutableArray *lunchMenuItems;
@property (nonatomic, strong) NSMutableArray *dinnerMenuItems;
@property (nonatomic, strong) NSMutableArray *snackMenuItems;

+ (Menu*)createEmptyMenu;

@end
