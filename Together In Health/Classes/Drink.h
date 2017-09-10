//
//  Drink.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/8/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Drink : NSObject <NSCoding>

@property (nonatomic, strong) UITextField* drinkTextField;
@property (nonatomic, strong) UITextField* sodaTextField;
@property (nonatomic, strong) NSMutableArray* drinkArray;
@property (nonatomic, strong) NSMutableArray* waterArray;
@property (nonatomic, strong) NSMutableArray* sugarArray;
@property (nonatomic, strong) NSMutableArray* caffeineArray;
@property (nonatomic, strong) NSMutableArray* alcoholArray;

@property (nonatomic) BOOL isChosen;
@property NSString* indexString;

@end
