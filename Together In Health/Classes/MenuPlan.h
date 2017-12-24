//
//  MenuPlan.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MenuPlan;
@class Menu;

@interface MenuPlan : NSObject <NSCoding>

// array of menu objects
//@property (nonatomic, strong) NSMutableArray* menus;
@property (nonatomic, strong) Menu *day1Menu;
@property (nonatomic, strong) Menu *day2Menu;
@property (nonatomic, strong) Menu *day3Menu;
@property (nonatomic, strong) Menu *day4Menu;
@property (nonatomic, strong) Menu *day5Menu;
@property (nonatomic, strong) Menu *day6Menu;
@property (nonatomic, strong) Menu *day7Menu;

+ (MenuPlan*)createEmptyMenuPlan;
//-(NSMutableArray*)createEmptyMenusForMealPlan;
@end
