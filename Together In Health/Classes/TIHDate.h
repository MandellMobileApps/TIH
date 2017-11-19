//
//  MGDate.h
//  Traveler1
//
//  Created by Jon Mandell on 5/28/13.
//  Copyright (c) 2013 Jon Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>

enum DateFormat {
	DateFormatMediumDateMediumTime = 0,
	DateFormatMediumDateNoTime = 1,
	DateFormatNoDateMediumTime = 2,
    DateFormatShortDateShortTime = 4,
    DateFormatMediumDateLongTime = 5,
    DateFormatNoDateShortTime = 6,
    DateFormatShortDateNoTime = 7,
    DateFormatLongDateNoTime = 8,
    DateFormatCustom1 = 11,
    DateFormatCustom2 = 12,
    DateFormatCustom3 = 13,
    DateFormatCustom4 = 14,
    DateFormatCustom5 = 15,
    DateFormatCustom6 = 16,
    DateFormatCustom7 = 17,
    DateFormatCustom8 = 18,
    DateFormatCustom9 = 19,
    DateFormatCustom10 = 20,
    DateFormatCustom11 = 21,
    DateFormatCustom12 = 22,
    DateFormatCustom13 = 23,
};

#define DateFormatCustom1String @"MM/dd/yyyy"                           // (06/07/2013)
#define DateFormatCustom2String @"M/d/yyyy h:mm:ss a"                   // (6/7/2013 6:18:57 PM)
#define DateFormatCustom3String @"MM/dd/yyyy hh:mm:ss a"                // (06/07/2013 06:18:57 PM)
#define DateFormatCustom4String @""                                     //
#define DateFormatCustom5String @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZ"  //
#define DateFormatCustom6String @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZ"      //
#define DateFormatCustom7String @"yyyy-MM-dd'T'HH:mm"                   // 2014-09-29T11:30:00 for Ticket Custom Fields
#define DateFormatCustom8String @"yyyy-MM-dd'T'HH:mm:ss"                // 2014-05-09T17:15:22.02  for agent procedure initiate
#define DateFormatCustom9String @"E MM/dd"                              //  used on calendar grid
#define DateFormatCustom10String @"yyyy-MM-dd H:mm"                     // used on get group counter logs cpu/mem/disk
#define DateFormatCustom11String @"yyyy-MM-dd'T'HH:mm:ss.SS'+'HH:mm"
#define DateFormatCustom12String @"MM_dd_yyyy_HH_mm_ss"                // (6/7/2013 06:18:57 PM)
#define DateFormatCustom13String @"MM/dd"                              //  used on route control


//   2014-09-13T21:37:14.93+00:00
@interface TIHDate : NSDate


#pragma mark Date Strings
+(NSString*) dateStringfromEpoch:(NSString*)epoch withFormat:(int)formatType;
+(NSString*) dateStringFromDate:(NSDate*)thisDate withFormat:(int)formatType;
+(NSString*) dateStringfromEpoch:(NSString*)epoch withFormat:(int)formatType adjustedBy:(double)timeInterval;
+(NSString*) dateStringFromDate:(NSDate*)thisDate withFormat:(int)formatType adjustedBy:(double)timeInterval;
+(NSString*) dateStringFromString:(NSString*)dateString fromFormat:(int)fromFormatType toFormat:(int)toFormatType;
+(NSString*) dateStringFirstOfMonthWithFormat:(int)formatType;
+(NSString*) dateStringFirstOfLastMonthWithFormat:(int)formatType;
#pragma mark Dates

+(NSDate*) dateFromString:(NSString*)dateString Format:(int)formatType;
+(NSDate*) datefromEpoch:(NSString*)epoch;

#pragma mark Epochs

+(NSString*) epochStringFromDate:(NSDate*)thisDate;
+(NSString*) epochStringFromDate:(NSDate*)thisDate adjustedBy:(double)timeInterval;
+(double) epochDoubleFromDateString:(NSString*)dateString Format:(int)formatType;
+(double) epochDoubleFromDate:(NSDate*)epoch adjustedBy:(double)timeInterval;

#pragma mark Convenience Methods

+(double) doubleEpochAtMidnightTwoWeeksAgo;
+(NSString*) epochAtMidnightOneWeekAgo;
+(NSString*) epochAtMidnightFromEpoch:(NSString*)thisDateString;
+(NSDate*) dateAtMidnightFromEpoch:(NSString*)thisDateString;
+(NSDate*) dateAtMidnightFromDate:(NSDate*)thisDate;
+(NSInteger) currentHour;
+(double) epochAtMidnightFromDate:(NSDate*)thisDate;
+(double) epoch24HoursAgo;
+(double) epoch1MinuteAgo;
+(double) epoch1Hour1Ago;
+(NSString*) stringEpochSundayFromDate:(NSDate*)thisDate;
+(NSString*) stringDurationFromDouble:(double)timeInterval;
+(NSString*) dateTimeMediumFormatForStandardFormat:(NSString*)standard;  // used for AgentProcedures since date format can vary
+(NSString*) dateStringWithoutSecondsDecimal:(NSString*)standard withFormat:(int)formatType returnFormat:(int)returnFormatType;  // used for AgentProcedures since date format can vary
+(int) hourOfDayForDate:(NSDate*)thisDate;
+(NSNumber*)dateNumberForDate:(NSDate*)thisDate;

+(NSDate*) dateTomorrowAtMidnightFromDate:(NSDate*)thisDate;
+(NSDate*) dateYesterdayAtMidnightFromDate:(NSDate*)thisDate;

+(NSDate*) dateFromComponentsMonth:(NSInteger)month day:(NSInteger)day year:(NSUInteger)year;
+(NSString*)dayOfWeekString:(NSInteger)dayOfWeek;
+(NSString*) dayOfWeekStringFromDate:(NSDate*)date;
@end
