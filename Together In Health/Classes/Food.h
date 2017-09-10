//
//  Food.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Plate.h"
#import "Mood.h"

enum mealType {
    mealTypeBreakfast = 0,
    mealTypeLunch = 1,
    mealTypeDinner = 2,
    mealTypeSnack = 3,
    mealTypeWater = 4,
};

@interface Food : NSObject <NSCoding>  //,NSCopying


@property (nonatomic) BOOL isChosen;
@property (nonatomic) BOOL showFilledImage;
@property  (nonatomic, strong) NSString* indexString;
@property (nonatomic) NSInteger mealType;
@property (nonatomic) NSInteger foodArrayIndex;
@property (nonatomic) NSInteger moodArrayIndex;
@property  (nonatomic, strong) Plate* plate;
@property  (nonatomic, strong) Mood* mood;






@end
