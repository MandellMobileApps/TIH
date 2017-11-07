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
#import "AppDelegate.h"

@interface GoalCalendarViewController ()

@end

@implementation GoalCalendarViewController


-(IBAction)tempRefreshGoals:(id)sender
{

        self.appDelegate.goalsArray = [NSMutableArray arrayWithObjects:
                           [Goal thisGoal],
                           [Goal thisGoal],
                           [Goal thisGoal],
                           nil];
        NSInteger g = 1;
        for (Goal* item in self.appDelegate.goalsArray)
        {
            item.goalName = [NSString stringWithFormat:@"Goal %lu",g];
            item.goalColor = [self.appDelegate defaultGoalColors:g];
            g++;
        }
        [self.appDelegate saveGoals];
        [self updateGoalButtons];
        self.goal1ColorView.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:0] goalColor];
        self.goal2ColorView.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:1] goalColor];
        self.goal3ColorView.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:2] goalColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:200/255.0 alpha:1];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.title = @"Goals Calendar";
    [self.appDelegate loadGoals];

    UIColor *defaultBackgroundColor = [ColorsClass lightgray];
    self.view.backgroundColor = defaultBackgroundColor;
    self.calendarcurrent.backgroundColor =  defaultBackgroundColor;
    self.calendarnavview.backgroundColor =defaultBackgroundColor;
    self.calendarview.backgroundColor =defaultBackgroundColor;
    self.calendarDaysview.backgroundColor =defaultBackgroundColor;
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
    


//

}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self.navigationController setNavigationBarHidden:NO];
    
    if (self.calendarcurrent)
    {
        [self.calendarcurrent removeFromSuperview];
    }
    self.calendarcurrent = [[Calendar alloc]initWithHandler:self forMonth:self.currentMonth andYear:self.currentYear];
    NSString *monthyearlabeltemp  = [[NSString alloc] initWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
    self.monthNameLabel.text = monthyearlabeltemp;
    
    [self getNewRects];

    [self.calendarDaysview addSubview:self.calendarcurrent];
     [self updateGoalButtons];
    self.goal1ColorView.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:0] goalColor];
    self.goal2ColorView.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:1] goalColor];
    self.goal3ColorView.backgroundColor = [[self.appDelegate.goalsArray objectAtIndex:2] goalColor];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
	 [self getNewRects];
	transition.delegate = self;
	[self.calendarDaysview.layer addAnimation:transition forKey:nil];
	[self saveMonthYear];

}

-(void)getNewRects
{

   CGRect calendarnavviewframe = self.calendarnavview.frame;
    calendarnavviewframe.size.width = self.calendarcurrent.frame.size.width;
    calendarnavviewframe.origin.x = 0;
    self.calendarnavview.frame = calendarnavviewframe;
 //[self addBorderAround:self.calendarnavview cornerType:CornerTypeRounded withColor:[UIColor greenColor]];
 
    CGRect calendarDaysviewframe = self.calendarDaysview.frame;
    calendarDaysviewframe.size.height = self.calendarcurrent.frame.size.height;
    calendarDaysviewframe.size.width = self.calendarcurrent.frame.size.width;
    calendarDaysviewframe.origin.y = self.calendarnavview.frame.size.height;
    calendarDaysviewframe.origin.x = 0;
    self.calendarDaysview.frame = calendarDaysviewframe;
 //[self addBorderAround:self.calendarDaysview cornerType:CornerTypeRounded withColor:[UIColor cyanColor]];


    CGRect calendarviewframe = self.calendarview.frame;
    calendarviewframe.size.height = (self.calendarnavview.frame.size.height)+self.calendarcurrent.frame.size.height;
    calendarviewframe.size.width = self.calendarcurrent.frame.size.width;
    calendarviewframe.origin.y = 64;
    calendarviewframe.origin.x = 20;
    self.calendarview.frame = calendarviewframe;
   // [self addBorderAround:self.calendarview cornerType:CornerTypeRounded withColor:[UIColor redColor]];
    
    NSLog(@"calendarnavview height %f",self.calendarnavview.frame.size.height);
    NSLog(@"calendarview height %f",self.calendarview.frame.size.height);
    NSLog(@"calendarDaysview height %f",self.calendarDaysview.frame.size.height);
    NSLog(@"calendarcurrent height %f",self.calendarcurrent.frame.size.height);

//    [self.calendarview setNeedsDisplay];
//    [self.calendarDaysview setNeedsDisplay];
//    [self.calendarnavview setNeedsDisplay];

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


        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];

		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
        [self performTransition:1];

	}
	
}

