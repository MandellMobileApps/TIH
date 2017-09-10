//
//  Health.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/14/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Health.h"
#import "TIHDate.h"

@implementation Health

-(id) initWithDate:(NSDate*)thisDate
{
    Health* thisHealthDay = [[Health alloc]init];
    thisHealthDay.date = [TIHDate dateAtMidnightFromDate:thisDate];
    
    return thisHealthDay;
}

-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
         self.date = [decoder decodeObjectForKey:@"date"];
        self.healthValue = [decoder decodeObjectForKey:@"healthValue"];
        self.isDone = [decoder decodeBoolForKey:@"isDone"];
        
        
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: self.date forKey:@"date"];
    [encoder encodeObject:self.healthValue forKey:@"healthValue"];
    [encoder encodeBool:self.isDone forKey:@"isDone"];
    
    
}

@end
