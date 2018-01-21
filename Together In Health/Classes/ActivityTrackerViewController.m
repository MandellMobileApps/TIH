//
//  ActivityTrackerViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ActivityTrackerViewController.h"
#import "ChooseActivityViewController.h"
#import "FoodTrackerViewController.h"
#import "StressTrackerViewController.h"
#import "SleepTrackerViewController.h"
#import "DrinkTrackerViewController.h"
#import "ChooseActivityCell.h"
#import "ActivityTrackerCell.h"
#import "Activity.h"
#import "Day.h"
#import "AppDelegate.h"
#import "TIHDate.h"
#import "MasterTrackerViewController.h"

@implementation ActivityTrackerViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.paidMenuView.hidden = YES;
    self.freeMenuView.hidden = NO;
    
    UIImage *faceImage = [UIImage imageNamed:@"Balanced Plate.png"];
    UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
    face.bounds = CGRectMake( 0, 0, 40, 40);//set bound as per you want
    [face setImage:faceImage forState:UIControlStateNormal];
    self.currentSelection = -1;
//    [self.activityTrackerCell.stepField setReturnKeyType:UIReturnKeyDone];
//    [self.activityTrackerCell refreshActivityCell];
    
    self.datePickerViewContainer.hidden = YES;
    


    
    //step counter
//    if ([CMStepCounter isStepCountingAvailable])
//    {
//        self.cmPedometer = [[CMPedometer alloc] init];
//        [self.cmPedometer startStepCountingUpdatesToQueue:self.operationQueue updateOn:1 withHandler:^(NSInteger numberOfSteps, NSDate *timestamp, NSError *error)
//         {
//             [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                 [self updateStepCounterLabelWithStepCounter:numberOfSteps];
//             }];
//         }];
//    }

    [self resetDay];
    
}


-(void)resetDay {
    [self.thisTableView reloadData];
    
    
}

-(void)updateData
{
    [self resetDay];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Number Pad methods

-(void)activitySelected:(Activity*)activity
{
    self.addActivity = [activity copy];
    self.baseContentView.userInteractionEnabled = NO;
    [self addNumberPadForString:@"0" withTitle:self.addActivity.activityName andUnits:@"Enter Minutes" tag:0];
}


- (void)numberPadEntryUpdated:(NSString*)entry forTag:(NSInteger)tag
{
    if (tag == 0)
    {
        self.addActivity.time = entry;
        [self.appDelegate.day.activityArray addObject:self.addActivity];
        [self.thisTableView reloadData];
     }
     else if (tag == 1)
     {

        self.appDelegate.day.steps = entry;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.lastSelectedCell.timeLabel.text = [formatter stringFromNumber:[NSNumber numberWithFloat:[entry floatValue]]];
     }
     else if (tag == 2)
     {
         self.editActivity.time = entry;
         [self activityUpdated:self.editActivity];
         [self.thisTableView reloadData];
     }
     else if (tag == 3)
     {
         self.appDelegate.dailyActivityGoal = [entry integerValue];
         [self.thisTableView reloadData];
     }
     else
     {
        [self.thisTableView reloadData];
     }
     
    self.baseContentView.userInteractionEnabled = YES;

     
//    NSLog(@"self.addActivity.activityName%@",self.addActivity.activityName);
//    NSLog(@"self.addActivity.time %@",self.addActivity.time);
//    NSLog(@"\n");
//    NSLog(@"\n");
//    NSLog(@"\n");
//    NSLog(@"\n");
//    NSLog(@"\n");

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    if (self.appDelegate.subscriptionLevel >0)
    {
        return 4;
    }
    return 3;
    
    //return for distance traveled
    //return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 45;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 35;
    
    return h;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0)
    {
//        if (self.appDelegate.day.activityArray.count == 0)
//        {
//            return 0;
//        }
//        else
//        {
            //return  self.appDelegate.day.activityArray.count+1;
        return  self.appDelegate.day.activityArray.count;
       // }
    }
    else if (section == 1)
    {
        return 1;
    }
    else if (section == 2)
    {
        return 1;
    }
    
    else if (section == 3)
        
    {
        return 1;
    }
    return 0;

}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 25)];
//    [headerView setBackgroundColor:[UIColor gree]];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, tableView.bounds.size.width, 22)];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    if (section == 0)
    {
        [headerLabel setText:@"   Activities"];
    }
    else if (section == 1)
    {
        [headerLabel setText:@"   Total activity time for the day"];
    }
    else if (section == 2)
    {
        [headerLabel setText:@"   Track your steps for the day"];
        }
    else if (section == 3)
    {
        [headerLabel setText:@"   Daily Activity Goal"];
    }
