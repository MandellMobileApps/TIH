//
//  MenuMeal.m
//  Together In Health
//
//  Created by Jon Mandell on 12/22/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "Menu.h"

@implementation Menu

+ (Menu*)createEmptyMenu
{
        Menu* emptyMenu = [[Menu alloc]init];
        emptyMenu.breakfastMenuItems = [NSMutableArray array];
        emptyMenu.lunchMenuItems = [NSMutableArray array];
        emptyMenu.dinnerMenuItems = [NSMutableArray array];
        emptyMenu.snackMenuItems = [NSMutableArray array];
        return emptyMenu;
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
