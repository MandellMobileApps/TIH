//
//  AppDelegate.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/2/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HealthKit/HealthKit.h>



enum searchScope {
    BeginsWith = 1,
    EndsWith = 2,
    Contains = 3,
};

enum SubscriptionLevel {
    SubscriptionFree = 0,
    SubscriptionPaid1 = 1,
    SubscriptionPaid2 = 2,
    
};


@class Day;
@class UpGradeViewController;
@class GoalSetViewController;
@class GoalGamePlanViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) Day *day;

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) NSMutableArray *days;
@property (nonatomic, strong) NSMutableArray *allActivities;
@property (nonatomic, strong) NSMutableArray *allPlates;
@property (nonatomic, strong) NSMutableArray *allMoods;
@property (nonatomic, strong) GoalGamePlanViewController* goalGamePlanViewController;
@property (nonatomic, strong) GoalSetViewController *goalSetViewController;

@property (nonatomic, strong) NSMutableArray *menuPlansArray;
@property (nonatomic, strong) NSMutableArray    *goalsArray;
@property (nonatomic, strong) NSString* zohoAuthToken;
@property (nonatomic, strong) NSString* contactEmail;
@property (nonatomic) NSInteger subscriptionLevel;



//@property (nonatomic, strong) NSMutableArray *dayPackage;

-(void)loadPersistent;
-(void)savePersistent;
//-(Day*)dayForDateOffset:(int)offset;
-(Day*)dayForDate:(NSDate*)thisDate;
-(Day*)calendarDayForDate:(NSDate*)thisDate;
- (BOOL)string:(NSString*)string containsString:(NSString*)other;
-(void) loadGoals;
-(UIColor*)defaultGoalColors:(NSInteger)g;
-(void)saveGoals;
-(void)upsertContactForEmail:(NSString*)email atSubcriptionLevel:(NSInteger)subscriptionLevel inController:(UpGradeViewController*)controller;
-(void)checkSubscriptionLevel;
-(void) loadMenuPlans;
-(void)saveMenuPlans;
+(NSInteger)uniqueId;
@end

