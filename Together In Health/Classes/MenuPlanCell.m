//
//  MenuPlanCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "MenuPlanCell.h"
#import "MenuDay.h"
#import "MenuItem.h"

@implementation MenuPlanCell

-(void)refreshCell {
    NSString* type;
    NSString* items;
  switch (self.row) {
  case 0:
    type = @"Breakfast";
    items = [self menuItemsStringForArray:self.selectedMenuDay.breakfastMenuItems];
    break;
  case 1:
    type = @"Lunch";
    items = [self menuItemsStringForArray:self.selectedMenuDay.lunchMenuItems];
    break;
  case 2:
    type = @"Dinner";
    items = [self menuItemsStringForArray:self.selectedMenuDay.dinnerMenuItems];
    break;
  case 3:
    type = @"Snacks";
    items = [self menuItemsStringForArray:self.selectedMenuDay.snackMenuItems];
    break;
  default:
    break;
    }
    self.menuTypeLabel.text = type;
    self.menuItemsLabel.text = items;
}



-(NSString*)menuItemsStringForArray:(NSMutableArray*)meals
{
    
    NSMutableString* string = [NSMutableString string];
    NSString* returnString = [NSString string];
    if (meals.count>0)
    {
        NSMutableArray* items = [meals objectAtIndex:0];
        if (items.count > 0)
        {
            for (MenuItem* item in items)
            {
                [string appendFormat:@" %@,",item.menuItemName];
            }
            returnString = [string substringToIndex:string.length-2];
        }
    }
    return returnString;
}


@end
