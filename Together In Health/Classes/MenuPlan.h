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


+ (MenuPlan*)addNewMenuPlan;

@end
