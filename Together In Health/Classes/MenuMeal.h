//
//  MenuMeal.h
//  Together In Health
//
//  Created by Jon Mandell on 12/22/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MenuMeal;

@interface MenuMeal : NSObject <NSCoding>

// array of menuItems
@property (nonatomic, strong) NSMutableArray *menuItems;

+(MenuMeal*)addNewMeal;

@end
