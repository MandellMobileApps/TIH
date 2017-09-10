//
//  Health.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/14/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Health : NSObject <NSCoding>

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, strong) NSString* healthValue;
@property (nonatomic) BOOL isDone;

@end
