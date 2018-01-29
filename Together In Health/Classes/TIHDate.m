//
//  MGDate.m
//  Traveler1
//
//  Created by Jon Mandell on 5/28/13.
//  Copyright (c) 2013 Jon Mandell. All rights reserved.
//



// **************************
//     Definitions
// **************************

// TimeIntervalFrom1970
//    Returns the interval between the receiver and the first instant of 1 January 1970, GMT.  GMT is what is important here.
//    timeIntervalSince1970 returns a number of seconds since midnight January 1, 1970 UTC. And that means that timeIntervalSince1970
//    automatically converts the time from a local timezone to GMT and only then calculates the number of seconds that have elapsed
//    since 01/01/1970 00:00:00. So it does it take current time zone into account!   Another thing to notice is that if we store
//    the result of timeIntervalSince1970 in 32 bit number it will overflow sometime in January of 2038.




#import "TIHDate.h"

@implementation TIHDate : NSDate


+(void)setFormatter:(NSDateFormatter*)dateFormatter withFormat:(int)formatType
{

    switch (formatType) {
        case DateFormatMediumDateMediumTime:;
            dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            dateFormatter.timeStyle = NSDateFormatterMediumStyle;
            break;
        case DateFormatMediumDateNoTime:;
            dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            dateFormatter.timeStyle = NSDateFormatterNoStyle;
            break;
        case DateFormatNoDateMediumTime:;
            dateFormatter.dateStyle = NSDateFormatterNoStyle;
            dateFormatter.timeStyle = NSDateFormatterMediumStyle;
            break;
        case DateFormatShortDateShortTime:;
            dateFormatter.dateStyle = NSDateFormatterShortStyle;
            dateFormatter.timeStyle = NSDateFormatterShortStyle;
            break;
        case DateFormatMediumDateLongTime:;
            dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            dateFormatter.timeStyle = NSDateFormatterLongStyle;
            break;
        case DateFormatNoDateShortTime:;
            dateFormatter.dateStyle = NSDateFormatterNoStyle;
            dateFormatter.timeStyle = NSDateFormatterShortStyle;
            break;
            
        case DateFormatShortDateNoTime:;
            dateFormatter.dateStyle = NSDateFormatterShortStyle;
            dateFormatter.timeStyle = NSDateFormatterNoStyle;
            break;
        case DateFormatLongDateNoTime:;
            dateFormatter.dateStyle = NSDateFormatterLongStyle;
            dateFormatter.timeStyle = NSDateFormatterNoStyle;
            break;
            
        case DateFormatCustom1:;
            dateFormatter.dateFormat = DateFormatCustom1String;
            break;
        case DateFormatCustom2:;
            dateFormatter.dateFormat = DateFormatCustom2String;
            break;
        case DateFormatCustom3:;
            dateFormatter.dateFormat = DateFormatCustom3String;
            break;
        case DateFormatCustom4:;
            dateFormatter.dateFormat = DateFormatCustom4String;
            break;
        case DateFormatCustom5:;
            dateFormatter.dateFormat = DateFormatCustom5String;
            break;
        case DateFormatCustom6:;
            dateFormatter.dateFormat = DateFormatCustom6String;
            break;
        case DateFormatCustom7:;
            dateFormatter.dateFormat = DateFormatCustom7String;
            break;
        case DateFormatCustom8:;
            dateFormatter.dateFormat = DateFormatCustom8String;
            break;
        case DateFormatCustom9:;
            dateFormatter.dateFormat = DateFormatCustom9String;
            break;
        case DateFormatCustom10:;
            dateFormatter.dateFormat = DateFormatCustom10String;
            break;
        case DateFormatCustom11:;
            dateFormatter.dateFormat = DateFormatCustom11String;
            break;
        case DateFormatCustom12:;
            dateFormatter.dateFormat = DateFormatCustom12String;
            break;
        case DateFormatCustom13:;
            dateFormatter.dateFormat = DateFormatCustom13String;
            break;
        default:
            break;
    }

}

