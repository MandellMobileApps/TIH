//
//  MenuPlan.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "MenuPlan.h"
#import "Menu.h"

@implementation MenuPlan

+ (MenuPlan*)createEmptyMenuPlan
{
    MenuPlan* newPlan = [[MenuPlan alloc]init];
    newPlan.day1Menu = [Menu createEmptyMenu];
    newPlan.day2Menu = [Menu createEmptyMenu];
    newPlan.day3Menu = [Menu createEmptyMenu];
    newPlan.day4Menu = [Menu createEmptyMenu];
    newPlan.day5Menu = [Menu createEmptyMenu];
    newPlan.day6Menu = [Menu createEmptyMenu];
    newPlan.day7Menu = [Menu createEmptyMenu];
    
    return newPlan;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
       self.day1Menu = [decoder decodeObjectForKey:@"day1Menu"];
       self.day2Menu = [decoder decodeObjectForKey:@"day2Menu"];
       self.day3Menu = [decoder decodeObjectForKey:@"day3Menu"];
       self.day4Menu = [decoder decodeObjectForKey:@"day4Menu"];
       self.day5Menu = [decoder decodeObjectForKey:@"day5Menu"];
       self.day6Menu = [decoder decodeObjectForKey:@"day6Menu"];
       self.day7Menu = [decoder decodeObjectForKey:@"day7Menu"];

    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {

  [encoder encodeObject: self.day1Menu forKey:@"day1Menu"];
  [encoder encodeObject: self.day2Menu forKey:@"day2Menu"];
  [encoder encodeObject: self.day3Menu forKey:@"day3Menu"];
  [encoder encodeObject: self.day4Menu forKey:@"day4Menu"];
  [encoder encodeObject: self.day5Menu forKey:@"day5Menu"];
  [encoder encodeObject: self.day6Menu forKey:@"day6Menu"];
  [encoder encodeObject: self.day7Menu forKey:@"day7Menu"];

}

//-(void)seperateArrayIntoDays
//{
//    self.sundayArray = [self arrayOfDay:1];
//    self.mondayArray = [self arrayOfDay:2];
//    self.tuesdayArray = [self arrayOfDay:3];
//    self.wednesdayArray = [self arrayOfDay:4];
//    self.thursdayArray = [self arrayOfDay:5];
//    self.fridayArray = [self arrayOfDay:6];
//    self.saturdayArray = [self arrayOfDay:7];
//
//}

//-(NSMutableArray*)arrayOfDay:(NSInteger)day
//{
//   NSMutableArray* thisArray;
//   NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@",@"menuDay",day];
//    thisArray =  [NSMutableArray arrayWithArray:[self.menus filteredArrayUsingPredicate:predicate]];
//    NSSortDescriptor* sortCustom = [NSSortDescriptor sortDescriptorWithKey:@"sortOrder" ascending:YES];
//    [thisArray sortUsingDescriptors:[NSArray arrayWithObject:sortCustom]];
//    return thisArray;
//}

//-(NSMutableArray*)createEmptyMenusForMealPlan
//{
//    NSMutableArray* thisArray = [NSMutableArray arrayWithCapacity:28];
//    for (NSInteger d = 1;d<8;d++)
//    {
//         for (NSInteger t = 0;t<4;d++)
//        {
//            Menu* newMenu = [[Menu alloc]init];
//            newMenu.menuItems = [NSMutableArray array];
//            newMenu.menuType = t;
//            newMenu.menuDay = d;
//            [thisArray addObject:newMenu];
//
//        }
//
//    }
//
//    return thisArray;
//}
@end