//    else
//        [headerLabel setText:@"   Distance traveled"];

    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [addButton addTarget:self action:@selector(addActivity:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(self.view.bounds.size.width-60, 2.5, 28, 28);
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
    addButton.tag = section;
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.cornerRadius = 15;
    

    
    
    if (section == 0) {
        
        [headerView addSubview:addButton];
        
        [headerView addSubview:headerLabel];
    }
    
    else if (section == 1) {
        [headerView addSubview:headerLabel];
    }
    
    else if (section == 2) {
        [headerView addSubview:headerLabel];
    }
    
    else if (section == 3) {
        [headerView addSubview:headerLabel];
        if ([self goalAchieved])
        {
            UIImageView* goalImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Star.png"]];
            goalImageView.frame=CGRectMake(self.view.bounds.size.width-190, 0, 33, 33);
            [headerView addSubview:goalImageView];
        }
    }
    
    return headerView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    ActivityTrackerCell *MyCell = (ActivityTrackerCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    MyCell.stepField.hidden = YES;
    MyCell.stepField.enabled = NO;
    [self removeBorderFrom:MyCell.timeLabel];
    MyCell.timeLabel.textAlignment = NSTextAlignmentRight;
    if (indexPath.section == 0)
    {

//        if (indexPath.row == 0)
//        {
//            MyCell.activityLabel.text = @"Add Activity";
//            MyCell.timeLabel.text = @"";
//            MyCell.selectionStyle = UITableViewCellSelectionStyleGray;
//            MyCell.accessoryType = UITableViewCellAccessoryNone;
//
//        }
//        else
//        {
           //MyCell.activity = [self.appDelegate.day.activityArray objectAtIndex:indexPath.row-1];
        MyCell.activity = [self.appDelegate.day.activityArray objectAtIndex:indexPath.row];

//    NSLog(@" %lu  %@,  %@  ",indexPath.row, MyCell.activity.activityName,MyCell.activity.time);
    
           MyCell.accessoryType = UITableViewCellAccessoryNone;
           MyCell.selectionStyle = UITableViewCellSelectionStyleNone;

           [MyCell refreshActivityCell];
        //}

    
    }
    else if (indexPath.section == 1)
    {
        MyCell.activityLabel.text = @"Minutes";
        MyCell.timeLabel.text = [self totalMinutes];
        MyCell.selectionStyle = UITableViewCellSelectionStyleNone;
        MyCell.accessoryType = UITableViewCellAccessoryNone;
        MyCell.stepField.enabled = NO;
        MyCell.stepField.hidden = YES;

        
    }
    
    else if (indexPath.section == 2) {
        MyCell.activityLabel.text = @"Steps";
        MyCell.timeLabel.textAlignment = NSTextAlignmentCenter;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        MyCell.timeLabel.text = [formatter stringFromNumber:[NSNumber numberWithFloat:[self.appDelegate.day.steps floatValue]]];

        MyCell.selectionStyle = UITableViewCellSelectionStyleGray;
        MyCell.accessoryType = UITableViewCellAccessoryNone;
        [self addBorderAround:MyCell.timeLabel cornerType:CornerTypeSquare withColor:[UIColor blackColor]];

    }
    
//    else if (indexPath.section == 3) {
//        MyCell.activityLabel.text = @"Distance";
//        MyCell.distanceLabel.textAlignment = NSTextAlignmentCenter;
//        
//        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//        formatter.numberStyle = NSNumberFormatterDecimalStyle;
//        MyCell.distanceLabel.text = [formatter stringFromNumber:[NSNumber numberWithFloat:[self.appDelegate.day.distance floatValue]]];
//        
//        MyCell.selectionStyle = UITableViewCellSelectionStyleGray;
//        MyCell.accessoryType = UITableViewCellAccessoryNone;
//        [self addBorderAround:MyCell.timeLabel cornerType:CornerTypeSquare withColor:[UIColor blackColor]];
//        
//    }
    else if (indexPath.section == 3) {
        MyCell.activityLabel.text = @"Minutes";
        MyCell.timeLabel.textAlignment = NSTextAlignmentCenter;
        
        MyCell.timeLabel.text = [NSString stringWithFormat:@"%lu",self.appDelegate.dailyActivityGoal];

        MyCell.selectionStyle = UITableViewCellSelectionStyleGray;
        MyCell.accessoryType = UITableViewCellAccessoryNone;
        [self addBorderAround:MyCell.timeLabel cornerType:CornerTypeSquare withColor:[UIColor blackColor]];

    }
    return MyCell;
}

-(NSString*)totalMinutes
{
   

    NSInteger total = 0;
    for (Activity* item in self.appDelegate.day.activityArray)
    {
        total = total + [item.time integerValue];
    
    }
     NSString* string = [NSString stringWithFormat:@"%ld",(long)total];
    return string;
}
-(BOOL)goalAchieved
{
    NSInteger total = 0;
    for (Activity* item in self.appDelegate.day.activityArray)
    {
        total = total + [item.time integerValue];
    
    }
    if (total>=self.appDelegate.dailyActivityGoal)
    {
        if (self.appDelegate.dailyActivityGoal > 0)
        {
            return YES;
        }
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.lastSelectedCell = (ActivityTrackerCell*)[tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        self.editActivity = [self.appDelegate.day.activityArray objectAtIndex:indexPath.row];
        [self addNumberPadForString:self.editActivity.time withTitle:self.editActivity.activityName andUnits:@"Enter Minutes" tag:2];
    
    }
    else if (indexPath.section == 1)
    {


        
    }
    else if (indexPath.section == 2)
    {
        
        self.baseContentView.userInteractionEnabled = NO;
        [self addNumberPadForString:@"0" withTitle:[TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime] andUnits:@"Enter Steps" tag:1];

    }
    else if (indexPath.section == 3)
    {
        
        self.baseContentView.userInteractionEnabled = NO;
        [self addNumberPadForString:self.lastSelectedCell.timeLabel.text withTitle:@"Daily Activity Goal" andUnits:@"Enter Minutes" tag:3];

    }
    
}

-(void)activityUpdated:(Activity*)activity
{
    [self.appDelegate.day.activityArray replaceObjectAtIndex:activity.activityArrayIndex withObject:activity];
    [self.appDelegate savePersistent];
    [self updateArrays];
    [self resetDay];
    
}

-(void)updateArrays
{
    NSInteger i = 0;
    for (Activity* item in self.appDelegate.day.activityArray)
    {
        item.activityArrayIndex = i;
        i++;
    }

    
}




#pragma mark - Table edit methods

-(void) enterEditingMode:(id)sender  {
    if (self.thisTableView.editing) {
        [self.thisTableView setEditing:NO animated:YES];
    } else {
        [self.thisTableView setEditing:YES animated:YES];
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //if ((indexPath.section == 0)&&(indexPath.row != 0))
    if (indexPath.section == 0)
        
        return YES;
    
    else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
        [self.appDelegate.day.activityArray removeObjectAtIndex:indexPath.row];
        //[self.appDelegate.day.activityArray removeObjectAtIndex:indexPath.row-1];
        [self.thisTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [self.thisTableView reloadData];

}
-(IBAction)resignKeyboard:(id)sender {
    [self.activityTrackerCell.stepField resignFirstResponder];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.activityTrackerCell.stepField resignFirstResponder];
}

#pragma mark - Saving persistent

// so it saves in simulator, since appDelegate doesn't call close method

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.appDelegate savePersistent];
}



- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:nameoffile];
    return documentsPath ;
}

