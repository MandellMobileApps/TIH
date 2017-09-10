//
//  Sleep.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/7/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Sleep : NSObject <NSCoding>

@property (nonatomic) NSDate* beginSleep;
@property (nonatomic) NSDate* endSleep;
@property (nonatomic, strong) UITextField* hoursTextField;
@property (nonatomic) BOOL isRested;
@property (nonatomic) BOOL isRated;
@property NSString* indexString;

@end
