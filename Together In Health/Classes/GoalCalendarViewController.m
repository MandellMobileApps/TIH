//
//  GoalCalendarViewController.m
//  Together In Health
//
//  Created by Jon Mandell on 9/3/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "GoalCalendarViewController.h"
#import "GoalSetViewController.h"
#import "GoalGamePlanViewController.h"

@interface GoalCalendarViewController ()

@end

@implementation GoalCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.title = @"Goals Calendar";

    UIColor *defaultBackgroundColor = [ColorsClass lightgray];
    self.view.backgroundColor = defaultBackgroundColor;
    self.overallView.backgroundColor = defaultBackgroundColor;
    self.calendardaysview.backgroundColor =  defaultBackgroundColor; 
    self.calendarnavview.backgroundColor =  defaultBackgroundColor;   
    self.calendarview.backgroundColor =	[UIColor yellowColor];
    self.containerview.backgroundColor =	defaultBackgroundColor;
    self.prevYearButton.backgroundColor = defaultBackgroundColor;
    self.prevMonthButton.backgroundColor = defaultBackgroundColor;
    self.nextMonthButton.backgroundColor = defaultBackgroundColor;
    self.nextYearButton.backgroundColor = defaultBackgroundColor;
    self.monthNameLabel.backgroundColor = defaultBackgroundColor;
    self.pictureview.backgroundColor = defaultBackgroundColor;

    UIColor *defaultTextColor = [ColorsClass black];
    self.monthNameLabel.textColor = defaultTextColor;
    self.otherLabels.textColor = defaultTextColor;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger monthlastused = [defaults integerForKey:@"currentMonth"];
    NSInteger yearlastused = [defaults integerForKey:@"currentYear"];
    if ((monthlastused > 0)&&(yearlastused>0))
    {
        self.currentMonth = monthlastused;
        self.currentYear = yearlastused;
    }
    else
    {
        //get todays NSDate at midnight
        NSDate *today = [NSDate date];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:today];
        self.currentYear = [comps year];
        self.currentMonth = [comps month];
        [self saveMonthYear];
    
    }
    

    
    [self.calendardaysview setFrame:CGRectMake(kCalendarDaysleft,kCalendarDaystop,kCalendarwidth,kCalendarDaysHeight6)];
    self.calendarcurrent = [[Calendar alloc]initWithHandler:self forMonth:self.currentMonth andYear:self.currentYear];

	NSString *monthyearlabeltemp  = [[NSString alloc] initWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
	self.monthNameLabel.text = monthyearlabeltemp;
    
	

	
//	UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
//	self.navigationItem.backBarButtonItem = backBarItem;
//    
	
//
	[self.calendardaysview addSubview:self.calendarcurrent];
//    

}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self.navigationController setNavigationBarHidden:NO];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)adjustCalendarframewith:(float)height
{
    //[self.view setFrame:CGRectMake(0, 40, 320, height)];
    //[self.view setNeedsDisplay];

}

- (void)dayButtonTapped:(UIButton*)sender {
	if (sender.tag > 0) {
        [self daySelectedSingleTap:(id)sender];
    }
}
- (void)daySelectedSingleTap:(id)sender { 
//	[self.calendarcurrent updateSelection:sender];
}

-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
	self.transitioning = NO;
}


-(void)performTransition:(NSInteger)direction
{
	// Create a CATransition object to describe the transition
	CATransition *transition = [CATransition animation];
	transition.duration = 0.35;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionPush; 
	switch (direction) {
		case 1:
			transition.subtype = kCATransitionFromLeft;
			break;
		case 2:
			transition.subtype = kCATransitionFromRight;
			break;
		case 3:
			transition.subtype = kCATransitionFromBottom;
			break;
		case 4:
			transition.subtype = kCATransitionFromTop;
			break;
		default:
			break;
	}
	self.transitioning = YES;
	transition.delegate = self;
	[self.calendardaysview.layer addAnimation:transition forKey:nil];
	
}



- (IBAction)prevMonth:(id)sender { 
	

    if(!self.transitioning)
	{
        if(self.currentMonth == 1) {
            self.currentYear--;
            self.currentMonth = 12;
        } else {
            self.currentMonth--;
        }
        [self saveMonthYear];

		[self performTransition:1];
        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];

		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];


	}
	
}

- (IBAction)nextMonth:(id)sender { 
	if(!self.transitioning)
	{
		[self performTransition:2];

        if(self.currentMonth == 12) {
            self.currentYear++;
            self.currentMonth = 1;
        } else {
            self.currentMonth++;
        }
        [self saveMonthYear];
        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];
		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];


	
	}
}


- (IBAction)prevYear:(id)sender {
	if(!self.transitioning)
	{
        self.currentYear--;
        [self saveMonthYear];
        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];
		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];


	}
}

- (IBAction)nextYear:(id)sender {
	if(!self.transitioning)
	{
        self.currentYear++;
        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];
        [self performTransition:2];
		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];

    }

}

-(void)GotoToday {
	if(!self.transitioning)
	{
	//get todays NSDate at midnight
        NSDate *today = [NSDate date];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:today];
        self.nextYear = [comps year];
        self.nextMonth = [comps month];
        [self.calendarnext drawCalendarForYear:self.nextYear month:self.nextMonth];
        NSString *monthyearlabeltemp  = [[NSString alloc] initWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
        self.monthNameLabel.text = monthyearlabeltemp;
    }

}


-(NSString*)monthName:(NSInteger)month
{
    NSArray *monthNames = [NSArray arrayWithObjects:@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", nil];
    return [monthNames objectAtIndex:month-1];

}

-(void)saveMonthYear
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.currentYear forKey:@"currentYear"];
    [defaults setInteger:self.currentMonth forKey:@"currentMonth"];
    [defaults synchronize];


}

-(IBAction)setGoal:(id)sender {
    GoalSetViewController* goalSetViewController = (GoalSetViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"GoalSetViewController"];
    [self.navigationController pushViewController:goalSetViewController animated:YES];
    
}

-(IBAction)gamePlan:(id)sender {
    GoalGamePlanViewController* goalGamePlanViewController = (GoalGamePlanViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"GoalGamePlanViewController"];
    [self.navigationController pushViewController:goalGamePlanViewController animated:YES];
    
}

@end
