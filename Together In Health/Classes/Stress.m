//
//  Stress.m
//  TIHMaster
//
//  Created by Cami Mandell on 7/2/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Stress.h"

@implementation Stress

-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        self.isStress = [decoder decodeBoolForKey:@"isStress"];
        self.isEnergy = [decoder decodeBoolForKey:@"isEnergy"];
        self.isMood = [decoder decodeBoolForKey:@"isMood"];
        self.isConcentration = [decoder decodeBoolForKey:@"isConcentration"];
        self.isCoping = [decoder decodeBoolForKey:@"isCoping"];
        
        
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeBool:self.isStress forKey:@"isStress"];
    [encoder encodeBool:self.isEnergy forKey:@"isEnergy"];
    [encoder encodeBool:self.isMood forKey:@"isMood"];
    [encoder encodeBool:self.isConcentration forKey:@"isConcentration"];
    [encoder encodeBool:self.isCoping forKey:@"isCoping"];


}

@end
