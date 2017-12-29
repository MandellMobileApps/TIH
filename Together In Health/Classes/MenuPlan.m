//
//  MenuPlan.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "MenuPlan.h"
#import "MenuDay.h"

@implementation MenuPlan

+(MenuPlan*)addNewMenuPlan
{
    MenuPlan* new = [[MenuPlan alloc]init];
    new.menuDays = [NSMutableArray array];
    for (int i = 0;i<7;i++)
    {
        [new.menuDays addObject:[MenuDay addNewMenuDay]];
    }
    return new;
}

//+ (MenuPlan*)createEmptyMenuPlan
//{
//    MenuPlan* newPlan = [[MenuPlan alloc]init];
//    newPlan.menuPlanDays = [MenuDay createEmptyMenu];
////    newPlan.day2Menu = [MenuDay createEmptyMenu];
////    newPlan.day3Menu = [MenuDay createEmptyMenu];
////    newPlan.day4Menu = [MenuDay createEmptyMenu];
////    newPlan.day5Menu = [MenuDay createEmptyMenu];
////    newPlan.day6Menu = [MenuDay createEmptyMenu];
////    newPlan.day7Menu = [MenuDay createEmptyMenu];
//
//    return newPlan;
//}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
       self.menuDays = [decoder decodeObjectForKey:@"menuDays"];
//       self.day2Menu = [decoder decodeObjectForKey:@"day2Menu"];
//       self.day3Menu = [decoder decodeObjectForKey:@"day3Menu"];
//       self.day4Menu = [decoder decodeObjectForKey:@"day4Menu"];
//       self.day5Menu = [decoder decodeObjectForKey:@"day5Menu"];
//       self.day6Menu = [decoder decodeObjectForKey:@"day6Menu"];
//       self.day7Menu = [decoder decodeObjectForKey:@"day7Menu"];

    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {

  [encoder encodeObject: self.menuDays forKey:@"menuDays"];
//  [encoder encodeObject: self.day2Menu forKey:@"day2Menu"];
//  [encoder encodeObject: self.day3Menu forKey:@"day3Menu"];
//  [encoder encodeObject: self.day4Menu forKey:@"day4Menu"];
//  [encoder encodeObject: self.day5Menu forKey:@"day5Menu"];
//  [encoder encodeObject: self.day6Menu forKey:@"day6Menu"];
//  [encoder encodeObject: self.day7Menu forKey:@"day7Menu"];

}

@end
