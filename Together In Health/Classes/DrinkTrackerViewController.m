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
 
    [self.thisTextView setReturnKeyType:UIReturnKeyDone];
    
    self.pickerViewContainer.hidden = YES;
    
    self.datePickerViewContainer.hidden = YES;
    
    [self resetDay];

}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self calculateTotals];
    [self.thisTableView reloadData];
}

-(void)calculateTotals
{
    self.drinkTotalWater = 0;
    self.drinkTotalMilk = 0;
    self.drinkTotalSugar = 0;
    self.drinkTotalCaffeine = 0;
    self.drinkTotalAlcohol = 0;
    
    for (Drink* drink in self.appDelegate.day.drinksArray)
    {
        switch (drink.drinkType) {
          case DrinkTypeWater:
            self.drinkTotalWater = self.drinkTotalWater + [drink.amount integerValue];
            break;
          case DrinkTypeMilk:
            self.drinkTotalMilk = self.drinkTotalMilk + [drink.amount integerValue];
            break;
          case DrinkTypeSugar:
            self.drinkTotalSugar = self.drinkTotalSugar + [drink.amount integerValue];

            break;
          case DrinkTypeCaffeine:
            self.drinkTotalCaffeine = self.drinkTotalCaffeine + [drink.amount integerValue];

            break;
          case DrinkTypeAlcohol:
            self.drinkTotalAlcohol = self.drinkTotalAlcohol + [drink.amount integerValue];

            break;
          default:
            break;
        }
    
    
    
    }



}


-(void)resetDay {
    
    self.detaildataArray = [NSArray arrayWithObjects:self.drinkString, nil];
    [self calculateTotals];
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

       return self.appDelegate.day.drinksArray.count;
    }

    else {
        return 5;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 25)];
    [headerView setBackgroundColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1]];

    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, tableView.bounds.size.width, 22)];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    if (section == 0)
        [headerLabel setText:@"   All Drinks"];
    else
        [headerLabel setText:@"   Total Intakes"];

    

    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [addButton addTarget:self action:@selector(addDrink:) forControlEvents:UIControlEventTouchUpInside];
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
        MyCell.drink = [self.appDelegate.day.drinksArray objectAtIndex:indexPath.row];
        [MyCell refreshDrinkCell];

    }
    
    else {
        if (indexPath.row == 0) {
            MyCell.textLabel.text = @"Total water intake";
            MyCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",self.drinkTotalWater];
        }
        
        else if (indexPath.row == 1) {
            MyCell.textLabel.text = @"Total milk intake";
            MyCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",self.drinkTotalMilk];
        }
        
        else if (indexPath.row == 2) {
            MyCell.textLabel.text = @"Total sugary drink intake";
            MyCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",self.drinkTotalSugar];
        }
        else if (indexPath.row == 3) {
            MyCell.textLabel.text = @"Total caffeine drink intake";
            MyCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",self.drinkTotalCaffeine];
        }
        else {
            MyCell.textLabel.text = @"Total alcohol intake";
            MyCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",self.drinkTotalAlcohol];
        }


    }
    }
  
    return MyCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        
//        ChooseDrinkViewController* chooseDrinkViewController = (ChooseDrinkViewController*)
//        [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"ChooseDrinkViewController"];
//        [self.navigationController pushViewController:chooseDrinkViewController animated:YES];
        
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
    
    [tableView beginUpdates];
    [self.thisTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    [self.appDelegate.day.drinksArray removeObjectAtIndex:indexPath.row];
    [tableView endUpdates];

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