+(NSString*)dayOfWeekString:(NSInteger)dayOfWeek
{
    NSString* thisDayOfWeekString;
      switch (dayOfWeek) {
      case 0:
        thisDayOfWeekString = @"Monday";
        break;
      case 1:
        thisDayOfWeekString = @"Tuesday";
        break;
      case 2:
        thisDayOfWeekString = @"Wednesday";
        break;
      case 3:
        thisDayOfWeekString = @"Thursday";
        break;
      case 4:
        thisDayOfWeekString = @"Friday";
        break;
      case 5:
        thisDayOfWeekString = @"Saturday";
        break;
      case 6:
        thisDayOfWeekString = @"Sunday";
        break;
      default:
        break;
    }
    return thisDayOfWeekString;
}
#pragma mark Date Strings
+(NSString*) dateStringfromEpoch:(NSString*)epoch withFormat:(int)formatType
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
    
    double thisEpoch = [epoch doubleValue];
    if (thisEpoch == 0)
    {
        return  NSLocalizedString(@"N/A", @"N/A");
    }
    
    
    NSDate* thisDate = [NSDate dateWithTimeIntervalSince1970:thisEpoch];
    NSString *stringDate = [dateFormatter stringFromDate:thisDate];
    return stringDate;
    
    
    
}
+(NSString*) dateStringFromDate:(NSDate*)thisDate withFormat:(int)formatType
{
    
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
    
    NSString *stringDate = [dateFormatter stringFromDate:thisDate];
    return stringDate;
    
    
}
+(NSString*) dateStringfromEpoch:(NSString*)epoch withFormat:(int)formatType adjustedBy:(double)timeInterval
{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
    double thisEpoch = [epoch doubleValue];
    if (thisEpoch == 0)
    {
        return  NSLocalizedString(@"N/A", @"N/A");
    }
    
    double nowEpoch = [epoch doubleValue] + timeInterval;
    NSDate* thisDate = [NSDate dateWithTimeIntervalSince1970:nowEpoch];
    NSString *stringDate = [dateFormatter stringFromDate:thisDate];
    return stringDate;
    
    
}
+(NSString*) dateStringFromDate:(NSDate*)thisDate withFormat:(int)formatType adjustedBy:(double)timeInterval
{
    
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
    
      NSDate* adjustedDate = [thisDate dateByAddingTimeInterval:timeInterval];
    NSString *stringDate = [dateFormatter stringFromDate:adjustedDate];
    return stringDate;
    
    
}

+(NSString*) dateStringFromString:(NSString*)dateString fromFormat:(int)fromFormatType toFormat:(int)toFormatType
{
    NSDate* date = [TIHDate dateFromString:dateString Format:fromFormatType];
    NSString* newString = [TIHDate dateStringFromDate:date withFormat:toFormatType];
    if (!newString)
    {
        newString = @"No Date Available";
    }
    
    return newString;

}

+(NSString*) dateStringFirstOfMonthWithFormat:(int)formatType
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay; // | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	NSDateComponents *todayComps = [gregorian components:unitFlags fromDate:[NSDate date]];
    todayComps.day = 0;
    NSDate *firstAtMonthMidnight = [gregorian dateFromComponents:todayComps];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
    NSString *stringDate = [dateFormatter stringFromDate:firstAtMonthMidnight];
    return stringDate;

}
+(NSString*) dayOfWeekStringFromDate:(NSDate*)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = NSCalendarUnitWeekday; // | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:date];
    NSInteger dayOfWeek = comps.weekday;
    return [TIHDate dayOfWeekString:dayOfWeek];
    
}
+(NSString*) dateStringFirstOfLastMonthWithFormat:(int)formatType
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay; // | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	NSDateComponents *todayComps = [gregorian components:unitFlags fromDate:[NSDate date]];
    todayComps.day = 0;
    NSInteger month = todayComps.month--;
    if (month == 0)
    {
        todayComps.month = 12;
    }
    else
    {
        todayComps.month = month;
    }
    NSDate *firstOfLAstMonthMidnight = [gregorian dateFromComponents:todayComps];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
    NSString *stringDate = [dateFormatter stringFromDate:firstOfLAstMonthMidnight];
    return stringDate;
}


#pragma mark Dates

+(NSDate*) dateFromString:(NSString*)dateString Format:(int)formatType
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
  
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
    
    
    
    
}
+(NSDate*) datefromEpoch:(NSString*)epoch
{
    return [NSDate dateWithTimeIntervalSince1970:[epoch doubleValue]];
}


