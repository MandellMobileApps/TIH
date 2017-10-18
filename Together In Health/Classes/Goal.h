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

@property (nonatomic, strong)  NSString *g1step1;
@property (nonatomic, strong)  NSString *g1step2;
@property (nonatomic, strong)  NSString *g1step3;
@property (nonatomic, strong)  NSString *g1step4;
@property (nonatomic, strong)  NSString *g1step5;

@property (nonatomic, strong)  NSString *g2step1;
@property (nonatomic, strong)  NSString *g2step2;
@property (nonatomic, strong)  NSString *g2step3;
@property (nonatomic, strong)  NSString *g2step4;
@property (nonatomic, strong)  NSString *g2step5;

@property (nonatomic, strong)  NSString *g3step1;
@property (nonatomic, strong)  NSString *g3step2;
@property (nonatomic, strong)  NSString *g3step3;
@property (nonatomic, strong)  NSString *g3step4;
@property (nonatomic, strong)  NSString *g3step5;

@property (nonatomic) BOOL G1Step1IsOn;
@property (nonatomic) BOOL G1Step2IsOn;
@property (nonatomic) BOOL G1Step3IsOn;
@property (nonatomic) BOOL G1Step4IsOn;
@property (nonatomic) BOOL G1Step5IsOn;

@property (nonatomic) BOOL G2Step1IsOn;
@property (nonatomic) BOOL G2Step2IsOn;
@property (nonatomic) BOOL G2Step3IsOn;
@property (nonatomic) BOOL G2Step4IsOn;
@property (nonatomic) BOOL G2Step5IsOn;

@property (nonatomic) BOOL G3Step1IsOn;
@property (nonatomic) BOOL G3Step2IsOn;
@property (nonatomic) BOOL G3Step3IsOn;
@property (nonatomic) BOOL G3Step4IsOn;
@property (nonatomic) BOOL G3Step5IsOn;





@property NSString* indexString;

@property (nonatomic, strong)  NSString* vacation;
@property (nonatomic, strong)  NSString* holidays;
@property (nonatomic, strong)  NSString* sick;
@property (nonatomic, strong)  NSString* other1;
@property (nonatomic, strong)  NSString* other2;
@property (nonatomic, strong)  NSString* other1Text;
@property (nonatomic, strong)  NSString* other2Text;

@end