- (IBAction)nextMonth:(id)sender { 
	if(!self.transitioning)
	{

        if(self.currentMonth == 12) {
            self.currentYear++;
            self.currentMonth = 1;
        } else {
            self.currentMonth++;
        }
        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];
		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
        [self performTransition:2];
	
	}
}


- (IBAction)prevYear:(id)sender {
	if(!self.transitioning)
	{
        self.currentYear--;
        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];
		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
        [self performTransition:1];
        
	}
}

- (IBAction)nextYear:(id)sender {
	if(!self.transitioning)
	{
        self.currentYear++;
        [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];
		self.monthNameLabel.text = [NSString stringWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
        
         [self performTransition:2];
    }

}

//-(void)GotoToday {
//    if(!self.transitioning)
//    {
//    //get todays NSDate at midnight
//        NSDate *today = [NSDate date];
//        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:today];
//        self.nextYear = [comps year];
//        self.nextMonth = [comps month];
//        [self.calendarcurrent drawCalendarForYear:self.nextYear month:self.nextMonth];
//        NSString *monthyearlabeltemp  = [[NSString alloc] initWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
//        self.monthNameLabel.text = monthyearlabeltemp;
//        [self performTransition:4];
//
//    }
//
//}


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
    [[UIStoryboard storyboardWithName:@"Goals" bundle:nil]
     instantiateViewControllerWithIdentifier:@"GoalSetViewController"];
    [self.navigationController pushViewController:goalSetViewController animated:YES];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GoalSetViewController* goalSetViewController = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"1"])
    {
        goalSetViewController.goalIndex = Goal1Index;
        goalSetViewController.goal = [[self.appDelegate.goalsArray objectAtIndex:0] copyGoal];

    }
    else if ([segue.identifier isEqualToString:@"2"])
    {
        goalSetViewController.goalIndex = Goal2Index;
        goalSetViewController.goal = [self.appDelegate.goalsArray objectAtIndex:1];
    }
    else if ([segue.identifier isEqualToString:@"3"])
    {
        goalSetViewController.goalIndex = Goal3Index;
        goalSetViewController.goal = [self.appDelegate.goalsArray objectAtIndex:2];
    }

}




-(void)updateGoalButtons
{
    [self.goal1Button setTitle:@"" forState:UIControlStateNormal];
    [self.goal2Button setTitle:@"" forState:UIControlStateNormal];
    [self.goal3Button setTitle:@"" forState:UIControlStateNormal];
    
    self.goal1Label.text = [[self.appDelegate.goalsArray objectAtIndex:0] goalName];
    self.goal2Label.text = [[self.appDelegate.goalsArray objectAtIndex:1] goalName];
    self.goal3Label.text = [[self.appDelegate.goalsArray objectAtIndex:2] goalName];
}

-(IBAction)changeDay:(id)sender {
    if(!self.transitioning)
    {
        // subtract tabbar height since this view is behind the tab bar.
        CGRect currentframe = self.view.bounds;
        currentframe.size.height = self.view.bounds.size.height-40;
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setMonth:self.currentMonth];
        [components setYear:self.currentYear];
        [components setDay:1];
        NSDate *date = [gregorian dateFromComponents:components];

        
        self.datePickerView = [DatePickerView initializeWithSelfBounds:currentframe andDate:date];
        self.datePickerView.datePickerViewDelegate = self;
        [self addBorderAround:self.datePickerView cornerType:CornerTypeRounded withColor:[UIColor darkGrayColor]];
        [self.view addSubview:self.datePickerView];
        [self.datePickerView showDatePicker];
    }
}



#pragma Date Picker delegates

-(void) datePickerViewChanged:(DatePickerView *)thisDatePickerView;
{
    self.appDelegate.day = [self.appDelegate dayForDate:thisDatePickerView.datePicker.date];
//NSLog(@"datePicker.date %@",thisDatePickerView.datePicker.date);
    NSDate *today = [thisDatePickerView.datePicker date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:today];
    self.currentYear = [comps year];
    self.currentMonth = [comps month];
    //NSLog(@"current %lu,  %lu",self.currentYear,self.currentMonth);
    [self.calendarcurrent drawCalendarForYear:self.currentYear month:self.currentMonth];
    NSString *monthyearlabeltemp  = [[NSString alloc] initWithFormat:@"%@  %ld",[self monthName:self.currentMonth], self.currentYear];
    self.monthNameLabel.text = monthyearlabeltemp;
    [self performTransition:4];
    [self saveMonthYear];

}





@end
