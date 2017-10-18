//
//  GoalSetViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/3/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "GoalSetViewController.h"
#import "AbstractViewController.h"
#import "Goal1ViewController.h"
#import "Goal2ViewController.h"
#import "Goal3ViewController.h"
#import "AppDelegate.h"
#import "TIHDate.h"


enum goalIndex {
    Goal1Index = 0,
    Goal2Index = 1,
    Goal3Index = 2,

    
};


@interface GoalSetViewController ()

@end

@implementation GoalSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.appDelegate.goalSetViewController = self;
    
    self.goalIndex =  [[NSUserDefaults standardUserDefaults] integerForKey:@"goalIndex"];
    
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
    self.goal1Button.enabled = YES;
    self.goal2Button.enabled = YES;
    self.goal3Button.enabled = YES;

    
    self.goal1Button.backgroundColor = [UIColor whiteColor];
    [self.goal1Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.goal2Button.backgroundColor = [UIColor whiteColor];
    [self.goal2Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.goal3Button.backgroundColor = [UIColor whiteColor];
    [self.goal3Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    // update selected button
    switch (self.goalIndex) {
        case Goal1Index:
            self.goal1Button.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
            [self.goal1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.goal1Button.enabled = NO;
            break;
        case Goal2Index:
            self.goal2Button.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
            [self.goal2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.goal2Button.enabled = NO;
            break;
        case Goal3Index:
            self.goal3Button.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
            [self.goal3Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.goal3Button.enabled = NO;
            break;
            
        default:
            break;
    }
    
    
    
}

-(CGRect)baseRect
{
    CGRect baseRect = self.view.bounds;
    NSInteger menuHeight = 105;
    baseRect.origin.y = menuHeight;
    baseRect.size.height = self.view.frame.size.height-menuHeight;
    return baseRect;
    
}
-(IBAction)goal1:(UIButton*)sender
{
    
    if (!self.goal1ViewController)
    {
        self.goal1ViewController = (Goal1ViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"Goal1ViewController"];
        self.goal1ViewController.view.frame = [self baseRect];
        self.goal1ViewController.goalSetViewController = self;
    }
    
    
    
    
    
    [self addChildViewController:self.goal1ViewController];
    [self.view addSubview:self.goal1ViewController.view];
    [self.goal1ViewController didMoveToParentViewController:self];
    self.title = @"Goal1";
    self.goalIndex = Goal1Index;
    [self updateMenuButtons];
    //     [self unloadOtherViewControllersExceptIndex:FoodIndex];
    
    
}


-(IBAction)goal2:(UIButton*)sender
{
    
    if (!self.goal2ViewController)
    {
        self.goal2ViewController = (Goal2ViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"Goal2ViewController"];
    }
    
    self.goal2ViewController.view.frame = [self baseRect];
    
    self.goal2ViewController.goalSetViewController = self;
    
    [self addChildViewController:self.goal2ViewController];
    [self.view addSubview:self.goal2ViewController.view];
    [self.goal2ViewController didMoveToParentViewController:self];
    self.title = @"Goal 2";
    self.goalIndex = Goal2Index;
    [self updateMenuButtons];
    
    //   [self unloadOtherViewControllersExceptIndex:SleepIndex];
    
    
}


-(IBAction)goal3:(UIButton*)sender
{
    
    if (!self.goal3ViewController)
    {
        self.goal3ViewController = (Goal3ViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"Goal3ViewController"];
    }
    
    self.goal3ViewController.view.frame = [self baseRect];
    
    self.goal3ViewController.goalSetViewController = self;
    
    [self addChildViewController:self.goal3ViewController];
    [self.view addSubview:self.goal3ViewController.view];
    [self.goal3ViewController didMoveToParentViewController:self];
    self.title = @"Goal 3";
    self.goalIndex = Goal3Index;
    [self updateMenuButtons];

}


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