- (NSString *)dataFilePathofBundle:(NSString *)nameoffile {
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameoffile];
    return bundlePath;
}

-(IBAction)addActivity:(id)sender {
    ChooseActivityViewController* chooseActivityViewController = (ChooseActivityViewController*)
    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ChooseActivityViewController"];
        chooseActivityViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        chooseActivityViewController.activityTrackerViewController = self;
        [self presentViewController:chooseActivityViewController animated:YES completion:^{

        }];

}

#pragma StepTracking methodes

//- (CMPedometer *)pedometer {
//    
//    if (! self.pedometer) {
//        self.pedometer = [[CMPedometer alloc] init];
//
//    }
//}
//
//- (NSOperationQueue *)operationQueue
//{
//    if (_operationQueue == nil)
//    {
//        _operationQueue = [NSOperationQueue new];
//    }
//    return _operationQueue;
//}
//
//
//- (void)updateStepCounterLabelWithStepCounter:(NSInteger)countedSteps
//{
//    self.activityTrackerCell.stepField.text = [NSString stringWithFormat:@"%ld", (long)countedSteps];
//    [self.thisTableView reloadData];
//}
//
//
//- (IBAction)startTrackingSteps:(id)sender {
//    
//    // start live tracking
//    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
//        
//        // this block is called for each live update
//        [self updateLabels:pedometerData];
//        
//    }];
//}
//
//- (void)updateLabels:(CMPedometerData *)pedometerData {
//    
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
//    formatter.maximumFractionDigits = 2;
//    
//    // step counting
//    if ([CMPedometer isStepCountingAvailable]) {
//        self.activityTrackerCell.stepField.text = [NSString stringWithFormat:@"Steps walked: %@", [formatter stringFromNumber:pedometerData.numberOfSteps]];
//    } else {
//        self.self.activityTrackerCell.stepField.text = @"Step Counter not available.";
//    }
//    
//    // distance
//    if ([CMPedometer isDistanceAvailable]) {
//        self.activityTrackerCell.distanceLabel.text = [NSString stringWithFormat:@"Distance travelled: \n%@ meters", [formatter stringFromNumber:pedometerData.distance]];
//    } else {
//        self.activityTrackerCell.distanceLabel.text = @"Distance estimate not available.";
//    }
//
//    // pace
////    if ([CMPedometer isPaceAvailable] && pedometerData.currentPace) {
////        self.paceLabel.text = [NSString stringWithFormat:@"Current Pace: \n%@ seconds per meter", [formatter stringFromNumber:pedometerData.currentPace]];
////    } else {
////        self.paceLabel.text = @"Pace not available.";
////    }
////    
////    // cadence
////    if ([CMPedometer isCadenceAvailable] && pedometerData.currentCadence) {
////        self.cadenceLabel.text = [NSString stringWithFormat:@"Cadence: \n%@ steps per second", [formatter stringFromNumber: pedometerData.currentCadence]];
////    } else {
////        self.cadenceLabel.text = @"Cadence not available.";
////    }
////    
////    // flights climbed
////    if ([CMPedometer isFloorCountingAvailable] && pedometerData.floorsAscended) {
////        self.flightsUpLabel.text = [NSString stringWithFormat:@"Floors ascended: %@", pedometerData.floorsAscended];
////    } else {
////        self.flightsUpLabel.text = @"Floors ascended not available.";
////    }
////    
////    if ([CMPedometer isFloorCountingAvailable] && pedometerData.floorsDescended) {
////        self.flightsDownLabel.text =[NSString stringWithFormat:@"Floors descended: %@", pedometerData.floorsDescended];
////    } else {
////        self.flightsDownLabel.text = @"Floors descended not available.";
////    }
////}
//}
//
//- (IBAction)stopTrackingSteps:(id)sender {
//    
//    // stop live tracking
//    [self.pedometer stopPedometerUpdates];
//}
//
//- (IBAction)queryPedometer:(id)sender {
//    
//    // retrieve data between dates
//    
//    [self.pedometer queryPedometerDataFromDate:self.startDate toDate:self.endDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
//        
//        // historic pedometer data is provided here
//        //[self presentPedometerData:pedometerData];
//        
//    }];
//}








@end
