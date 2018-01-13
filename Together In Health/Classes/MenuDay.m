//
//  MenuMeal.m
//  Together In Health
//
//  Created by Jon Mandell on 12/22/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "MenuDay.h"

enum MenuDayMeal
{
    MenuDayMealBreakfast = 0,
    MenuDayMealLunch = 1,
    MenuDayMealDinner = 2,
    MenuDayMealSnacks = 3,
};

@implementation MenuDay

+ (MenuDay*)addNewMenuDay
{
        MenuDay* new = [[MenuDay alloc]init];
        new.breakfastMenuItems = [NSMutableArray array];
        new.lunchMenuItems = [NSMutableArray array];
        new.dinnerMenuItems = [NSMutableArray array];
        new.snackMenuItems = [NSMutableArray array];

        return new;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.breakfastMenuItems = [decoder decodeObjectForKey:@"breakfastMenuItems"];
        self.lunchMenuItems = [decoder decodeObjectForKey:@"lunchMenuItems"];
        self.dinnerMenuItems = [decoder decodeObjectForKey:@"dinnerMenuItems"];
        self.snackMenuItems = [decoder decodeObjectForKey:@"snackMenuItems"];

    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {
     [encoder encodeObject: self.breakfastMenuItems forKey:@"breakfastMenuItems"];
     [encoder encodeObject: self.lunchMenuItems forKey:@"lunchMenuItems"];
     [encoder encodeObject: self.dinnerMenuItems forKey:@"dinnerMenuItems"];
     [encoder encodeObject: self.snackMenuItems forKey:@"snackMenuItems"];

}




@end
