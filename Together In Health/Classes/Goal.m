//
//  Goal.m
//  SimpleTable
//
//  Created by Cami Mandell on 4/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Goal.h"

@implementation Goal



- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
//        self.Step1 = [decoder decodeObjectForKey:@"textFieldStep1"];
//        self.textFieldStep2 = [decoder decodeObjectForKey:@"textFieldStep2"];
//        self.textFieldStep3 = [decoder decodeObjectForKey:@"textFieldStep3"];
//        self.textFieldStep4 = [decoder decodeObjectForKey:@"textFieldStep4"];
//        self.textFieldStep5 = [decoder decodeObjectForKey:@"textFieldStep5"];
        self.goalName = [decoder decodeObjectForKey:@"goalName"];
        self.by1 = [decoder decodeObjectForKey:@"by1"];
        self.by2 = [decoder decodeObjectForKey:@"by2"];
        self.when = [decoder decodeObjectForKey:@"when"];
        self.where = [decoder decodeObjectForKey:@"where"];
        self.often = [decoder decodeObjectForKey:@"often"];
        self.when2 = [decoder decodeObjectForKey:@"when2"];
        self.where2 = [decoder decodeObjectForKey:@"where2"];
        self.often2 = [decoder decodeObjectForKey:@"often2"];
//        self.textFieldOften2 = [decoder decodeObjectForKey:@"textFieldOften2"];

        
        self.G1Step1IsOn = [decoder decodeBoolForKey:@"G1Step1IsOn;"];
        self.G1Step2IsOn = [decoder decodeBoolForKey:@"G1Step2IsOn;"];
        self.G1Step3IsOn = [decoder decodeBoolForKey:@"G1Step3IsOn;"];
        self.G1Step4IsOn = [decoder decodeBoolForKey:@"G1Step4IsOn;"];
        self.G1Step5IsOn = [decoder decodeBoolForKey:@"G1Step5IsOn;"];
        
        
        self.vacation = [decoder decodeObjectForKey:@"vacation"];
        self.holidays = [decoder decodeObjectForKey:@"holidays"];
        self.sick = [decoder decodeObjectForKey:@"sick"];
        self.other1 = [decoder decodeObjectForKey:@"other1"];
        self.other2 = [decoder decodeObjectForKey:@"other2"];
        self.other1Text = [decoder decodeObjectForKey:@"other1Text"];
        self.other2Text = [decoder decodeObjectForKey:@"other2Text"];
    
    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {
    
    
//    [encoder encodeObject:self.textFieldStep1 forKey:@"textFieldStep1"];
//    [encoder encodeObject:self.textFieldStep2 forKey:@"textFieldStep2"];
//    [encoder encodeObject:self.textFieldStep3 forKey:@"textFieldStep3"];
//    [encoder encodeObject:self.textFieldStep4 forKey:@"textFieldStep4"];
//    [encoder encodeObject:self.textFieldStep5 forKey:@"textFieldStep5"];
    
     [encoder encodeObject:self.goalName forKey:@"goalName"];
     [encoder encodeObject:self.by1 forKey:@"by1"];
     [encoder encodeObject:self.by2 forKey:@"by2"];
     [encoder encodeObject:self.when forKey:@"when"];
     [encoder encodeObject:self.where forKey:@"where"];
    [encoder encodeObject:self.often forKey:@"often"];
     [encoder encodeObject:self.when2 forKey:@"when2"];
     [encoder encodeObject:self.where2 forKey:@"where2"];
     [encoder encodeObject:self.often2 forKey:@"often2"];
    
    [encoder encodeBool:self.G1Step1IsOn forKey:@"G1Step1IsOn"];
    [encoder encodeBool:self.G1Step2IsOn forKey:@"G1Step2IsOn"];
    [encoder encodeBool:self.G1Step3IsOn forKey:@"G1Step3IsOn"];
    [encoder encodeBool:self.G1Step4IsOn forKey:@"G1Step4IsOn"];
    [encoder encodeBool:self.G1Step5IsOn forKey:@"G1Step5IsOn"];
    
    [encoder encodeObject:self.vacation forKey:@"vacation"];
    [encoder encodeObject:self.holidays forKey:@"holidays"];
    [encoder encodeObject:self.sick forKey:@"sick"];
    [encoder encodeObject:self.other1 forKey:@"other1"];
    [encoder encodeObject:self.other2 forKey:@"other2"];
    [encoder encodeObject:self.other1Text forKey:@"other1Text"];
    [encoder encodeObject:self.other2Text forKey:@"other2Text"];
    
}

@end
