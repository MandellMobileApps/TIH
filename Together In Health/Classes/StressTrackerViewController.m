//
//  StressTrackerViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/27/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "StressTrackerViewController.h"
#import "Stress.h"
#import "FoodTrackerViewController.h"
#import "SleepTrackerViewController.h"
#import "DrinkTrackerViewController.h"
#import "ActivityTrackerViewController.h"
#import "Day.h"
#import "AppDelegate.h"
#import "TIHDate.h"
#import "MasterTrackerViewController.h"

@implementation StressTrackerViewController


-(void)viewDidLoad {
    
    self.navigationItem.backBarButtonItem = nil;
    [super viewDidLoad];
    
    self.thisScrollView.contentSize = CGSizeMake(320, 640);
    
    [self resetDay];
    
    CGRect hideRect = CGRectMake(0,self.view.bounds.size.height, self.view.bounds.size.width, 0);
    self.pickerViewContainer.frame = hideRect;
    self.pickerViewContainer.hidden = YES;
    
    
    // self.freeMenuView.hidden = YES;
    //self.paidMenuView.hidden = YES;
    //self.freeMenuView.hidden = NO;
    
    self.navigationItem.hidesBackButton = YES;

    //    self.navigationController.navigationBar.backgroundColor= [UIColor blackColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    
    
    self.datePickerViewContainer.hidden = YES;
    self.datePickerViewContainer.frame = hideRect;

    
    [self resetDay];
    
//    if (self.appDelegate.day.stressRating) {
//        self.stressSegmentControl.selectedSegmentIndex = self.appDelegate.day.stressRating-1;
//    }
//    else {
//        self.stressSegmentControl.selectedSegmentIndex = self.appDelegate.day.stressRating-1;
//    }
//    self.stressSegmentControl.selectedSegmentIndex = self.appDelegate.day.stressRating;
//    self.energySegmentControl.selectedSegmentIndex = self.appDelegate.day.energyRating;
//    self.moodSegmentControl.selectedSegmentIndex = self.appDelegate.day.moodRating;
//    self.concentrationSegmentControl.selectedSegmentIndex = self.appDelegate.day.concentrationRating;
//    self.copingSegmentControl.selectedSegmentIndex = self.appDelegate.day.copingRating;
    
}

-(void)resetDay {

    self.stressSegmentControl.selectedSegmentIndex = self.appDelegate.day.stressRating-1;
    self.energySegmentControl.selectedSegmentIndex = self.appDelegate.day.energyRating-1;
    self.moodSegmentControl.selectedSegmentIndex = self.appDelegate.day.moodRating-1;
    self.concentrationSegmentControl.selectedSegmentIndex = self.appDelegate.day.concentrationRating-1;
    self.copingSegmentControl.selectedSegmentIndex = self.appDelegate.day.copingRating-1;

    }


- (IBAction)stress:(UISegmentedControl* )sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.appDelegate.day.stressRating = 1;
            break;
        case 1:
            self.appDelegate.day.stressRating = 2;
            break;
        case 2:
            self.appDelegate.day.stressRating = 3;
            break;
        case 3:
            self.appDelegate.day.stressRating = 4;
            break;
        case 4:
            self.appDelegate.day.stressRating = 5;
            break;
        default:
            break;
    }


}

- (IBAction)energy:(UISegmentedControl* )sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.appDelegate.day.energyRating = 1;
            break;
        case 1:
            self.appDelegate.day.energyRating = 2;
            break;
        case 2:
            self.appDelegate.day.energyRating = 3;
            break;
        case 3:
            self.appDelegate.day.energyRating = 4;
            break;
        case 4:
            self.appDelegate.day.energyRating = 5;
            break;
        default:
            break;
    }
}

- (IBAction)mood:(UISegmentedControl* )sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.appDelegate.day.moodRating = 1;
            break;
        case 1:
            self.appDelegate.day.moodRating = 2;
            break;
        case 2:
            self.appDelegate.day.moodRating = 3;
            break;
        case 3:
            self.appDelegate.day.moodRating = 4;
            break;
        case 4:
            self.appDelegate.day.moodRating = 5;
            break;
        default:
            break;
    }
}

- (IBAction)concentration:(UISegmentedControl* )sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.appDelegate.day.concentrationRating = 1;
            break;
        case 1:
            self.appDelegate.day.concentrationRating = 2;
            break;
        default:
            break;
    }
}

- (IBAction)coping:(UISegmentedControl* )sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.appDelegate.day.copingRating = 1;
            break;
        case 1:
            self.appDelegate.day.copingRating = 2;
            break;
        default:
            break;
    }
}

-(IBAction)resetStress:(id)sender {
    self.appDelegate.day.stressRating = -1;
    self.stressSegmentControl.selectedSegmentIndex = -1;
}

-(IBAction)resetEnergy:(id)sender {
    self.appDelegate.day.energyRating = -1;
        self.energySegmentControl.selectedSegmentIndex = -1;
}

-(IBAction)resetConcentraton:(id)sender {
    self.appDelegate.day.concentrationRating = -1;
        self.concentrationSegmentControl.selectedSegmentIndex = -1;
}

-(IBAction)resetMood:(id)sender {
    self.appDelegate.day.moodRating = -1;
     self.moodSegmentControl.selectedSegmentIndex = -1;
}

-(IBAction)resetCoping:(id)sender {
    self.appDelegate.day.copingRating = -1;
    self.copingSegmentControl.selectedSegmentIndex = -1;
    
    }





#pragma Change Day



-(IBAction)changeDay:(id)sender {
    self.datePickerViewContainer.hidden = NO;
    self.pickerViewContainer.hidden = YES;
    [self showDatePicker];
}


#pragma Date Picker delegates

-(IBAction)datePickerValueChanged:(UIDatePicker*)sender {
    
    self.datePickerDate = sender.date;
}

-(IBAction)datePickerDoneButtonTapped:(id)sender {
    
    self.appDelegate.day = [self.appDelegate dayForDate:self.datePickerDate];
    [self resetDay];
    [self hideDatePicker];
    
}

-(IBAction)datePickerTodayButtonTapped:(id)sender {
    
    self.datePickerDate = [NSDate date];
    [self.datePickerView setDate:self.datePickerDate animated:YES];
    
    
}

-(void) showDatePicker
{
    CGRect	hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 250);
    self.datePickerViewContainer.frame = hideRect;
    self.datePickerViewContainer.hidden = NO;
    [self.datePickerView setDate:self.appDelegate.day.date animated:NO];
    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.datePickerViewContainer.frame = showRect;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void) hideDatePicker
{
    
    CGRect	hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.datePickerViewContainer.frame = hideRect;
                         
                     }
                     completion:^(BOOL finished){
                         self.datePickerViewContainer.hidden = YES;
                     }];
    
    
    
}



@end
