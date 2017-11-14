//
//  Calendar.m
//  RetirementCountdown
//
//  Created by Jon Mandell on 10/15/09.
//  Copyright 2009 MandellMobileApps. All rights reserved.
//



#import "Calendar.h"
#import "ColorsClass.h"
#import "GoalCalendarViewController.h"
#import "Day.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@interface Calendar () {
    
}

@property (nonatomic, weak) AppDelegate* appDelegate;

@end

@implementation Calendar




- (id)initWithHandler:(id)handler forMonth:(NSInteger)month andYear:(NSInteger)year {
    if (self = [super init]) {
        // get Appdelegate pointer
        self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
        // set ivars
		self.currentYear = year;
		self.currentMonth = month;
        self.goalCalendarViewController = handler;
       
        // set colors
		self.daytextColor = [ColorsClass black];
		self.dayBackgroundColor = [ColorsClass white];
		self.weekdayLabelsTextColor = [ColorsClass black];
		self.weekdayLabelsBackgroundColor = [ColorsClass LightBlue];
		self.nonMonthDaytextColor = [ColorsClass darkgray];
		self.nonMonthDayBackgroundColor = [ColorsClass lightgray];
		self.todaytextColor = [ColorsClass white];
		self.todayBackgroundColor = [ColorsClass CoolGrey];
        
        
        
        self.calendarWidth = self.goalCalendarViewController.view.bounds.size.width-40;
        self.calendarDaySide = self.calendarWidth/7;
        
        // initialize and add weekday name labels
		[self loadWeekdayNameLabels];

        [self drawCalendarForYear:self.currentYear month:self.currentMonth];

    }

    return self;
}



-(void) loadWeekdayNameLabels {

	// initialize and add weekday name labels
	NSArray *weekdaynames = [[NSArray alloc] initWithObjects:@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat", nil];
	for(int i = 0; i < 7; i++) {
		UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(i * self.calendarDaySide, 0, self.calendarDaySide, 12)];
		lbl.text = [weekdaynames objectAtIndex:i];
		lbl.textAlignment = NSTextAlignmentCenter;
		lbl.font = [UIFont systemFontOfSize:12];
		lbl.backgroundColor = self.weekdayLabelsBackgroundColor;
        lbl.textColor = self.weekdayLabelsTextColor;
        //NSLog(@"lbl.frame %@",NSStringFromCGRect(lbl.frame));
        [self addSubview:lbl];
	}

}






