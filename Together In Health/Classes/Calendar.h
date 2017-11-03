//
//  temp.h
//  RetirementCountdown
//
//  Created by Jon Mandell on 10/15/09.
//  Copyright 2009 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@class GoalCalendarViewController;

@interface Calendar : UIView {


}

@property (nonatomic, weak) GoalCalendarViewController *goalCalendarViewController;

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

@property (nonatomic) float calendarWidth;
@property (nonatomic) float calendarHeight;
@property (nonatomic) float calendarDaysWidth;
@property (nonatomic) float calendarDaysHeight;
@property (nonatomic) float calendarDaySide;



-(id) initWithHandler:(id)handler forMonth:(NSInteger)month andYear:(NSInteger)year;
-(void) loadWeekdayNameLabels;
-(void) drawCalendarForYear:(NSInteger)year month:(NSInteger)month;

-(NSDate*) dateincrement:(NSDate*)date daystostep:(NSInteger)daystoStep monthstostep:(NSInteger)monthstoStep;
-(NSInteger)getdaysinmonth:(NSInteger)month year:(NSInteger)year;







@end
