//
//  Activity.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "Activity.h"

@implementation Activity

+ (id)activityName:(NSString*)activityName category:(NSString*)category Type:(NSString*)activityType
{
    Activity *newActivity = [[self alloc] init];
    newActivity.category = category;
    newActivity.activityName = activityName;
    newActivity.activityType = activityType;
    return newActivity;
}

-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.isChosen = [decoder decodeBoolForKey:@"isChosen"];
        self.isFavorite = [decoder decodeBoolForKey:@"isFavorite"];
        self.category = [decoder decodeObjectForKey:@"category"];
        self.activityName = [decoder decodeObjectForKey:@"activityName"];
        self.time = [decoder decodeObjectForKey:@"time"];
        self.activityType = [decoder decodeObjectForKey:@"activityType"];
//        self.activityArray = [decoder decodeObjectForKey:@"activityArray"];
//        self.chosenArray = [decoder decodeObjectForKey:@"chosenArray"];
//        self.favoritesArray = [decoder decodeObjectForKey:@"favoritesArray"];
        
        
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeBool:self.isChosen forKey:@"isChosen"];
    [encoder encodeBool:self.isFavorite forKey:@"isFavorite"];
    [encoder encodeObject:self.category forKey:@"category"];
    [encoder encodeObject:self.activityName forKey:@"activityName"];
    [encoder encodeObject:self.time forKey:@"time"];
    [encoder encodeObject:self.activityType forKey:@"activityType"];
//    [encoder encodeObject:self.activityArray forKey:@"activityArray"];
//    [encoder encodeObject:self.chosenArray forKey:@"chosenArray"];
//    [encoder encodeObject:self.favoritesArray forKey:@"favoritesArray"];
    
}

- (Activity*)copyWithZone:(NSZone *)zone
{
    Activity *activity = [[Activity allocWithZone: zone] init];

    if (activity) {
        [activity setCategory:[self.category copyWithZone:zone]];
        [activity setActivityName:[self.activityName copyWithZone:zone]];
        [activity setTime:[self.time copyWithZone:zone]];
        [activity setActivityType:[self.activityType copyWithZone:zone]];
        
        [activity setIsFavorite:self.isFavorite];
        [activity setIsChosen:self.isChosen];

        return activity;
    }

    return nil;
}


@end
