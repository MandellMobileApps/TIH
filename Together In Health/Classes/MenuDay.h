//
//  MenuMeal.h
//  Together In Health
//
//  Created by Jon Mandell on 12/22/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MenuDay;

@interface MenuDay : NSObject <NSCoding>


// array of menuMeals
@property (nonatomic, strong) NSMutableArray *breakfastMenuItems;
@property (nonatomic, strong) NSMutableArray *lunchMenuItems;
@property (nonatomic, strong) NSMutableArray *dinnerMenuItems;
@property (nonatomic, strong) NSMutableArray *snackMenuItems;

+ (MenuDay*)addNewMenuDay;

@end
