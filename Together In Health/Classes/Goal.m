//
//  Goal.m
//  SimpleTable
//
//  Created by Cami Mandell on 4/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Goal.h"

@implementation Goal


+(Goal*) thisGoal
{
    Goal* thisNewGoal = [[Goal alloc]init];
    thisNewGoal.goalName = [NSString string];
    thisNewGoal.goalColor = [UIColor whiteColor];

    thisNewGoal.days = [NSString string];
    thisNewGoal.times = [NSString string];
    thisNewGoal.where = [NSString string];
    thisNewGoal.amount = [NSString string];
    thisNewGoal.step1 = [NSString string];
    thisNewGoal.step2 = [NSString string];
    thisNewGoal.step3 = [NSString string];
    thisNewGoal.step4 = [NSString string];
    thisNewGoal.step5 = [NSString string];

    thisNewGoal.Step1IsOn = NO;
    thisNewGoal.Step2IsOn = NO;
    thisNewGoal.Step3IsOn = NO;
    thisNewGoal.Step4IsOn = NO;
    thisNewGoal.Step5IsOn = NO;

    thisNewGoal.vacation = [NSString string];
    thisNewGoal.holidays = [NSString string];
    thisNewGoal.sick = [NSString string];
    thisNewGoal.other1 = [NSString string];
    thisNewGoal.other2 = [NSString string];
    thisNewGoal.other1Text = [NSString string];
    thisNewGoal.other2Text = [NSString string];

    thisNewGoal.importantRating = -1;
    thisNewGoal.confidentRating = -1;

    return thisNewGoal;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        self.step1 = [decoder decodeObjectForKey:@"step1"];
        self.step2 = [decoder decodeObjectForKey:@"step2"];
        self.step3 = [decoder decodeObjectForKey:@"step3"];
        self.step4 = [decoder decodeObjectForKey:@"step4"];
        self.step5 = [decoder decodeObjectForKey:@"step5"];



        self.goalName = [decoder decodeObjectForKey:@"goalName"];
        self.goalColor = [decoder decodeObjectForKey:@"goalColor"];
        self.where = [decoder decodeObjectForKey:@"where"];
        self.times = [decoder decodeObjectForKey:@"times"];
        self.where = [decoder decodeObjectForKey:@"where"];
        self.amount = [decoder decodeObjectForKey:@"amount"];
        
        self.step1 = [decoder decodeObjectForKey:@"step1"];
        self.step2 = [decoder decodeObjectForKey:@"step2"];
        self.step3 = [decoder decodeObjectForKey:@"step3"];
        self.step4 = [decoder decodeObjectForKey:@"step4"];
        self.step5 = [decoder decodeObjectForKey:@"step5"];


        
        self.Step1IsOn = [decoder decodeBoolForKey:@"Step1IsOn"];
        self.Step2IsOn = [decoder decodeBoolForKey:@"Step2IsOn"];
        self.Step3IsOn = [decoder decodeBoolForKey:@"Step3IsOn"];
        self.Step4IsOn = [decoder decodeBoolForKey:@"Step4IsOn"];
        self.Step5IsOn = [decoder decodeBoolForKey:@"Step5IsOn"];
        
        
        self.vacation = [decoder decodeObjectForKey:@"vacation"];
        self.holidays = [decoder decodeObjectForKey:@"holidays"];
        self.sick = [decoder decodeObjectForKey:@"sick"];
        self.other1 = [decoder decodeObjectForKey:@"other1"];
        self.other2 = [decoder decodeObjectForKey:@"other2"];
        self.other1Text = [decoder decodeObjectForKey:@"other1Text"];
        self.other2Text = [decoder decodeObjectForKey:@"other2Text"];
 
        self.importantRating = [decoder decodeIntegerForKey:@"importantRating"];
        self.confidentRating = [decoder decodeIntegerForKey:@"confidentRating"];

    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)encoder {
    
    
    [encoder encodeObject:self.step1 forKey:@"step1"];
    [encoder encodeObject:self.step2 forKey:@"step2"];
    [encoder encodeObject:self.step3 forKey:@"step3"];
    [encoder encodeObject:self.step4 forKey:@"step4"];
    [encoder encodeObject:self.step5 forKey:@"step5"];
    
     [encoder encodeObject:self.goalName forKey:@"goalName"];
     [encoder encodeObject:self.goalColor forKey:@"goalColor"];
     [encoder encodeObject:self.days forKey:@"days"];
    [encoder encodeObject:self.times forKey:@"times"];
     [encoder encodeObject:self.where forKey:@"where"];
     [encoder encodeObject:self.amount forKey:@"amount"];
    
    [encoder encodeObject:self.step1 forKey:@"step1"];
    [encoder encodeObject:self.step2 forKey:@"step2"];
    [encoder encodeObject:self.step3 forKey:@"step3"];
    [encoder encodeObject:self.step4 forKey:@"step4"];
    [encoder encodeObject:self.step5 forKey:@"step5"];


    [encoder encodeBool:self.Step1IsOn forKey:@"Step1IsOn"];
    [encoder encodeBool:self.Step2IsOn forKey:@"Step2IsOn"];
    [encoder encodeBool:self.Step3IsOn forKey:@"Step3IsOn"];
    [encoder encodeBool:self.Step4IsOn forKey:@"Step4IsOn"];
    [encoder encodeBool:self.Step5IsOn forKey:@"Step5IsOn"];
    
    [encoder encodeObject:self.vacation forKey:@"vacation"];
    [encoder encodeObject:self.holidays forKey:@"holidays"];
    [encoder encodeObject:self.sick forKey:@"sick"];
    [encoder encodeObject:self.other1 forKey:@"other1"];
    [encoder encodeObject:self.other2 forKey:@"other2"];
    [encoder encodeObject:self.other1Text forKey:@"other1Text"];
    [encoder encodeObject:self.other2Text forKey:@"other2Text"];

    [encoder encodeInteger:self.importantRating forKey:@"importantRating"];
    [encoder encodeInteger:self.confidentRating forKey:@"confidentRating"];
}


-(Goal*) copyGoal
{
  NSData* selfArchive = [NSKeyedArchiver archivedDataWithRootObject:self];
  Goal* goalCopy = [NSKeyedUnarchiver unarchiveObjectWithData:selfArchive];
  return goalCopy;
}

@end
