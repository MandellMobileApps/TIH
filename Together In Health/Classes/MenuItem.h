//
//  MenuItem.h
//  Together In Health
//
//  Created by Cami Mandell on 12/25/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MenuItem;

@interface MenuItem : NSObject <NSCoding>

@property (nonatomic) NSInteger menuItemId;
@property (nonatomic) NSInteger recipeId;  // if one is associated with it.
@property (nonatomic, strong) NSString *menuItemName;
@property (nonatomic, strong) NSString *menuItemDescription;
@property (nonatomic, strong) NSString *menuItemImage;

@property (nonatomic, strong) NSString *itemSection;
@property (nonatomic) NSInteger itemSubscription;


+(MenuItem*)newMenuItemWithName:(NSString*)name;

@end
