//
//  MenuPlan.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuPlan : NSObject <NSCoding>

@property (nonatomic, strong) NSString* breakfast;
@property (nonatomic, strong) NSString* lunch;
@property (nonatomic, strong) NSString* dinner;
@property (nonatomic, strong) NSString* snacks;

@end
