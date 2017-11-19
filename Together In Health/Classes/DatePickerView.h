//
//  DatePickerView.h
//  Together In Health
//
//  Created by Jon Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDatePickerViewEx.h"

@protocol DatePickerViewDelegate;

@interface DatePickerView : UIView
{
    id<DatePickerViewDelegate> datePickerViewDelegate;
}
@property(atomic, strong)id datePickerViewDelegate;
@property (nonatomic, strong)  UIButton *doneButton;
@property (nonatomic, strong)  UIButton *todayButton;
@property (nonatomic, strong)  NSDate *date;
@property (nonatomic, strong)  UIDatePicker *datePicker;
@property (nonatomic, strong)  CDatePickerViewEx *picker;
@property (nonatomic) CGRect hideRect;
@property (nonatomic) CGRect showRect;
@property (nonatomic) BOOL dateDidChange;

+(DatePickerView*)initializeWithSelfBounds:(CGRect)bounds andDate:(NSDate*)thisDate;
-(void)showDatePicker;
-(void) hideDatePicker;
@end

@protocol DatePickerViewDelegate <NSObject>
    @required
        -(void) datePickerViewChanged:(DatePickerView *)thisDatePickerView;
@end
