//
//  Food.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Food.h"

@implementation Food


-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {

        self.indexString = [decoder decodeObjectForKey:@"indexString"];
        self.plate = [decoder decodeObjectForKey:@"plate"];
        self.mood = [decoder decodeObjectForKey:@"mood"];
        
        self.mealType = [decoder decodeIntegerForKey:@"mealType"];
        self.foodArrayIndex = [decoder decodeIntegerForKey:@"foodArrayIndex"];
        self.isChosen = [decoder decodeBoolForKey:@"isChosen"];
        self.showFilledImage = [decoder decodeBoolForKey:@"showFilledImage"];

 
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    

    [encoder encodeObject:self.indexString forKey:@"indexString"];
    [encoder encodeObject:self.plate forKey:@"plate"];
    [encoder encodeObject:self.mood forKey:@"mood"];
    [encoder encodeBool:self.isChosen forKey:@"isChosen"];
    [encoder encodeBool:self.showFilledImage forKey:@"showFilledImage"];
    [encoder encodeInteger:self.mealType forKey:@"mealType"];
    [encoder encodeInteger:self.foodArrayIndex forKey:@"foodArrayIndex"];
    

}

+(NSString*)nameForMealType:(NSInteger)type
{
switch (type) {
  case mealTypeBreakfast:
    return @"Breakfast";
    break;
  case mealTypeLunch:
    return @"Lunch";
    break;
  case mealTypeDinner:
    return @"Dinner";
    break;
  case mealTypeSnack:
    return @"Snack";
    break;
  case mealTypeWater:
    return @"Water";
    break;

  default:
    break;

}
    
    return nil;
}

@end
