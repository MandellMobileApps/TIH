//
//  Sleep.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/7/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Sleep.h"

@implementation Sleep

-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.beginSleep = [decoder decodeObjectForKey:@"beginSleep"];
        self.endSleep = [decoder decodeObjectForKey:@"endSleep"];
        self.isRated = [decoder decodeBoolForKey:@"isRated"];
        self.isRested = [decoder decodeBoolForKey:@"isRested"];

        
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: self.beginSleep forKey:@"beginSleep"];
    [encoder encodeObject:self.endSleep forKey:@"endSleep"];
    [encoder encodeBool:self.isRated forKey:@"isRated"];
    [encoder encodeBool:self.isRested forKey:@"isRested"];
    
}

@end
