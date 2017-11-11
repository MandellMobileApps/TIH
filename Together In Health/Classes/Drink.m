//
//  Drink.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/8/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Drink.h"

@implementation Drink

-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.drinkTextField = [decoder decodeObjectForKey:@"drinkTextField"];
        self.drinkName = [decoder decodeObjectForKey:@"drinkName"];
        self.amount = [decoder decodeObjectForKey:@"amount"];
        self.unit = [decoder decodeObjectForKey:@"unit"];
        self.drinkType = [decoder decodeIntegerForKey:@"drinkType"];
        self.isChosen = [decoder decodeBoolForKey:@"isChosen"];
        
        
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.drinkName forKey:@"drinkName"];
    [encoder encodeObject:self.drinkTextField forKey:@"drinkTextField"];
     [encoder encodeObject:self.amount forKey:@"amount"];
     [encoder encodeObject:self.unit forKey:@"unit"];
    [encoder encodeInteger:self.drinkType forKey:@"drinkType"];
    [encoder encodeBool:self.isChosen forKey:@"isChosen"];

    
}

@end
