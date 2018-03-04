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
#import "ChoosePlateViewController.h"
#import "OpeningViewViewController.h"
#import "UpGradeViewController.h"


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


-(IBAction)tempToDeleteDays:(id)sender
{
    [self.appDelegate.days removeAllObjects];
    [self.appDelegate savePersistent];
    NSLog(@"days count %lu",self.appDelegate.days.count);
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navbarView.backgroundColor =  [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    self.navbarTitleLabel.font = [UIFont fontWithName:@"Arial" size:24.0];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    self.trackerIndex =  [[NSUserDefaults standardUserDefaults] integerForKey:@"trackerIndex"];
   
   // update button imageview frames, easier in code
   
   float imageDim = 20;
   self.sleepLockImage.frame = CGRectMake(self.sleepButton.frame.origin.x, 0, imageDim,imageDim);
   [self.sleepLockImage setContentMode:UIViewContentModeScaleAspectFit];

   self.stressLockImage.frame = CGRectMake(self.stressButton.frame.origin.x, 0, imageDim, imageDim);
   [self.stressLockImage setContentMode:UIViewContentModeScaleAspectFit];
   
   self.drinkLockImage.frame = CGRectMake(self.drinkButton.frame.origin.x, 0, imageDim, imageDim);
   [self.drinkLockImage setContentMode:UIViewContentModeScaleAspectFit];

    [self food:nil];

    
    self.isAgree = [[NSUserDefaults standardUserDefaults]boolForKey:@"isAgree"];
    
//    self.isAgree = YES; //temp
    
    if (self.isAgree == NO)
    {
        OpeningViewViewController *openingViewViewController = (OpeningViewViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"OpeningViewViewController"];
        openingViewViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:openingViewViewController animated:YES completion:^{

        }];
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self updateMenuButtons];

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
    self.foodButton.enabled = YES;
    self.activityButton.enabled = YES;
    self.sleepButton.enabled = YES;
    self.stressButton.enabled = YES;
    self.drinkButton.enabled = YES;
    self.foodButton.backgroundColor = [UIColor whiteColor];
    [self.foodButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.activityButton.backgroundColor = [UIColor whiteColor];
    [self.activityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.sleepButton.backgroundColor = [UIColor whiteColor];
    [self.sleepButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.stressButton.backgroundColor = [UIColor whiteColor];
    [self.stressButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.drinkButton.backgroundColor = [UIColor whiteColor];
    [self.drinkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

   self.stressLockImage.hidden = YES;
   self.sleepLockImage.hidden = YES;
   self.drinkLockImage.hidden = YES;
   
    switch (self.appDelegate.subscriptionLevel)
    {
        case SubscriptionFree:
        {
           self.stressLockImage.hidden = NO;
           self.sleepLockImage.hidden = NO;
           self.drinkLockImage.hidden = NO;
            
        }
        break;
    }
// update selected button
    switch (self.trackerIndex) {
  case FoodIndex:
    self.foodButton.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    [self.foodButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.foodButton.enabled = NO;
    break;
  case ActivityIndex:
    self.activityButton.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    [self.activityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.activityButton.enabled = NO;
    break;
  case SleepIndex:
    self.sleepButton.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    [self.sleepButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.sleepButton.enabled = NO;
    break;
  case StressIndex:
    self.stressButton.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    [self.stressButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.stressButton.enabled = NO;
    break;
  case DrinkIndex:
    self.drinkButton.backgroundColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    [self.drinkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.drinkButton.enabled = NO;
    break;

  default:
    break;
}



}

-(CGRect)baseRect
{
        CGRect baseRect = self.view.bounds;
        NSInteger menuHeight = 77+66;
        baseRect.origin.y = menuHeight;
        baseRect.size.height = self.view.frame.size.height-menuHeight;
        return baseRect;

}
-(IBAction)food:(UIButton*)sender
{

    if (!self.foodTrackerViewController)
    {
        self.foodTrackerViewController = (FoodTrackerViewController*)
        [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
        instantiateViewControllerWithIdentifier:@"FoodTrackerViewController"];
        self.foodTrackerViewController.view.frame = [self baseRect];
        self.foodTrackerViewController.masterTrackerViewController = self;
    }

        [self addChildViewController:self.foodTrackerViewController];
        [self.view addSubview:self.foodTrackerViewController.view];
        [self.foodTrackerViewController didMoveToParentViewController:self];
        self.navbarTitleLabel.text = @"Food Tracker";
        self.trackerIndex = FoodIndex;
        [self updateMenuButtons];
   //     [self unloadOtherViewControllersExceptIndex:FoodIndex];
   
        
}


-(IBAction)sleep:(UIButton*)sender
{

        switch (self.appDelegate.subscriptionLevel)
        {


            case SubscriptionFree:
                {
                    [self loadUpgradeViewController];
                }
                break;

            case SubscriptionPaid1:
            {
                if (!self.sleepTrackerViewController)
                {
                    self.sleepTrackerViewController = (SleepTrackerViewController*)
                    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
                     instantiateViewControllerWithIdentifier:@"SleepTrackerViewController"];
                    self.sleepTrackerViewController.view.frame = [self baseRect];
                    self.sleepTrackerViewController.masterTrackerViewController = self;
                }
                [self addChildViewController:self.sleepTrackerViewController];
                [self.view addSubview:self.sleepTrackerViewController.view];
                [self.sleepTrackerViewController didMoveToParentViewController:self];
                self.navbarTitleLabel.text = @"Sleep Tracker";
                self.trackerIndex = SleepIndex;
                [self updateMenuButtons];
            }

                break;
            case SubscriptionPaid2:
            {
                if (!self.sleepTrackerViewController)
                {
                    self.sleepTrackerViewController = (SleepTrackerViewController*)
                    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
                     instantiateViewControllerWithIdentifier:@"SleepTrackerViewController"];
                    self.sleepTrackerViewController.view.frame = [self baseRect];
                    self.sleepTrackerViewController.masterTrackerViewController = self;
                }
                [self addChildViewController:self.sleepTrackerViewController];
                [self.view addSubview:self.sleepTrackerViewController.view];
                [self.sleepTrackerViewController didMoveToParentViewController:self];
                self.navbarTitleLabel.text = @"Sleep Tracker";
                self.trackerIndex = SleepIndex;
                [self updateMenuButtons];
            }
                break;
            default:
                break;
        }
   
}


-(IBAction)stress:(UIButton*)sender
{

        switch (self.appDelegate.subscriptionLevel)
        {


            case SubscriptionFree:
            {
                 [self loadUpgradeViewController];
            }
                break;

            case SubscriptionPaid1:
            {
                if (!self.stressTrackerViewController)
                {
                    self.stressTrackerViewController = (StressTrackerViewController*)
                    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
                    instantiateViewControllerWithIdentifier:@"StressTrackerViewController"];
                    self.stressTrackerViewController.view.frame = [self baseRect];
                    self.stressTrackerViewController.masterTrackerViewController = self;
                }
                [self addChildViewController:self.stressTrackerViewController];
                [self.view addSubview:self.stressTrackerViewController.view];
                [self.stressTrackerViewController didMoveToParentViewController:self];
                self.navbarTitleLabel.text = @"Stress Tracker";
                self.trackerIndex = StressIndex;
                [self updateMenuButtons];
        
            }

                break;
            case SubscriptionPaid2:
            {
                if (!self.stressTrackerViewController)
                {
                    self.stressTrackerViewController = (StressTrackerViewController*)
                    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
                    instantiateViewControllerWithIdentifier:@"StressTrackerViewController"];
                    self.stressTrackerViewController.view.frame = [self baseRect];
                    self.stressTrackerViewController.masterTrackerViewController = self;
                }
                [self addChildViewController:self.stressTrackerViewController];
                [self.view addSubview:self.stressTrackerViewController.view];
                [self.stressTrackerViewController didMoveToParentViewController:self];
                self.navbarTitleLabel.text = @"Stress Tracker";
                self.trackerIndex = StressIndex;
                [self updateMenuButtons];
        
            }
                break;
            default:
                break;
        }
        
}
-(IBAction)activity:(UIButton*)sender
{

    if (!self.activityTrackerViewController)
    {
        self.activityTrackerViewController = (ActivityTrackerViewController*)
        [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
        instantiateViewControllerWithIdentifier:@"ActivityTrackerViewController"];
    
    }
    self.activityTrackerViewController.view.frame = [self baseRect];
    self.activityTrackerViewController.masterTrackerViewController = self;
    [self addChildViewController:self.activityTrackerViewController];
    [self.view addSubview:self.activityTrackerViewController.view];
    [self.activityTrackerViewController didMoveToParentViewController:self];
    self.navbarTitleLabel.text = @"Activity Tracker";
     self.trackerIndex = ActivityIndex;
    [self updateMenuButtons];

}

-(IBAction)drink:(UIButton*)sender
{
    switch (self.appDelegate.subscriptionLevel)
    {


        case SubscriptionFree:
        {
             [self loadUpgradeViewController];;

        }
            break;

        case SubscriptionPaid1:
        {
            if (!self.drinkTrackerViewController)
            {
                self.drinkTrackerViewController = (DrinkTrackerViewController*)
                [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
                instantiateViewControllerWithIdentifier:@"DrinkTrackerViewController"];
            }

                self.drinkTrackerViewController.view.frame = [self baseRect];

                self.drinkTrackerViewController.masterTrackerViewController = self;

                [self addChildViewController:self.drinkTrackerViewController];
                [self.view addSubview:self.drinkTrackerViewController.view];
                [self.drinkTrackerViewController didMoveToParentViewController:self];
                self.navbarTitleLabel.text = @"Drink Tracker";
                 self.trackerIndex = DrinkIndex;
                [self updateMenuButtons];
            }
             break;
         case SubscriptionPaid2:
        {
            if (!self.drinkTrackerViewController)
            {
                self.drinkTrackerViewController = (DrinkTrackerViewController*)
                [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
                instantiateViewControllerWithIdentifier:@"DrinkTrackerViewController"];
            }

                self.drinkTrackerViewController.view.frame = [self baseRect];

                self.drinkTrackerViewController.masterTrackerViewController = self;

                [self addChildViewController:self.drinkTrackerViewController];
                [self.view addSubview:self.drinkTrackerViewController.view];
                [self.drinkTrackerViewController didMoveToParentViewController:self];
                self.navbarTitleLabel.text = @"Drink Tracker";
                 self.trackerIndex = DrinkIndex;
                [self updateMenuButtons];
            }
             break;
    }
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
//    ////
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

    self.appDelegate.day = [self.appDelegate dayForDate:[TIHDate dateYesterdayAtMidnightFromDate:self.appDelegate.day.date]];
    
    [self resetDay];
    
    
    
}

-(IBAction)forwardDay:(id)sender{
    
    self.appDelegate.day = [self.appDelegate dayForDate:[TIHDate dateTomorrowAtMidnightFromDate:self.appDelegate.day.date]];

    [self resetDay];
    
}

-(IBAction)changeDay:(id)sender {
    self.datePickerView = [DatePickerView initializeWithSelfBounds:[self baseRect] andDate:self.appDelegate.day.date];
    self.datePickerView.datePickerViewDelegate = self;
    [self addBorderAround:self.datePickerView cornerType:CornerTypeRounded withColor:[UIColor darkGrayColor]];
    switch (self.trackerIndex) {
      case FoodIndex:
        [self.foodTrackerViewController.view addSubview:self.datePickerView];
        break;
      case ActivityIndex:
        [self.activityTrackerViewController.view addSubview:self.datePickerView];
        break;
      case SleepIndex:
        [self.sleepTrackerViewController.view addSubview:self.datePickerView];
        break;
      case StressIndex:
        [self.stressTrackerViewController.view addSubview:self.datePickerView];
        break;
      case DrinkIndex:
        [self.drinkTrackerViewController.view addSubview:self.datePickerView];
        break;
      default:
        break;
    }
    [self.datePickerView showDatePicker];
}


#pragma Date Picker delegates

-(void) datePickerViewChanged:(DatePickerView *)thisDatePickerView;
{
    self.appDelegate.day = [self.appDelegate dayForDate:thisDatePickerView.datePicker.date];
    [self resetDay];
}

-(void) resetDay
{
    if ([self.appDelegate.day.date compare:[TIHDate dateAtMidnightFromDate:[NSDate date]]] == NSOrderedSame) {
        self.dayLabel.text = @"Today";
    }
    
    else {
        
        self.dayLabel.text = [TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime];
    }
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

 // Food Sub Contollers

-(void) addFood:(ChoosePlateViewController*)choosePlateViewController
{
//    ChoosePlateViewController* choosePlateViewController = (ChoosePlateViewController*)
//    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
//     instantiateViewControllerWithIdentifier:@"ChoosePlateViewController"];
//    choosePlateViewController.mealType = sender.tag;

    [self.navigationController pushViewController:choosePlateViewController animated:YES];
   // [self.masterTrackerViewController loadViewController:choosePlateViewController];
 //   [self.masterTrackerViewController presentAsFullModel:choosePlateViewController];

}
@end
