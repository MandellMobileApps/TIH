//
//  MenuPlan.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MenuPlan;


@interface MenuPlan : NSObject <NSCoding>

// array of menu objects
@property (nonatomic, strong) NSMutableArray * menuDays;
//@property (nonatomic, strong) MenuDay *day1Menu;
//@property (nonatomic, strong) MenuDay *day2Menu;
//@property (nonatomic, strong) MenuDay *day3Menu;
//@property (nonatomic, strong) MenuDay *day4Menu;
//@property (nonatomic, strong) MenuDay *day5Menu;
//@property (nonatomic, strong) MenuDay *day6Menu;
//@property (nonatomic, strong) MenuDay *day7Menu;

+ (MenuPlan*)addNewMenuPlan;

@end