// draw the calendar for scrolling months  //////////////////////////////////////////////////////////////////////////////////////////
- (void)drawCalendarForYear:(NSInteger)year month:(NSInteger)month {


//    for (UIView* thisView in self.subviews)
//    {
//        [thisView removeFromSuperview];
//    }

	// find number of days in given month
	NSInteger daysinmonth = [self getdaysinmonth:month year:year];

	// get the first day of the month
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

	NSDateComponents *firstofmonthcomps1 = [[NSDateComponents alloc] init];
	[firstofmonthcomps1 setDay:1];
	[firstofmonthcomps1 setMonth:month];
	[firstofmonthcomps1 setYear:year];
	NSDate *firstofmonthdate = [gregorian dateFromComponents:firstofmonthcomps1];
	NSDateComponents *firstofmonthcomps2 = [gregorian components:NSCalendarUnitWeekday fromDate:firstofmonthdate];
	self.day1weekday = [firstofmonthcomps2 weekday];

	// assign day values to cells calculated with an offset of first weekday of month
	if (daysinmonth + self.day1weekday < 30) {
		self.totalweeks = 4;
		self.totaldays = 28;
	}
	else if (daysinmonth + self.day1weekday < 37)  {
		self.totalweeks = 5;
		self.totaldays = 35;
	} else {
		self.totalweeks = 6;
		self.totaldays = 42;
	}

    self.calendarHeight = self.totalweeks*self.calendarDaySide+12;
    CGRect calendardaysframe = CGRectMake(0,0,self.calendarWidth,self.calendarHeight);
    [self setFrame:calendardaysframe];
    [self setNeedsDisplay];
    NSLog(@"self.calendarHeight %f",self.calendarHeight);
    NSLog(@"days %lu, weeks %lu, day1 %lu, inmonth %lu",self.totaldays,self.totalweeks,self.day1weekday,daysinmonth);
    
	//  get first day of calendar page
	NSInteger amount = 1-self.day1weekday;
	NSDate *startdate = [self dateincrement:firstofmonthdate daystostep:amount monthstostep:0];
    NSDateComponents *todaycomps = [gregorian components:NSCalendarUnitDay | NSCalendarUnitMonth fromDate:[NSDate date]];
    NSInteger todayMonth = [todaycomps month];
    NSInteger todayDay = [todaycomps day];
    
        for(int i = 0; i < self.totalweeks; i++) {
			for(int j = 0; j < 7; j++) {
                NSLog(@"i %i",i);

                CGRect dayRect = CGRectMake(j * self.calendarDaySide, (i * self.calendarDaySide)+12, self.calendarDaySide, self.calendarDaySide);
				UIView *dayView = [[UIView alloc]initWithFrame:dayRect];
//                NSLog(@"dayRect %@",NSStringFromCGRect(dayRect));
                dayView.backgroundColor = [ColorsClass lightgray];

                NSDateComponents *dayofmonthcomps = [gregorian components:NSCalendarUnitDay | NSCalendarUnitMonth fromDate:startdate];
                NSInteger thisMonth = [dayofmonthcomps month];
                NSInteger dayOfMonth = [dayofmonthcomps day];

                UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, self.calendarDaySide-2, self.calendarDaySide-2)];
				lbl.textAlignment = NSTextAlignmentCenter;
				lbl.font = [UIFont systemFontOfSize:22];
                lbl.text = [NSString stringWithFormat:@"%ld",dayOfMonth];
                if (thisMonth == month)
                {
                    if ((todayDay == dayOfMonth)&&(todayMonth == thisMonth))
                    {
                        lbl.backgroundColor = self.todayBackgroundColor;
                        lbl.textColor = self.todaytextColor;
                    }
                    else
                    {
                        lbl.backgroundColor = self.dayBackgroundColor;
                        lbl.textColor = self.daytextColor;
                    }
                }
                else
                {
                    lbl.backgroundColor = self.nonMonthDayBackgroundColor;
                    lbl.textColor = self.nonMonthDaytextColor;
                }
				[dayView addSubview:lbl];
                
                // increment to the next day of the month
                startdate = [self dateincrement:startdate daystostep:1 monthstostep:0];
                //NSLog(@"%@",startdate);
                
				UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.calendarDaySide, self.calendarDaySide)];
				[btn addTarget:self.goalCalendarViewController action:@selector(showDayGoalsView:) forControlEvents:UIControlEventTouchUpInside];
                if (thisMonth == month)
                {
                    btn.tag = dayOfMonth;
                }
                else
                {
                    btn.tag = -1;
                }
				[dayView addSubview:btn];

                // get day object for this day.  returns nil if not in days array
                Day* thisDayObject = [self.appDelegate calendarDayForDate:startdate];

            if (thisMonth == month)
            {
                
                if (thisDayObject)
                {
                    float goalSpace = 1.5;
                    float goalSide = (self.calendarDaySide/3) - (goalSpace*4);
                    if (thisDayObject.goal1)
                    {
                        UIView *goal1View = [[UIView alloc] initWithFrame:CGRectMake(goalSpace,goalSpace,goalSide,goalSide)];
                        //goal1View.layer.cornerRadius = 50;  // half the width/height
                        [self addBorderAround:goal1View cornerType:CornerTypeSquare withColor:[UIColor blackColor]];
                        goal1View.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:0] goalColor];
                        [lbl addSubview:goal1View];
                    }
                    if (thisDayObject.goal2)
                    {
                        UIView *goal2View = [[UIView alloc] initWithFrame:CGRectMake((goalSpace*2)+goalSide,goalSpace,goalSide,goalSide)];
                        [self addBorderAround:goal2View cornerType:CornerTypeSquare withColor:[UIColor blackColor]];
                        goal2View.backgroundColor =  [[self.appDelegate.goalsArray objectAtIndex:1] goalColor];
                        [lbl addSubview:goal2View];
                    }
                    if (thisDayObject.goal3)
                    {
                        UIView *goal3View = [[UIView alloc] initWithFrame:CGRectMake((goalSpace*3)+(goalSide*2),goalSpace,goalSide,goalSide)];
                        [self addBorderAround:goal3View cornerType:CornerTypeSquare withColor:[UIColor blackColor]];
                        goal3View.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:2] goalColor];
                        [lbl addSubview:goal3View];
                        }
                    }
                }
                [self addSubview:dayView];

          }

        }  // end of looping through days
		

}



-(NSInteger)getdaysinmonth:(NSInteger)month year:(NSInteger)year {
	NSInteger dim;
	dim = 0;
	switch(month) {
		case 1:		// January
			dim = 31;
			break;
		case 2:		// February (check if leap-year)
			dim = ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) ? 29 : 28;
			break;
		case 3:		// March
			dim = 31;
			break;
		case 4:		// April
			dim = 30;
			break;
		case 5:		// May
			dim = 31;
			break;
		case 6:		// June
			dim = 30;
			break;
		case 7:		// July
			dim = 31;
			break;
		case 8:		// August
			dim = 31;
			break;
		case 9:		// September
			dim = 30;
			break;
		case 10:	// October
			dim = 31;
			break;
		case 11:	// November
			dim = 30;
			break;
		case 12:	// December
			dim = 31;
			break;
	}
	return dim;
}





-(NSDate*) dateincrement:(NSDate*)date daystostep:(NSInteger)daystoStep monthstostep:(NSInteger)monthstoStep {
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
		[offsetComponents  setDay:daystoStep];	
		[offsetComponents  setMonth:monthstoStep];
	NSDate *newdate = [gregorian dateByAddingComponents:offsetComponents toDate:date options:0];

	return newdate;
}


-(void)addBorderAround:(id)object cornerType:(NSInteger)corner withColor:(UIColor*)color
{

    if ([object isKindOfClass:[UIButton class]])
    {
        UIButton* thisObject = (UIButton*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
    else if ([object isKindOfClass:[UITextField class]])
    {
        UITextField* thisObject = (UITextField*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
     else if ([object isKindOfClass:[UITextView class]])
    {
        UITextView* thisObject = (UITextView*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
     else if ([object isKindOfClass:[UILabel class]])
    {
        UILabel* thisObject = (UILabel*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
     else if ([object isKindOfClass:[UIView class]])
    {
        UIView* thisObject = (UIView*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
}



@end