#pragma mark Epochs

+(NSString*) epochStringFromDate:(NSDate*)thisDate
{
    double nowEpoch = [thisDate timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f",nowEpoch];
}

+(NSString*) epochStringFromDate:(NSDate*)thisDate adjustedBy:(double)timeInterval
{
    NSDate* adjustedDate = [thisDate dateByAddingTimeInterval:timeInterval];
    double nowEpoch = [adjustedDate timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f",nowEpoch];
}

+(double) epochDoubleFromDateString:(NSString*)dateString Format:(int)formatType
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [self setFormatter:dateFormatter withFormat:(int)formatType];
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [date timeIntervalSince1970];
}

+(double) epochDoubleFromDate:(NSDate*)epoch adjustedBy:(double)timeInterval
{
    double adjustedEpoch = [epoch timeIntervalSince1970] + timeInterval;
    return adjustedEpoch;
    
}



#pragma mark Convenience Methods
// **************************
//     Convenience Methods
// **************************

+(double) doubleEpochAtMidnightTwoWeeksAgo
{

	//get todays NSDate at midnight
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay; // | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	NSDateComponents *todayComps = [gregorian components:unitFlags fromDate:[NSDate date]];
	NSDate *todayAtMidnight = [gregorian dateFromComponents:todayComps];
    double epoch = [todayAtMidnight timeIntervalSince1970];
    double epochTwoWeeksAgo = epoch-(60*60*24*14);
	return epochTwoWeeksAgo;

}

+(NSString*) epochAtMidnightOneWeekAgo
{

	//get todays NSDate at midnight
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay; // | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	NSDateComponents *todayComps = [gregorian components:unitFlags fromDate:[NSDate date]];
	NSDate *todayAtMidnight = [gregorian dateFromComponents:todayComps];
    double epoch = [todayAtMidnight timeIntervalSince1970];
    double epochTwoWeeksAgo = epoch-(60*60*24*7);
	return [NSString stringWithFormat:@"%.0f",epochTwoWeeksAgo];

}

+(NSString*) epochAtMidnightFromEpoch:(NSString*)thisDateString
{
	
    NSDate* thisDate = [NSDate dateWithTimeIntervalSince1970:[thisDateString doubleValue]];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:thisDate];
	NSDate *todayAtMidnight = [gregorian dateFromComponents:components];
    NSString* midnight = [NSString stringWithFormat:@"%.0f",[todayAtMidnight timeIntervalSince1970]];
    return midnight;
}

+(NSDate*) dateAtMidnightFromEpoch:(NSString*)thisDateString
{
	
    NSDate* thisDate = [NSDate dateWithTimeIntervalSince1970:[thisDateString doubleValue]];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:thisDate];
	NSDate *todayAtMidnight = [gregorian dateFromComponents:components];
    return todayAtMidnight;
}

+(NSDate*) dateAtMidnightFromDate:(NSDate*)thisDate
{
	
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:thisDate];
	NSDate *todayAtMidnight = [gregorian dateFromComponents:components];
    return todayAtMidnight;
}

+(NSInteger) currentHour
{
	
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitHour;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:[NSDate date]];
    return components.hour;
}


+(double) epochAtMidnightFromDate:(NSDate*)thisDate
{
	
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:thisDate];
	NSDate *todayAtMidnight = [gregorian dateFromComponents:components];
    double epoch = [todayAtMidnight timeIntervalSince1970];
    return epoch;
}


+(double) epoch24HoursAgo
{
    double nowEpoch = [[NSDate date] timeIntervalSince1970];
    return nowEpoch-(60*60*24);

}

+(double) epoch1MinuteAgo
{
    double nowEpoch = [[NSDate date] timeIntervalSince1970];
    return nowEpoch-(60);

}

+(double) epoch1Hour1Ago
{
    double nowEpoch = [[NSDate date] timeIntervalSince1970];
    return nowEpoch-(60*60);

}


+(NSString*) stringEpochSundayFromDate:(NSDate*)thisDate
{
	NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:thisDate];

	NSUInteger weekdayUnitFlags = NSCalendarUnitWeekday;
    NSDateComponents *componentsWeekday = [gregorian components:weekdayUnitFlags fromDate:thisDate];

	NSDate *todayAtMidnight = [gregorian dateFromComponents:components];
    NSString* stringEpochSundayStartOfDay = [TIHDate epochStringFromDate:todayAtMidnight adjustedBy:-(componentsWeekday.weekday-1)*60*60*24];
	return stringEpochSundayStartOfDay;
}

