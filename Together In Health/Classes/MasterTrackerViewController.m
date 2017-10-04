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

@interface MasterTrackerViewController ()

@end

@implementation MasterTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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


-(IBAction)food:(id)sender {
    FoodTrackerViewController* foodTrackerViewController = (FoodTrackerViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"FoodTrackerViewController"];
    foodTrackerViewController.navigationItem.hidesBackButton = YES;
    [self addChildViewController:foodTrackerViewController];
}

-(IBAction)sleep:(id)sender {
    SleepTrackerViewController* sleepTrackerViewController = (SleepTrackerViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"SleepTrackerViewController"];
    sleepTrackerViewController.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:sleepTrackerViewController animated:NO];
}

-(IBAction)activity:(id)sender {
    ActivityTrackerViewController* activityTrackerViewController = (ActivityTrackerViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ActivityTrackerViewController"];
    activityTrackerViewController.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:activityTrackerViewController animated:NO];
}

-(IBAction)drink:(id)sender {
    DrinkTrackerViewController* drinkTrackerViewController = (DrinkTrackerViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"DrinkTrackerViewController"];
      drinkTrackerViewController.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:drinkTrackerViewController animated:NO];
}

-(void)resetDay {
    if (self.foodTrackerViewController)
    {
        [self.foodTrackerViewController resetDay];
    }
    if (self.sleepTrackerViewController)
    {
        [self.sleepTrackerViewController resetDay];
    }
    if (self.activityTrackerViewController)
    {
        [self.activityTrackerViewController resetDay];
    }
    if (self.drinkTrackerViewController)
    {
        [self.drinkTrackerViewController resetDay];
    }
    
    if ([self.appDelegate.day.date compare:[TIHDate dateAtMidnightFromDate:[NSDate date]]] == NSOrderedSame) {
        self.dayLabel.text = @"Today";
    }
    
    else {
        
        self.dayLabel.text = [TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime];
    }
        

    
}
@end
