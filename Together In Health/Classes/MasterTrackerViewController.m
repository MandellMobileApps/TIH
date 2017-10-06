//
//  MasterTrackerViewController.m
//  Together In Health
//
//  Created by Jon Mandell on 10/4/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "MasterTrackerViewController.h"
#import "TIHDate.h"
#import "AppDelegate.h"
#import "Day.h"

enum trackerIndex {
    FoodIndex = 0,
    StressIndex = 1,
    SleepIndex = 2,
    ActivityIndex = 3,
    DrinkIndex = 4,
    
};


@interface MasterTrackerViewController ()

@end

@implementation MasterTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.trackerIndex =  [[NSUserDefaults standardUserDefaults] integerForKey:@"trackerIndex"];
    
    [self food:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(CGRect)baseRect
{
        CGRect baseRect = self.view.bounds;
        NSInteger menuHeight = 77;
        baseRect.origin.y = menuHeight;
        baseRect.size.height = self.view.frame.size.height-menuHeight;
        return baseRect;

}
-(IBAction)food:(UIButton*)sender
{

    if (!self.foodTrackerViewController)
    {
        self.foodTrackerViewController = (FoodTrackerViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
        instantiateViewControllerWithIdentifier:@"FoodTrackerViewController"];
    

        self.foodTrackerViewController.view.frame = [self baseRect];

        self.foodTrackerViewController.masterTrackerViewController = self;

        [self addChildViewController:self.foodTrackerViewController];
        [self.view addSubview:self.foodTrackerViewController.view];
        [self.foodTrackerViewController didMoveToParentViewController:self];
        self.title = @"Food Tracker";
        
        [self unloadOtherViewControllersExceptIndex:FoodIndex];
    }
        
}


-(IBAction)sleep:(UIButton*)sender
{

    if (!self.sleepTrackerViewController)
    {
        self.sleepTrackerViewController = (SleepTrackerViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
        instantiateViewControllerWithIdentifier:@"SleepTrackerViewController"];
    

        self.sleepTrackerViewController.view.frame = [self baseRect];

        self.sleepTrackerViewController.masterTrackerViewController = self;

        [self addChildViewController:self.sleepTrackerViewController];
        [self.view addSubview:self.sleepTrackerViewController.view];
        [self.sleepTrackerViewController didMoveToParentViewController:self];
        self.title = @"Sleep Tracker";
        
        [self unloadOtherViewControllersExceptIndex:SleepIndex];
    }
        
}


-(IBAction)stress:(UIButton*)sender
{

    if (!self.stressTrackerViewController)
    {
        self.stressTrackerViewController = (StressTrackerViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
        instantiateViewControllerWithIdentifier:@"StressTrackerViewController"];
    

        self.stressTrackerViewController.view.frame = [self baseRect];

        self.stressTrackerViewController.masterTrackerViewController = self;

        [self addChildViewController:self.stressTrackerViewController];
        [self.view addSubview:self.stressTrackerViewController.view];
        [self.stressTrackerViewController didMoveToParentViewController:self];
        self.title = @"Stress Tracker";
        
        [self unloadOtherViewControllersExceptIndex:StressIndex];
    }
        
}
-(IBAction)activity:(UIButton*)sender
{

    if (!self.activityTrackerViewController)
    {
        self.activityTrackerViewController = (ActivityTrackerViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
        instantiateViewControllerWithIdentifier:@"ActivityTrackerViewController"];
    

        self.activityTrackerViewController.view.frame = [self baseRect];

        self.activityTrackerViewController.masterTrackerViewController = self;

        [self addChildViewController:self.activityTrackerViewController];
        [self.view addSubview:self.activityTrackerViewController.view];
        [self.activityTrackerViewController didMoveToParentViewController:self];
        self.title = @"Activity Tracker";
        
        [self unloadOtherViewControllersExceptIndex:ActivityIndex];
    }
        
}

-(IBAction)drink:(UIButton*)sender
{

    if (!self.drinkTrackerViewController)
    {
        self.drinkTrackerViewController = (DrinkTrackerViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
        instantiateViewControllerWithIdentifier:@"DrinkTrackerViewController"];
    

        self.drinkTrackerViewController.view.frame = [self baseRect];

        self.drinkTrackerViewController.masterTrackerViewController = self;

        [self addChildViewController:self.drinkTrackerViewController];
        [self.view addSubview:self.drinkTrackerViewController.view];
        [self.drinkTrackerViewController didMoveToParentViewController:self];
        self.title = @"Drink Tracker";
        
        [self unloadOtherViewControllersExceptIndex:DrinkIndex];
    }
        
}

-(void) unloadOtherViewControllersExceptIndex:(NSInteger)trackerIndex
{

        if (self.foodTrackerViewController)
        {
            if (trackerIndex != FoodIndex)
            {
                [self.foodTrackerViewController willMoveToParentViewController:nil];
                [self.foodTrackerViewController.view removeFromSuperview];
                [self.foodTrackerViewController removeFromParentViewController];
                self.foodTrackerViewController = nil;
            }
        }
    
        if (self.sleepTrackerViewController)
        {
            if (trackerIndex != SleepIndex)
            {
                [self.sleepTrackerViewController willMoveToParentViewController:nil];
                [self.sleepTrackerViewController.view removeFromSuperview];
                [self.sleepTrackerViewController removeFromParentViewController];
                self.sleepTrackerViewController = nil;
            }
        }
    
        if (self.stressTrackerViewController)
        {
            if (trackerIndex != StressIndex)
            {
                [self.stressTrackerViewController willMoveToParentViewController:nil];
                [self.stressTrackerViewController.view removeFromSuperview];
                [self.stressTrackerViewController removeFromParentViewController];
                self.stressTrackerViewController = nil;
            }
        }
    
        if (self.drinkTrackerViewController)
        {
            if (trackerIndex != DrinkIndex)
            {
                [self.drinkTrackerViewController willMoveToParentViewController:nil];
                [self.drinkTrackerViewController.view removeFromSuperview];
                [self.drinkTrackerViewController removeFromParentViewController];
                self.drinkTrackerViewController = nil;
            }
        }
    
        if (self.activityTrackerViewController)
        {
            if (trackerIndex != ActivityIndex)
            {
                [self.activityTrackerViewController willMoveToParentViewController:nil];
                [self.activityTrackerViewController.view removeFromSuperview];
                [self.activityTrackerViewController removeFromParentViewController];
                self.activityTrackerViewController = nil;
            }
        }
}


-(IBAction)backDay:(id)sender {

    self.appDelegate.day = [self.appDelegate dayForDate:[TIHDate dateYesterdayAtMidnightFromDate:self.appDelegate.day.date]];
    
    [self resetDay];
    
    
    
}

-(IBAction)forwardDay:(id)sender{
    
    self.appDelegate.day = [self.appDelegate dayForDate:[TIHDate dateTomorrowAtMidnightFromDate:self.appDelegate.day.date]];

    [self resetDay];
    
}

-(IBAction)changeDay:(id)sender {
    self.datePickerViewContainer.hidden = NO;

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

-(void) resetDay
{
        self.dayLabel.text = [TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime];
        if (self.foodTrackerViewController)
        {
            [self.foodTrackerViewController resetDay];
        }
    
        if (self.sleepTrackerViewController)
        {
            [self.sleepTrackerViewController resetDay];
        }
    
        if (self.stressTrackerViewController)
        {
            [self.stressTrackerViewController resetDay];
        }
    
        if (self.drinkTrackerViewController)
        {
            [self.drinkTrackerViewController resetDay];
        }
    
        if (self.activityTrackerViewController)
        {
            [self.activityTrackerViewController resetDay];
        }
}

@end
