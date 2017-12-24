//
//  MenuPlanCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "MenuPlanCell.h"
#import "Menu.h"
#import "MenuItem.h"

@implementation MenuPlanCell

-(void)refreshCell {

    self.menuItemsLabel.text = [self menuItemsStringFrom:self.menuItems];
    
    
    
}



-(NSString*)menuItemsStringFrom:(NSMutableArray*)items
{
    NSMutableString* string = [NSMutableString string];
    NSString* returnString = [NSString string];
    if (items.count > 0)
    {
        for (MenuItem* item in items)
        {
            [string appendFormat:@" %@,",item.menuItemName];
        }
        returnString = [string substringToIndex:string.length-2];
    }
    return returnString;
}


@end
