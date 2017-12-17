//
//  DatePickerView.m
//  Together In Health
//
//  Created by Jon Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "DatePickerView.h"

@implementation DatePickerView

@synthesize datePickerViewDelegate = _datePickerViewDelegate;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(DatePickerView*)initializeWithSelfBounds:(CGRect)bounds andDate:(NSDate*)thisDate
{

    DatePickerView* thisView = [[DatePickerView alloc]init];
    thisView.hideRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height, 320, 230);
    thisView.showRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height-250, 320, 230);
    [thisView setFrame:thisView.hideRect];
    thisView.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];

    thisView.dateDidChange = NO;
    
    CGRect datePickerFrame = CGRectMake(20, 40, 280, 160);
    thisView.datePicker = [[UIDatePicker alloc]initWithFrame:datePickerFrame];
    thisView.datePicker.datePickerMode = UIDatePickerModeDate;
    [thisView.datePicker addTarget:thisView action:@selector(datePickerDidChange) forControlEvents:UIControlEventValueChanged];

    thisView.datePicker.date = thisDate;
    [thisView addSubview:thisView.datePicker];

    CGRect cancelButtonRect = CGRectMake(0,0, 80, 40);
    thisView.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    thisView.cancelButton.frame = cancelButtonRect;
    [thisView.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [thisView.cancelButton addTarget:thisView action:@selector(cancelButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [thisView addSubview:thisView.cancelButton];
    
    CGRect doneButtonRect = CGRectMake(thisView.frame.size.width-80,0, 80, 40);
    thisView.doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    thisView.doneButton.frame = doneButtonRect;
    [thisView.doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [thisView.doneButton addTarget:thisView action:@selector(doneButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [thisView addSubview:thisView.doneButton];
    
    CGRect todayButtonRect = CGRectMake((thisView.frame.size.width-80)/2,0, 80, 40);
    thisView.todayButton = [UIButton buttonWithType:UIButtonTypeSystem];
    thisView.todayButton.frame = todayButtonRect;
    [thisView.todayButton setTitle:@"Today" forState:UIControlStateNormal];
    [thisView.todayButton addTarget:thisView action:@selector(gotoToday) forControlEvents:UIControlEventTouchUpInside];
    [thisView addSubview:thisView.todayButton];
    
    
    
    return thisView;
}
-(void)showDatePicker
{


    [UIView animateWithDuration:0.2
                     animations:^{
                         self.frame = self.showRect;
                     }
                     completion:^(BOOL finished){
                         
                     }];

}

-(void) hideDatePicker
{
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.frame = self.hideRect;
                         
                     }
                     completion:^(BOOL finished){
                        [self removeFromSuperview];
                     }];
    
    
    
}

-(void)gotoToday
{
    self.datePicker.date = [NSDate date];
    [self datePickerDidChange];
}

-(void) datePickerDidChange
{
    self.dateDidChange = YES;
}
-(void) doneButtonTapped
{
    if (self.dateDidChange)
    {
        if (self.datePickerViewDelegate)
        {
            if ([self.datePickerViewDelegate respondsToSelector:@selector(datePickerViewChanged:)])
            {
                [self.datePickerViewDelegate datePickerViewChanged:self];
            }
        }
    }
    [self hideDatePicker];
}
-(void) cancelButtonTapped
{
    [self hideDatePicker];
}
@end
