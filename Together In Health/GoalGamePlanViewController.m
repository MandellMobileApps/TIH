//
//  GoalGamePlanViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/13/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "GoalGamePlanViewController.h"
#import "AppDelegate.h"


enum gamePlanIndex {
    Plan1Index = 0,
    Plan2Index = 1,
    Plan3Index = 2,
    
    
};


@interface GoalGamePlanViewController ()

@end

@implementation GoalGamePlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.appDelegate.goalGamePlanViewController = self;
    
    self.gamePlanIndex =  [[NSUserDefaults standardUserDefaults] integerForKey:@"gamePlanIndex"];
    
    [self goal1:nil];
    [self updateMenuButtons];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
    
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
-(void)updateMenuButtons
{
    // clear buttons
    self.goalGP1Button.enabled = YES;
    self.goalGP2Button.enabled = YES;
    self.goalGP3Button.enabled = YES;
    
    
    self.goalGP1Button.backgroundColor = [UIColor whiteColor];
    [self.goalGP1Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.goalGP2Button.backgroundColor = [UIColor whiteColor];
    [self.goalGP2Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.goalGP3Button.backgroundColor = [UIColor whiteColor];
    [self.goalGP3Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // update selected button
    switch (self.gamePlanIndex) {
        case Plan1Index:
            self.goalGP1Button.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
            [self.goalGP1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.goalGP1Button.enabled = NO;
            break;
        case Plan2Index:
            self.goalGP2Button.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
            [self.goalGP2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.goalGP2Button.enabled = NO;
            break;
        case Plan3Index:
            self.goalGP3Button.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
            [self.goalGP3Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.goalGP3Button.enabled = NO;
            break;
            
        default:
            break;
    }
    
    
    
}

-(CGRect)baseRect
{
    CGRect baseRect = self.view.bounds;
    NSInteger menuHeight = 170;
    baseRect.origin.y = menuHeight;
    baseRect.size.height = self.view.frame.size.height-menuHeight;
    return baseRect;
    
}
-(IBAction)goal1:(UIButton*)sender
{
    
    if (!self.goalGP1ViewController)
    {
        self.goalGP1ViewController = (GoalGP1ViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"GoalGP1ViewController"];
        self.goalGP1ViewController.view.frame = [self baseRect];
        self.goalGP1ViewController.goalGamePlanViewController = self;
    }
    
    
    
    
    
    [self addChildViewController:self.goalGP1ViewController];
    [self.view addSubview:self.goalGP1ViewController.view];
    [self.goalGP1ViewController didMoveToParentViewController:self];
    self.title = @"Game Plan 1";
    self.gamePlanIndex = Plan1Index;
    [self updateMenuButtons];
    //     [self unloadOtherViewControllersExceptIndex:FoodIndex];
    
    
}


-(IBAction)goal2:(UIButton*)sender
{
    
    if (!self.goalGP2ViewController)
    {
        self.goalGP2ViewController = (GoalGP2ViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"GoalGP2ViewController"];
    }
    
    self.goalGP2ViewController.view.frame = [self baseRect];
    
    self.goalGP2ViewController.goalGamePlanViewController = self;
    
    [self addChildViewController:self.goalGP2ViewController];
    [self.view addSubview:self.goalGP2ViewController.view];
    [self.goalGP2ViewController didMoveToParentViewController:self];
    self.title = @"Game Plan 2";
    self.gamePlanIndex = Plan2Index;
    [self updateMenuButtons];
    
    //   [self unloadOtherViewControllersExceptIndex:SleepIndex];
    
    
}


-(IBAction)goal3:(UIButton*)sender
{
    
    if (!self.goalGP3ViewController)
    {
        self.goalGP3ViewController = (GoalGP3ViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"GoalGP3ViewController"];
    }
    
    self.goalGP3ViewController.view.frame = [self baseRect];
    
    self.goalGP3ViewController.goalGamePlanViewController = self;
    
    [self addChildViewController:self.goalGP3ViewController];
    [self.view addSubview:self.goalGP3ViewController.view];
    [self.goalGP3ViewController didMoveToParentViewController:self];
    self.title = @"Game Plan 3";
    self.gamePlanIndex = Plan3Index;
    [self updateMenuButtons];
    
    //    [self unloadOtherViewControllersExceptIndex:StressIndex];
    
    
}


//-(void)loadViewController:(UIViewController*)ViewController
//{
//    [self.navigationController pushViewController:ViewController animated:YES];
//}
//
//-(void)unloadViewController
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

//-(void) unloadOtherViewControllersExceptIndex:(NSInteger)trackerIndex
//{
//
//        if (self.foodTrackerViewController)
//        {
//            if (trackerIndex != FoodIndex)
//            {
//                [self.foodTrackerViewController willMoveToParentViewController:nil];
//                [self.foodTrackerViewController.view removeFromSuperview];
//                [self.foodTrackerViewController removeFromParentViewController];
//                self.foodTrackerViewController = nil;
//            }
//        }
//
//        if (self.sleepTrackerViewController)
//        {
//            if (trackerIndex != SleepIndex)
//            {
//                [self.sleepTrackerViewController willMoveToParentViewController:nil];
//                [self.sleepTrackerViewController.view removeFromSuperview];
//                [self.sleepTrackerViewController removeFromParentViewController];
//                self.sleepTrackerViewController = nil;
//            }
//        }
//
//        if (self.stressTrackerViewController)
//        {
//            if (trackerIndex != StressIndex)
//            {
//                [self.stressTrackerViewController willMoveToParentViewController:nil];
//                [self.stressTrackerViewController.view removeFromSuperview];
//                [self.stressTrackerViewController removeFromParentViewController];
//                self.stressTrackerViewController = nil;
//            }
//        }
//
//        if (self.drinkTrackerViewController)
//        {
//            if (trackerIndex != DrinkIndex)
//            {
//                [self.drinkTrackerViewController willMoveToParentViewController:nil];
//                [self.drinkTrackerViewController.view removeFromSuperview];
//                [self.drinkTrackerViewController removeFromParentViewController];
//                self.drinkTrackerViewController = nil;
//            }
//        }
//
//        if (self.activityTrackerViewController)
//        {
//            if (trackerIndex != ActivityIndex)
//            {
//                [self.activityTrackerViewController willMoveToParentViewController:nil];
//                [self.activityTrackerViewController.view removeFromSuperview];
//                [self.activityTrackerViewController removeFromParentViewController];
//                self.activityTrackerViewController = nil;
//            }
//        }
//}


-(IBAction)backDay:(id)sender {
    
    //    self.appDelegate.day = [self.appDelegate dayForDate:[TIHDate dateYesterdayAtMidnightFromDate:self.appDelegate.day.date]];
    //
    //    [self resetDay];
    //
    
    
}

-(IBAction)forwardDay:(id)sender{
    
    //    self.appDelegate.day = [self.appDelegate dayForDate:[TIHDate dateTomorrowAtMidnightFromDate:self.appDelegate.day.date]];
    //
    //    [self resetDay];
    
}

-(IBAction)changeDay:(id)sender {
    //    self.datePickerViewContainer.hidden = NO;
    //
    //    [self showDatePicker];
}


#pragma Date Picker delegates

-(IBAction)datePickerValueChanged:(UIDatePicker*)sender {
    
    //   self.datePickerDate = sender.date;
}

-(IBAction)datePickerDoneButtonTapped:(id)sender {
    
    //    self.appDelegate.day = [self.appDelegate dayForDate:self.datePickerDate];
    //    [self resetDay];
    //    [self hideDatePicker];
    
}

-(IBAction)datePickerTodayButtonTapped:(id)sender {
    
    //    self.datePickerDate = [NSDate date];
    //    [self.datePickerView setDate:self.datePickerDate animated:YES];
    //
    //
}

-(void) showDatePicker
{
    //    CGRect	hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 250);
    //    self.datePickerViewContainer.frame = hideRect;
    //    self.datePickerViewContainer.hidden = NO;
    //    self.datePickerDate = self.appDelegate.day.date;
    //    [self.datePickerView setDate:self.appDelegate.day.date animated:NO];
    //    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
    //    [UIView animateWithDuration:0.2
    //                     animations:^{
    //                         self.datePickerViewContainer.frame = showRect;
    //                     }
    //                     completion:^(BOOL finished){
    //
    //                     }];
}

-(void) hideDatePicker
{
    //
    //    CGRect	hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 250);
    //    [UIView animateWithDuration:0.2
    //                     animations:^{
    //                         self.datePickerViewContainer.frame = hideRect;
    //
    //                     }
    //                     completion:^(BOOL finished){
    //                         self.datePickerViewContainer.hidden = YES;
    //                     }];
    //
    //
    //
}

-(void) resetDay
{
    //    self.dayLabel.text = [TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime];
    //    if (self.foodTrackerViewController)
    //    {
    //        [self.foodTrackerViewController resetDay];
    //    }
    //
    //    if (self.sleepTrackerViewController)
    //    {
    //        [self.sleepTrackerViewController resetDay];
    //    }
    //
    //    if (self.stressTrackerViewController)
    //    {
    //        [self.stressTrackerViewController resetDay];
    //    }
    //
    //    if (self.drinkTrackerViewController)
    //    {
    //        [self.drinkTrackerViewController resetDay];
    //    }
    //
    //    if (self.activityTrackerViewController)
    //    {
    //        [self.activityTrackerViewController resetDay];
    //    }
}

// Food Sub Contollers

//-(void) addFood:(UIButton*)sender
//{
//    ChoosePlateViewController* choosePlateViewController = (ChoosePlateViewController*)
//    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//     instantiateViewControllerWithIdentifier:@"ChoosePlateViewController"];
//    choosePlateViewController.mealType = sender.tag;
//
//    [self.navigationController pushViewController:choosePlateViewController animated:YES];
//   // [self.masterTrackerViewController loadViewController:choosePlateViewController];
// //   [self.masterTrackerViewController presentAsFullModel:choosePlateViewController];
//
//}
@end

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


