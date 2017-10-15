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

+(DatePickerView*)initializeWithSelfBounds:(CGRect)bounds andDate:(NSDate*)thisDate
{

    DatePickerView* thisView = [[DatePickerView alloc]init];
    thisView.hideRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height, 320, 250);
    thisView.showRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height-250, 320, 250);
    [thisView setFrame:thisView.hideRect];
    thisView.backgroundColor = [UIColor yellowColor];
    CGRect datePickerFrame = CGRectMake((bounds.size.width - 320)/2, bounds.size.height-250, 320, 250);
    thisView.datePicker = [[UIDatePicker alloc]initWithFrame:datePickerFrame];
    thisView.datePicker.date = thisDate;
    [thisView addSubview:thisView.datePicker];

    
    CGRect doneButtonRect = CGRectMake(20,20, 40, 80);
    thisView.doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    thisView.doneButton.frame = doneButtonRect;
    [thisView.doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [thisView addSubview:thisView.doneButton];

    CGRect todayButtonRect = CGRectMake(thisView.frame.size.width-100,20, 40, 80);
    thisView.todayButton = [UIButton buttonWithType:UIButtonTypeSystem];
    thisView.todayButton.frame = todayButtonRect;
    [thisView.todayButton setTitle:@"Today" forState:UIControlStateNormal];
    [thisView addSubview:thisView.todayButton];
    
    
    
    return thisView;
}
-(void)showDatePicker
{

    CGRect  showRect = CGRectMake(self.x,self.bounds.size.height-250, 320, 250);
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
