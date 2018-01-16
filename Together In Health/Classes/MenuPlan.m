//
//  MenuPlan.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "MenuPlan.h"
#import "MenuDay.h"

@implementation MenuPlan

+(MenuPlan*)addNewMenuPlan
{
    MenuPlan* new = [[MenuPlan alloc]init];
    new.menuDays = [NSMutableArray array];
    for (int i = 0;i<7;i++)
    {
        [new.menuDays addObject:[MenuDay addNewMenuDay]];
    }
    return new;
}



- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
       self.menuDays = [decoder decodeObjectForKey:@"menuDays"];

    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {

  [encoder encodeObject: self.menuDays forKey:@"menuDays"];

}

@end
