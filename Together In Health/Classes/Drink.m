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
        self.drinkArray = [decoder decodeObjectForKey:@"drinkArray"];
        self.isChosen = [decoder decodeBoolForKey:@"isChosen"];
        
        
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.drinkTextField forKey:@"drinkTextField"];
    [encoder encodeObject:self.drinkArray forKey:@"drinkArray"];
    [encoder encodeBool:self.isChosen forKey:@"isChosen"];

    
}

@end
