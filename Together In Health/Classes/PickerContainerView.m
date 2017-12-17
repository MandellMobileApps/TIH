//
//  DatePickerView.m
//  Together In Health
//
//  Created by Jon Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "PickerContainerView.h"

@implementation PickerContainerView

@synthesize pickerContainerViewDelegate = _pickerContainerViewDelegate;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(PickerContainerView*)initializeWithSelfBounds:(CGRect)bounds andMonth:(NSInteger)month andYear:(NSInteger)year
{

    PickerContainerView* thisView = [[PickerContainerView alloc]init];
    thisView.hideRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height, 320, 250);
    thisView.showRect = CGRectMake((bounds.size.width - 320)/2, bounds.size.height-250, 320, 250);
    [thisView setFrame:thisView.hideRect];
    thisView.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];
    
    thisView.pickerDidChangeBool = NO;
    [thisView loadMonths];
    [thisView loadYears];
    CGRect pickerFrame = CGRectMake(20, 70, 280, 160);
    
    thisView.pickerView = [[UIPickerView alloc]initWithFrame:pickerFrame];
    thisView.pickerView.delegate = thisView;
    thisView.month = month-1;
    thisView.year = year;
    [thisView addSubview:thisView.pickerView];

    
//    CGRect doneButtonRect = CGRectMake(20,20, 80, 40);
//    thisView.doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    thisView.doneButton.frame = doneButtonRect;
//    [thisView.doneButton setTitle:@"Done" forState:UIControlStateNormal];
//    [thisView.doneButton addTarget:thisView action:@selector(doneButtonTapped) forControlEvents:UIControlEventTouchUpInside];
//    [thisView addSubview:thisView.doneButton];
//
//    CGRect todayButtonRect = CGRectMake(thisView.frame.size.width-100,20, 80, 40);
//    thisView.todayButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    thisView.todayButton.frame = todayButtonRect;
//    [thisView.todayButton setTitle:@"Today" forState:UIControlStateNormal];
//    [thisView.todayButton addTarget:thisView action:@selector(gotoToday) forControlEvents:UIControlEventTouchUpInside];
//    [thisView addSubview:thisView.todayButton];
    
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
-(void)showPicker
{

      [self.pickerView selectRow:self.month inComponent:0 animated:NO];
    [self.pickerView selectRow:self.year inComponent:1 animated:NO];
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.frame = self.showRect;
                     }
                     completion:^(BOOL finished){

                     }];

}

-(void) hidePicker
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
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:[NSDate date]];
    self.year = [comps year];
    self.month = [comps month]-1;
    [self.pickerView selectRow:self.month inComponent:0 animated:YES];
    [self.pickerView selectRow:self.year inComponent:1 animated:YES];
    self.pickerDidChangeBool = YES;
}

-(void) pickerDidChange
{
    self.pickerDidChangeBool = YES;
}
-(void) doneButtonTapped
{
    if (self.pickerDidChangeBool)
    {
        if (self.pickerContainerViewDelegate)
        {
            if ([self.pickerContainerViewDelegate respondsToSelector:@selector(pickerViewChanged:)])
            {
                [self.pickerContainerViewDelegate pickerViewChanged:self];
            }
        }
    }
    [self hidePicker];
}

-(void) cancelButtonTapped
{
    [self hidePicker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if (component == 0)
    {
        return self.months.count;
    }
    return self.years.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;
{
    return 33;
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
//{
//
//}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if (component == 0)
    {
        return [self.months objectAtIndex:row];
    }
    return [self.years objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.pickerDidChangeBool = YES;
    if (component == 0)
    {
        self.month = row;
    }
    else if (component == 1)
    {
        self.year = row;
    
    }
}


-(void)loadMonths
{
    self.months = [NSArray arrayWithObjects:
    @"January",
    @"February",
    @"March",
    @"April",
    @"May",
    @"June",
    @"July",
    @"August",
    @"September",
    @"October",
    @"November",
    @"December",
    nil];
}

-(void)loadYears
{
    self.years = [NSMutableArray array];
    
    for (NSInteger y =0;y<2500;y++)
    {
        [self.years addObject:[NSString stringWithFormat:@"%lu",y]];
    }
}

@end
