//
//  DrinkTrackerViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "DrinkTrackerViewController.h"
#import "DrinkTrackerCell.h"
#import "Drink.h"
#import "FoodTrackerViewController.h"
#import "ActivityTrackerViewController.h"
#import "StressTrackerViewController.h"
#import "SleepTrackerViewController.h"
#import "ChooseDrinkViewController.h"
#import "Day.h"
#import "AppDelegate.h"
#import "TIHDate.h"
#import "MasterTrackerViewController.h"

@interface DrinkTrackerViewController ()

@property (nonatomic, strong) NSMutableArray* healthyDrinkArray;
@property (nonatomic, strong) NSMutableArray* sugaryDrinkArray;
@property (nonatomic, strong) NSMutableArray* caffeineDrinkArray;
@property (nonatomic, strong) NSMutableArray* alcoholDrinkArray;

@end

@implementation DrinkTrackerViewController


-(void)viewDidLoad {
    
    self.title = @"Track Drinks";
    
    self.navigationItem.backBarButtonItem = nil;
    [super viewDidLoad];
    
   // self.day = [self.appDelegate dayForDateOffset:0];
    
     // self.day = [self.appDelegate dayForDateOffset:0];
    
    [self.thisTextView setReturnKeyType:UIReturnKeyDone];
    
    self.pickerViewContainer.hidden = YES;
 //   self.detaildataArray = [NSArray arrayWithObjects:self.drinkString, nil];
    
    self.datePickerViewContainer.hidden = YES;
    
    [self resetDay];
    
   // self.drinkArray = [NSMutableArray arrayWithObjects:@"test1", @"test2", @"test3",nil];
    
//    self.drinkArray = [NSMutableArray arrayWithObjects:self.drink.waterArray, self.drink.sugarArray, self.drink.caffeineArray, self.drink.alcoholArray, self.addDrinkArray, nil];
    
 //   self.allDrinkArray = [NSMutableArray arrayWithObjects:self.appDelegate.day.healthyDrinkArray, self.appDelegate.day.sugaryDrinkArray, self.appDelegate.day.caffeineDrinkArray, self.appDelegate.day.alcoholDrinkArray, nil];
    
    

}

-(void)resetDay {
    
    if ([self.appDelegate.day.date compare:[TIHDate dateAtMidnightFromDate:[NSDate date]]] == NSOrderedSame) {
        self.dayLabel.text = @"Today";
    }
    
    else {
        
        self.dayLabel.text = [TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime];
    }
    self.detaildataArray = [NSArray arrayWithObjects:self.drinkString, nil];
    [self.thisTableView reloadData];
    
}


#pragma mark - UITableView delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 45;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 35;
    
    return h;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.

    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {

     //   return self.appDelegate.day.healthyDrinkArray.count;
    }

    else {
        return 4;
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
        [headerLabel setText:@"   All Drinks"];
    else
        [headerLabel setText:@"   Total Intakes"];

    
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
    [addButton addTarget:self action:@selector(addDrink:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(280, 2.5, 28, 28);
    addButton.titleLabel.text = @"+";
    
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.cornerRadius = 15;
    
    
    if (section == 0) {
        
        [headerView addSubview:addButton];
        
        [headerView addSubview:headerLabel];
    }
    
    else if (section == 1) {
        [headerView addSubview:headerLabel];
    }
    
    return headerView;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MyCell";
    
    DrinkTrackerCell *MyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (MyCell == nil)
    {
        MyCell = [[DrinkTrackerCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    else {
        
//    }
//    
    if (indexPath.section == 0) {
        //  MyCell.textLabel.text = [self.appDelegate.day.healthyDrinkArray objectAtIndex:indexPath.row];

    }
    
    else {
        if (indexPath.row == 0) {
            MyCell.textLabel.text = @"Total water intake";
            MyCell.detailTextLabel.text = @"0";
        }
        
        else if (indexPath.row == 1) {
            MyCell.textLabel.text = @"Total sugary drink intake";
        }
        else if (indexPath.row == 2) {
            MyCell.textLabel.text = @"Total caffeine drink intake";
        }
        else {
            MyCell.textLabel.text = @"Total alcohol intake";
        }


    }
    }
  
    return MyCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        
        ChooseDrinkViewController* chooseDrinkViewController = (ChooseDrinkViewController*)
        [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
         instantiateViewControllerWithIdentifier:@"ChooseDrinkViewController"];
        //        [self presentViewController:chooseActivityViewController animated:YES completion:nil];
        [self.navigationController pushViewController:chooseDrinkViewController animated:YES];
        
    }
    else {
        
    }

    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

-(void)calculateOunces {
    int integer = [self.drinkTrackerCell.thisTextField.text intValue];
    
    
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
    
    if (indexPath.section == 0)
        
    return YES;
    
    else {
        return NO;
    }
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    NSDictionary* object = [self.myStadiums objectAtIndex:indexPath.row];
    //    [self.myStadiums removeObjectAtIndex:indexPath.row];
    
    
    [self.thisTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    
    // NSString* rowid = [object objectForKey:@"RecordId"];
    // NSString* sql2 = [NSString stringWithFormat:@"UPDATE ProSports Set BeenThere = \"NO\" WHERE RecordId = \"%@\" ",rowid];
    // [SQLiteAccess updateWithSQL:sql2];
    
    //  [[NSNotificationCenter defaultCenter] postNotificationName:@"BeenThereDetailUpdated" object:nil];
    
    //    [GlobalMethods postNotification:@"UpdateBeenThere" withObject:NO];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    
}

-(void)viewDidDisappear:(BOOL)animated {
  
}

-(IBAction)addDrink:(id)sender {
    ChooseDrinkViewController* chooseDrinkViewController = (ChooseDrinkViewController*)
    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ChooseDrinkViewController"];
        chooseDrinkViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
        [self presentViewController:chooseDrinkViewController animated:YES completion:^{

        }];
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
    
    
    
}@end
