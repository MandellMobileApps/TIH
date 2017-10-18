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
    thisView.hideRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height, 320, 250);
    thisView.showRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height-250, 320, 250);
    [thisView setFrame:thisView.hideRect];
    thisView.backgroundColor = [UIColor lightGrayColor];
    
    thisView.dateDidChange = NO;
    
    CGRect datePickerFrame = CGRectMake(20, 70, 280, 160);
    thisView.datePicker = [[UIDatePicker alloc]initWithFrame:datePickerFrame];
    thisView.datePicker.datePickerMode = UIDatePickerModeDate;
    [thisView.datePicker addTarget:thisView action:@selector(datePickerDidChange) forControlEvents:UIControlEventValueChanged];

    thisView.datePicker.date = [NSDate date];
    [thisView addSubview:thisView.datePicker];

    
    CGRect doneButtonRect = CGRectMake(20,20, 80, 40);
    thisView.doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    thisView.doneButton.frame = doneButtonRect;
    [thisView.doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [thisView.doneButton addTarget:thisView action:@selector(doneButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [thisView addSubview:thisView.doneButton];

    CGRect todayButtonRect = CGRectMake(thisView.frame.size.width-100,20, 80, 40);
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
@end
