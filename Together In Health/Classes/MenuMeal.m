//
//  MenuMeal.m
//  Together In Health
//
//  Created by Jon Mandell on 12/22/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "MenuMeal.h"

@implementation MenuMeal


+(MenuMeal*)addNewMeal
{
    MenuMeal* new = [[MenuMeal alloc]init];
    new.menuItems = [NSMutableArray array];
    return new;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.menuItems = [decoder decodeObjectForKey:@"menuItems"];


    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {
     [encoder encodeObject: self.menuItems forKey:@"menuItems"];


}




@end
