//
//  DatePickerView.m
//  Together In Health
//
//  Created by Jon Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "DatePickerView.h"

@implementation DatePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(DatePickerView*)initializeWithSelfBounds:(CGRect)bounds andDate:(NSDate*)thisDate
{
    CGRect	hideRect = CGRectMake(0,bounds.size.height, bounds.size.height, 250);
    DatePickerView* thisView = [[DatePickerView alloc]initWithFrame:hideRect];
    
    self.datePicker = [[UIDatePicker alloc]initWithFrame:hideRect];
    self.datePicker.date = thisDate;
    [self addSubview:self.datePicker];
    
    CGRect doneButtonRect = CGRectMake(20,20, 40, 80);
    self.doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.doneButton.frame = doneButtonRect;
    [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [self addSubview:self.doneButton];

    CGRect todayButtonRect = CGRectMake(self.frame.size.width-100,20, 40, 80);
    self.todayButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.todayButton.frame = todayButtonRect;
    [self.todayButton setTitle:@"Today" forState:UIControlStateNormal];
    [self addSubview:self.todayButton];
    
    
    
    return thisView;
}
-(void)showDatePicker
{
    CGRect  showRect = CGRectMake(0,self.bounds.size.height-250, self.bounds.size.width, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.frame = showRect;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void) hideDatePicker
{
    
    CGRect	hideRect = CGRectMake(0,self.bounds.size.height, 320, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.frame = hideRect;
                         
                     }
                     completion:^(BOOL finished){
                        [self removeFromSuperview];
                     }];
    
    
    
}
@end
