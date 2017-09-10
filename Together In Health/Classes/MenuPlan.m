//
//  MenuPlan.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "MenuPlan.h"

@implementation MenuPlan

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
         self.breakfast = [decoder decodeObjectForKey:@"breakfast"];
        self.lunch = [decoder decodeObjectForKey:@"lunch"];
        self.dinner = [decoder decodeObjectForKey:@"dinner"];
        self.snacks = [decoder decodeObjectForKey:@"snacks"];
    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {

    [encoder encodeObject: self.breakfast forKey:@"breakfast"];
     [encoder encodeObject: self.lunch forKey:@"lunch"];
     [encoder encodeObject: self.dinner forKey:@"dinner"];
     [encoder encodeObject: self.snacks forKey:@"snacks"];
}

@end
