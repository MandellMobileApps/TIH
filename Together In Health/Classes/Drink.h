//
//  Drink.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/8/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum DrinkType {
    DrinkTypeWater = 0,
    DrinkTypeSugar = 1,
    DrinkTypeCaffeine = 2,
    DrinkTypeAlcohol = 3,
    
    
};

@interface Drink : NSObject <NSCoding>
@property (nonatomic, strong) UITextField* drinkTextField;
@property (nonatomic, strong) NSString* drinkName;
@property (nonatomic, strong) NSString* amount;
@property (nonatomic, strong) NSString* unit;
@property (nonatomic) BOOL isChosen;
@property NSString* indexString;
@property NSInteger drinkType;
@end
