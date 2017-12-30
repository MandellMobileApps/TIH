//
//  MenuItem.h
//  Together In Health
//
//  Created by Cami Mandell on 12/25/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>

enum MealType {
    MealTypeBreakfast = 0,
    MealTypeLunch = 1,
    MealTypeDinner = 2,
    MealTypeSnack = 3,

};

@interface MenuItem : NSObject <NSCoding>


@property (nonatomic) NSInteger menuItemId;
@property (nonatomic) NSInteger recipeId;  // if one is associated with it.
@property (nonatomic, strong) NSString *menuItemName;
@property (nonatomic, strong) NSString *menuItemImage;
@property (nonatomic, strong) NSString *itemSection;
@property (nonatomic) NSInteger itemSubscription;
@property (nonatomic) BOOL currentlySelected;
@property (nonatomic) NSInteger mealType;

//+ (id)itemLabel:(NSString*)itemLabel itemImage:(NSString*)itemImage itemSection:(NSString*)itemSection subscriptionLevel:(NSInteger*)itemSubscription;

@end
