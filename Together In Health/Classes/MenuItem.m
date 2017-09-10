//
//  MenuItem.m
//  Together In Health
//
//  Created by Cami Mandell on 12/25/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

+ (id)itemLabel:(NSString*)itemLabel itemImage:(NSString*)itemImage itemSection:(NSString*)itemSection itemSubscription:(NSString*)itemSubscription
{
    MenuItem *menuItemDisplay = [[self alloc] init];
    menuItemDisplay.itemLabel = itemLabel;
    menuItemDisplay.itemImage = itemImage;
    menuItemDisplay.itemSection = itemSection;
    menuItemDisplay.itemSubscription = itemSubscription;

    return menuItemDisplay;
}

@end
