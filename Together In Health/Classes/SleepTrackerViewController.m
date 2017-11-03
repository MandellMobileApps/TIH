//
//  SleepTrackerViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "SleepTrackerViewController.h"
#import "SleepTrackerCell.h"
#import "SleepTrackerTableView.h"
#import "FoodTrackerViewController.h"
#import "ActivityTrackerViewController.h"
#import "StressTrackerViewController.h"
#import "DrinkTrackerViewController.h"
#import "Sleep.h"
#import "Day.h"
#import "AppDelegate.h"
#import "TIHDate.h"
#import "MasterTrackerViewController.h"

@implementation SleepTrackerViewController


- (void)viewDidLoad{
    [super viewDidLoad];

    
    [self hideDatePicker];
    self.pickerViewContainer.hidden = YES;
    
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 650);
    
    self.sleepButton.enabled = NO;
    

                      
//    self.opendetaildataArray = [NSArray arrayWithObjects:
//                                @"10:00PM",
//                                @"6:00AM",
//                                nil];
    
    self.currentSelection = -1;
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [self.dateFormatter setTimeStyle:NSDateFormatterShortStyle];

 //   self.detaildataArray = [NSArray arrayWithObjects:self.beginSleephours, self.endSleephours, nil];
    

    
    [self resetDay];
    
   // self.pickerViewContainer.frame = CGRectMake(0,self.view.bounds.size.height, 320, 250);
    [self.appDelegate.day printoutDay];
}

-(void)resetDay {
    
    if ([self.appDelegate.day.date compare:[TIHDate dateAtMidnightFromDate:[NSDate date]]] == NSOrderedSame) {
        self.dayLabel.text = @"Today";
    }
    
    else {
        
        self.dayLabel.text = [TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime];
    }
    
    self.restedSegment.selectedSegmentIndex = self.appDelegate.day.restedRating-1;
    self.rateSleepSegment.selectedSegmentIndex = self.appDelegate.day.ratedRating-1;
    self.dataArray = [NSArray arrayWithObjects:
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:self.appDelegate.day.sleepTime, @"time", @"Went to bed", @"label", nil],
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:self.appDelegate.day.wakeTime, @"time", @"Woke Up", @"label", nil], nil];
    //[self updateArrays];
    [self.thisTableView reloadData];
    
}

-(void)updateData
{
    [self resetDay];
}

- (void)viewDidUnload{
    [super viewDidUnload];
    self.dataArray = nil;
    self.dateFormatter = nil;
}

-(IBAction)datePickerValueChanged:(UIDatePicker*)sender {
    
    if (self.currentSelection == 0) {
        self.appDelegate.day.sleepTime = sender.date;
	
}
    else if (self.currentSelection == 1) {
        self.appDelegate.day.wakeTime = sender.date;
    }
    
    self.dataArray = [NSArray arrayWithObjects:
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:self.appDelegate.day.sleepTime, @"time", @"Went to bed", @"label", nil],
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:self.appDelegate.day.wakeTime, @"time", @"Woke Up", @"label", nil], nil];
    
   // self.day.date = sender.date;
    
    [self.thisTableView reloadData];
}

-(IBAction)datePickerDoneButtonTapped:(id)sender {
    
    [self hideDatePicker];
}

-(void) showDatePickerForIndex:(NSInteger)selection {
    
    if (selection == -1)
    {
        [self hideDatePicker];
    }
    else if (selection == 0)
    {
        if (self.currentSelection == 1)
        {
            [self hideDatePicker];
            [self performSelector:@selector(showDatePicker) withObject:nil afterDelay:0.25];
            
        }
        else if (self.currentSelection < 0)
        {
            [self showDatePicker];
        }
        
    }
    else if (selection == 1)
    {
        if (self.currentSelection == 0)
        {
            [self hideDatePicker];
            [self performSelector:@selector(showDatePicker) withObject:nil afterDelay:0.25];
            
        }
        else if (self.currentSelection < 0)
        {
            [self showDatePicker];
        }
    }
    self.currentSelection = selection;
}

-(void) showDatePicker
{
    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-240, self.view.bounds.size.width, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self.view addSubview:self.pickerViewContainer];
                         self.pickerViewContainer.frame = showRect;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void) hideDatePicker
{
    
    CGRect	hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 0);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.pickerViewContainer.frame = hideRect;
                     }
                     completion:^(BOOL finished){
                        // [self.pickerViewContainer removeFromSuperview];
                     }];
    
    
}

-(IBAction)resetHours:(id)sender{
    
    NSIndexPath *indexPath = [self.thisTableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.thisTableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text = @"";
}


#pragma mark - UITableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MyCell";
    SleepTrackerCell *MyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSMutableDictionary *temp = [self.dataArray objectAtIndex:indexPath.row];
    
    MyCell.textLabel.text = [temp objectForKey:@"label"];

        
    MyCell.detailTextLabel.text = [self.dateFormatter stringFromDate:[temp objectForKey:@"time"]];

    
    return MyCell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableDictionary *temp = [self.dataArray objectAtIndex:indexPath.row];
    self.pickerView.date = [temp objectForKey:@"time"];
    [self showDatePickerForIndex:indexPath.row];
    self.pickerViewContainer.hidden = NO;
}


//- (IBAction)dateAction:(id)sender{
//    NSIndexPath *indexPath = [self.thisTableView indexPathForSelectedRow];
//    UITableViewCell *cell = [self.thisTableView cellForRowAtIndexPath:indexPath];
//    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.pickerView.date];
//    if (indexPath.row == 0) {self.beginSleephours = self.pickerView.date;}
//    if (indexPath.row == 1) {self.endSleephours = self.pickerView.date;}
//    
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 40;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 30;
    
    return h;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 25)];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, tableView.bounds.size.width, 22)];

    [headerLabel setTextColor:[UIColor whiteColor]];

    [headerLabel setText:@"   Sleep Hours"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
}

- (IBAction)rested:(UISegmentedControl* )sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.appDelegate.day.restedRating = 1;
            break;
        case 1:
            self.appDelegate.day.restedRating = 2;
            break;
        case 2:
            self.appDelegate.day.restedRating = 3;
            break;
        default:
            break;
    }
}

- (IBAction)rateSleep:(UISegmentedControl* )sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.appDelegate.day.ratedRating = 1;
            break;
        case 1:
            self.appDelegate.day.ratedRating = 2;
            break;
        case 2:
            self.appDelegate.day.ratedRating = 3;
            break;
        case 3:
            self.appDelegate.day.ratedRating = 4;
            break;
        case 4:
            self.appDelegate.day.ratedRating = 5;
            break;
        default:
            break;
    }
}

-(IBAction)food:(id)sender {
    FoodTrackerViewController* foodTrackerViewController = (FoodTrackerViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"FoodTrackerViewController"];
    foodTrackerViewController.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:foodTrackerViewController animated:NO];
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

-(IBAction)stress:(id)sender {
    StressTrackerViewController* stressTrackerViewController = (StressTrackerViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"StressTrackerViewController"];
    stressTrackerViewController.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:stressTrackerViewController animated:NO];
}

-(IBAction)resetRested:(id)sender {
    self.restedSegment.selectedSegmentIndex = -1;
    
}

-(IBAction)resetRate:(id)sender {
    self.rateSleepSegment.selectedSegmentIndex = -1;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.appDelegate savePersistent];
}



@end
