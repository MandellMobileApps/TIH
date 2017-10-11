//
//  DatePickerView.h
//  Together In Health
//
//  Created by Jon Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerView : UIView

@property (nonatomic, strong)  UIButton *doneButton;
@property (nonatomic, strong)  UIButton *todayButton;
@property (nonatomic, strong)  NSDate *date;
@property (nonatomic, strong)  UIDatePicker *datePicker;
+(DatePickerView*)initializeWithSelfBounds:(CGRect)bounds andDate:(NSDate*)thisDate;
-(void)showDatePicker;

@end
