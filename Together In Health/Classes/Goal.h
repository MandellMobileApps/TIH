//
//  Goal.h
//  SimpleTable
//
//  Created by Cami Mandell on 4/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject <NSCoding>

@property (weak, nonatomic)  NSString *goalName;
@property (weak, nonatomic)  NSString *by1;
@property (weak, nonatomic)  NSString *by2;

@property (nonatomic, strong)  NSString *when;
@property (nonatomic, strong)  NSString *where;
@property (nonatomic, strong)  NSString *often;
@property (nonatomic, strong)  NSString *when2;
@property (nonatomic, strong)  NSString *where2;
@property (nonatomic, strong)  NSString *often2;

@property (nonatomic, strong)  NSString *step1;
@property (nonatomic, strong)  NSString *step2;
@property (nonatomic, strong)  NSString *step3;
@property (nonatomic, strong)  NSString *step4;
@property (nonatomic, strong)  NSString *step5;

@property (nonatomic) BOOL Step1IsOn;
@property (nonatomic) BOOL Step2IsOn;
@property (nonatomic) BOOL Step3IsOn;
@property (nonatomic) BOOL Step4IsOn;
@property (nonatomic) BOOL Step5IsOn;
@property NSString* indexString;

@property (nonatomic, strong)  NSString* vacation;
@property (nonatomic, strong)  NSString* holidays;
@property (nonatomic, strong)  NSString* sick;
@property (nonatomic, strong)  NSString* other1;
@property (nonatomic, strong)  NSString* other2;
@property (nonatomic, strong)  NSString* other1Text;
@property (nonatomic, strong)  NSString* other2Text;

@end
