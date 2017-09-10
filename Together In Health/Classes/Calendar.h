//
//  temp.h
//  RetirementCountdown
//
//  Created by Jon Mandell on 10/15/09.
//  Copyright 2009 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kCalendarwidth 315
#define kCalendarContainerwidth 320
#define kCalendarDaysleft 4
#define kCalendarDaystop 0
#define kCalendarDaysHeight4 153+12
#define kCalendarDaysHeight5 191+12
#define kCalendarDaysHeight6 230+12

@class GoalCalendarViewController;

@interface Calendar : UIView {


}

@property (nonatomic, strong) GoalCalendarViewController *goalCalendarViewController;

@property (nonatomic	) NSInteger			currentYear;
@property (nonatomic	) NSInteger			currentMonth;
@property (nonatomic	) NSInteger			day1weekday;
@property (nonatomic	) NSInteger			totaldays;
@property (nonatomic	) NSInteger			totalweeks;


@property (nonatomic, strong	) UIColor			*daytextColor;
@property (nonatomic, strong	) UIColor			*dayBackgroundColor;
@property (nonatomic, strong	) UIColor			*weekdayLabelsTextColor;
@property (nonatomic, strong	) UIColor			*weekdayLabelsBackgroundColor;
@property (nonatomic, strong	) UIColor			*nonMonthDaytextColor;
@property (nonatomic, strong	) UIColor			*nonMonthDayBackgroundColor;
@property (nonatomic, strong	) UIColor			*todaytextColor;
@property (nonatomic, strong	) UIColor			*todayBackgroundColor;

- (id)initWithHandler:(id)handler forMonth:(NSInteger)month andYear:(NSInteger)year;
-(void) loadWeekdayNameLabels;
- (void)drawCalendarForYear:(NSInteger)year month:(NSInteger)month;

-(NSDate*) dateincrement:(NSDate*)date daystostep:(NSInteger)daystoStep monthstostep:(NSInteger)monthstoStep;
-(NSInteger)getdaysinmonth:(NSInteger)month year:(NSInteger)year;







@end
