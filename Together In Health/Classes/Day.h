//
//  Day.h
//  TIHMaster
//
//  Created by Cami Mandell on 7/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuPlan.h"

@interface Day : NSObject <NSCoding>

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, strong) NSMutableArray* dateArray;

@property (nonatomic, strong) NSMutableArray* foodArray;
@property (nonatomic, strong) NSMutableArray* moodArray;
@property (nonatomic, strong) NSMutableArray* activityArray;
@property (nonatomic, strong) NSMutableArray* drinksArray;
@property (nonatomic, strong) NSString* waterCupsString;

@property (nonatomic, strong) MenuPlan* menuPlanBreakfast;
@property (nonatomic, strong) MenuPlan* menuPlanLunch;
@property (nonatomic, strong) MenuPlan* menuPlanDinner;
@property (nonatomic, strong) MenuPlan* menuPlanSnack;

@property (nonatomic, strong) NSString* steps;
@property (nonatomic, strong) NSString* distance;

@property (nonatomic, strong) NSDate* sleepTime;
@property (nonatomic, strong) NSDate* wakeTime;

@property (nonatomic) int stressRating;
@property (nonatomic) int energyRating;
@property (nonatomic) int concentrationRating;
@property (nonatomic) int moodRating;
@property (nonatomic) int copingRating;

@property (nonatomic) int sleepTimeRating;
@property (nonatomic) int wakeTimeRating;

@property (nonatomic) int mealLocation;
@property (nonatomic) int restedRating;
@property (nonatomic) int ratedRating;

@property (nonatomic) BOOL goal1;
@property (nonatomic) BOOL goal2;
@property (nonatomic) BOOL goal3;

-(id) initWithDate:(NSDate*)thisDate;
-(void)printoutDay;

@end
