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

enum PaymentTerm {
    PaymentTermMonthly = 0,
    PaymentTermYearly = 1,
    
};

@class Day;
@class UpGradeViewController;
@class GoalSetViewController;
@class GoalGamePlanViewController;
@class MenuPlan;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) Day *day;

@property (nonatomic) BOOL iPhoneX;
@property (nonatomic) BOOL iPhone5;
@property (nonatomic, strong) NSString* iPhoneString;

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) NSMutableArray *days;
@property (nonatomic, strong) NSMutableArray *allActivities;
@property (nonatomic, strong) NSMutableArray *allPlates;
@property (nonatomic, strong) NSMutableArray *allMoods;
@property (nonatomic, strong) GoalGamePlanViewController* goalGamePlanViewController;
@property (nonatomic, strong) GoalSetViewController *goalSetViewController;

@property (nonatomic, strong) MenuPlan *menuPlan;
// menuItems
//@property (nonatomic, strong) NSMutableArray *breakfastItemsArray;
//@property (nonatomic, strong) NSMutableArray *lunchItemsArray;
//@property (nonatomic, strong) NSMutableArray *dinnerItemsArray;
//@property (nonatomic, strong) NSMutableArray *snackItemsArray;
@property (nonatomic, strong) NSMutableArray *menuItemsArray;

@property (nonatomic, strong) NSMutableArray *goalsArray;
@property (nonatomic, strong) NSString* zohoAuthToken;
@property (nonatomic, strong) NSString* contactEmail;
@property (nonatomic) NSInteger subscriptionLevel;
@property (nonatomic) NSInteger paymentTerm;
@property (nonatomic, strong) NSDate* subscriptionDate;
@property (nonatomic) NSInteger dailyActivityGoal;


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
-(void)upsertContactForEmail:(NSString*)email atSubcriptionLevel:(NSInteger)subscriptionLevel forPaymentTerm:(NSInteger)term inController:(id)controller;
-(void)checkSubscriptionLevel;
-(void)loadMenuPlan;
-(void)loadMenuItems;
-(void)saveMenuPlan;
-(void)saveMenuItems;
+(NSInteger)uniqueId;
@end