+(NSString*) stringDurationFromDouble:(double)timeInterval
{
	NSString* duration;
    if (timeInterval< 60)
    {
    	duration = [NSString stringWithFormat:@"%.0f seconds",timeInterval];
    }
    else if (timeInterval < 60*60)
    {
        double mins = timeInterval/60;
        double secs = remainder(timeInterval, 60);
        duration = [NSString stringWithFormat:@"%.0f mins, %.0f secs",mins,secs];
    }
    else if (timeInterval < 60*60*24)
    {
        double hours = timeInterval/24;
        double mins = remainder(timeInterval, 60);
        double secs = remainder(timeInterval/24, 60);
        duration = [NSString stringWithFormat:@"%.0f hours, %.0f mins, %.0f secs",hours,mins,secs];
    }
	return duration;

}

+(NSString*) dateTimeMediumFormatForStandardFormat:(NSString*)standard
{
    NSDate* thisDate = [TIHDate dateFromString:standard Format:DateFormatCustom5];
    if (thisDate)
    {
        return  [TIHDate dateStringFromDate:thisDate withFormat:DateFormatMediumDateMediumTime];
    }
    NSDate* thisDate2 = [TIHDate dateFromString:standard Format:DateFormatCustom6];
    if (thisDate2)
    {
        return  [TIHDate dateStringFromDate:thisDate2 withFormat:DateFormatMediumDateMediumTime];
    }
    return @"";
    
}

+(NSString*) dateStringWithoutSecondsDecimal:(NSString*)standard withFormat:(int)formatType returnFormat:(int)returnFormatType
{
    
    NSRange range1 = [standard rangeOfString:@"."];
    if (range1.location != NSNotFound)
    {
        standard = [standard substringToIndex:range1.location];
        
    }
    NSDate* thisDate = [TIHDate dateFromString:standard Format:formatType];
    NSString* dateString = [TIHDate dateStringFromDate:thisDate withFormat:returnFormatType];
    return dateString;
    
}

+(int) hourOfDayForDate:(NSDate*)thisDate
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *todayComps = [gregorian components:NSCalendarUnitHour fromDate:thisDate];
    return todayComps.hour;

}

+(NSNumber*)dateNumberForDate:(NSDate*)thisDate // used for easy sorting
{
    NSInteger seconds = [thisDate timeIntervalSince1970];
    NSNumber* number = [NSNumber numberWithInteger:seconds];
    return number;

}

+(NSDate*) dateTomorrowAtMidnightFromDate:(NSDate*)thisDate
{
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:thisDate];
    components.day++;
	NSDate *tomorrowAtMidnight = [gregorian dateFromComponents:components];
    return tomorrowAtMidnight;
}

+(NSDate*) dateYesterdayAtMidnightFromDate:(NSDate*)thisDate
{
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components = [gregorian components:unitFlags fromDate:thisDate];
    components.day--;
	NSDate *yesterdayAtMidnight = [gregorian dateFromComponents:components];
    return yesterdayAtMidnight;
}

+(NSDate*) dateFromComponentsMonth:(NSInteger)month day:(NSInteger)day year:(NSUInteger)year
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    comps.year = year;
    comps.day = day;
    comps.month = month;
    NSDate *date = [gregorian dateFromComponents:comps];
    return date;
}

+(BOOL)dateMoreThanAWeekOld:(NSDate*)date
{
    NSDate* date1 = [date dateByAddingTimeInterval:60*60*24*7];
    if ([date1 compare:[NSDate date]] == NSOrderedDescending) {
        return NO;
    }
    return YES;
}
//-(NSDate *) toLocalTime
//{
//    NSTimeZone *tz = [NSTimeZone localTimeZone];
//    NSInteger seconds = [tz secondsFromGMTForDate: self];
//    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
//}
// 
//-(NSDate *) toGlobalTime
//{
//    NSTimeZone *tz = [NSTimeZone localTimeZone];
//    NSInteger seconds = -[tz secondsFromGMTForDate: self];
//    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
//}

@end
