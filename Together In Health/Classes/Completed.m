//
//  Completed.m
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "Completed.h"

@implementation Completed

-(id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.isDone = [decoder decodeBoolForKey:@"isDone"];
    }
    
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeBool:self.isDone forKey:@"isDone"];
}


@end
