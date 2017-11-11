//
//  Day.m
//  TIHMaster
//
//  Created by Cami Mandell on 7/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Day.h"
#import "TIHDate.h"

@implementation Day

-(id) initWithDate:(NSDate*)thisDate
{
    Day* thisDay = [[Day alloc]init];
    thisDay.date = [TIHDate dateAtMidnightFromDate:thisDate];
    thisDay.stressRating = -1;
    thisDay.energyRating = -1;
    thisDay.concentrationRating = -1;
    thisDay.moodRating = -1;
    thisDay.copingRating = -1;

    thisDay.sleepTimeRating = -1;
    thisDay.wakeTimeRating = -1;
    
    thisDay.sleepTime = [NSDate date];
    thisDay.wakeTime = [NSDate date];
    
    thisDay.dateArray = [NSMutableArray array];
    thisDay.foodArray = [NSMutableArray array];
    thisDay.activityArray = [NSMutableArray array];
    thisDay.drinksArray = [NSMutableArray array];
    thisDay.moodArray = [NSMutableArray array];

    thisDay.steps = @"0";
    thisDay.waterCupsString = @"0";
    
    thisDay.goal1 = NO;
    thisDay.goal2 = NO;
    thisDay.goal3 = NO;
    
    return thisDay;
}


-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        self.date = [decoder decodeObjectForKey:@"date"];
        
        self.dateArray = [decoder decodeObjectForKey:@"dateArray"];
        self.sleepTime = [decoder decodeObjectForKey:@"sleepTime"];
        self.wakeTime = [decoder decodeObjectForKey:@"wakeTime"];
        self.activityArray = [decoder decodeObjectForKey:@"activityArray"];
        self.foodArray = [decoder decodeObjectForKey:@"foodArray"];
        self.waterCupsString = [decoder decodeObjectForKey:@"waterCupsString"];
        self.moodArray = [decoder decodeObjectForKey:@"moodArray"];
        
        self.mealLocation = [decoder decodeIntForKey:@"mealLocation"];
        
        self.stressRating = [decoder decodeIntForKey:@"stressRating"];
        self.energyRating = [decoder decodeIntForKey:@"energyRating"];
        self.concentrationRating = [decoder decodeIntForKey:@"concentrationRating"];
        self.moodRating = [decoder decodeIntForKey:@"moodRating"];
        self.copingRating = [decoder decodeIntForKey:@"copingRating"];
        
        self.restedRating = [decoder decodeIntForKey:@"restedRating"];
        self.ratedRating = [decoder decodeIntForKey:@"ratedRating"];
        
        self.mealLocation = [decoder decodeIntForKey:@"mealLocation"];
        self.steps = [decoder decodeObjectForKey:@"steps"];

        self.goal1 = [decoder decodeBoolForKey:@"goal1"];
        self.goal2 = [decoder decodeBoolForKey:@"goal2"];
        self.goal3 = [decoder decodeBoolForKey:@"goal3"];
        
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject: self.date forKey:@"date"];
    
    [encoder encodeObject: self.dateArray forKey:@"dateArray"];
    [encoder encodeObject:self.sleepTime forKey:@"sleepTime"];
      [encoder encodeObject:self.wakeTime forKey:@"wakeTime"];
    
    [encoder encodeObject:self.activityArray forKey:@"activityArray"];
    
    [encoder encodeObject:self.foodArray forKey:@"foodArray"];
    [encoder encodeObject:self.moodArray forKey:@"moodArray"];
    [encoder encodeObject:self.waterCupsString forKey:@"waterCupsString"];
    
    [encoder encodeInt:self.stressRating forKey:@"stressRating"];
     [encoder encodeInt:self.energyRating forKey:@"energyRating"];
    [encoder encodeInt:self.concentrationRating forKey:@"concentrationRating"];
    [encoder encodeInt:self.moodRating forKey:@"moodRating"];
    [encoder encodeInt:self.copingRating forKey:@"copingRating"];
    
    [encoder encodeObject:self.steps forKey:@"steps"];
    [encoder encodeObject:self.distance forKey:@"distance"];
    [encoder encodeInt:self.restedRating forKey:@"restedRating"];
    [encoder encodeInt:self.ratedRating forKey:@"ratedRating"];
    
    [encoder encodeInt:self.mealLocation forKey:@"mealLocation"];
    
    [encoder encodeBool:self.goal1 forKey:@"goal1"];
    [encoder encodeBool:self.goal2 forKey:@"goal2"];
    [encoder encodeBool:self.goal3 forKey:@"goal3"];
    
//    [encoder encodeObject:self.healthyDrinkArray forKey:@"healthDrinkArray"];
//    [encoder encodeObject:self.sugaryDrinkArray forKey:@"sugaryDrinkArray"];
//    [encoder encodeObject:self.caffeineDrinkArray forKey:@"caffeineDrinkArray"];
//    [encoder encodeObject:self.alcoholDrinkArray forKey:@"alcoholDrinkArray"];
//    [encoder encodeBool:self.isRated forKey:@"isRated"];
//    [encoder encodeBool:self.isRested forKey:@"isRested"];
    
}

-(void)printoutDay
{
    NSLog(@"date  %@",self.date);
    NSLog(@"foodArray  %@",self.foodArray);
    NSLog(@"activityArray  %@",self.activityArray);
    NSLog(@"sleepTime  %@",self.sleepTime);
    NSLog(@"wakeTime  %@",self.wakeTime);
    NSLog(@"date  %@",self.date);





}

@end
