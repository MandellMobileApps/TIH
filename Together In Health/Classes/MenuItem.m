//
//  MenuItem.m
//  Together In Health
//
//  Created by Cami Mandell on 12/25/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem



- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.menuItemName = [decoder decodeObjectForKey:@"menuItemName"];
        self.menuItemImage = [decoder decodeObjectForKey:@"menuItemImage"];
        self.itemSection = [decoder decodeObjectForKey:@"itemSection"];
        self.itemSubscription = [decoder decodeIntegerForKey:@"itemSubscription"];
        self.menuItemId = [decoder decodeIntegerForKey:@"menuItemId"];
        self.recipeId = [decoder decodeIntegerForKey:@"recipeId"];
        self.mealType = [decoder decodeIntegerForKey:@"mealType"];


    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {

    [encoder encodeObject: self.menuItemName forKey:@"menuItemName"];
     [encoder encodeObject: self.menuItemImage forKey:@"menuItemImage"];
     [encoder encodeObject: self.itemSection forKey:@"itemSection"];
     [encoder encodeInteger: self.itemSubscription forKey:@"itemSubscription"];
    [encoder encodeInteger: self.menuItemId forKey:@"menuItemId"];
     [encoder encodeInteger: self.recipeId forKey:@"recipeId"];
     [encoder encodeInteger: self.mealType forKey:@"mealType"];

}


@end
