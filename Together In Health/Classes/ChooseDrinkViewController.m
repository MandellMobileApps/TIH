//
//  ChooseDrinkViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ChooseDrinkViewController.h"
#import "ChooseDrinkCell.h"
#import "Drink.h"
#import "DrinkTrackerViewController.h"
#import "Day.h"
#import "AppDelegate.h"

@implementation ChooseDrinkViewController

-(void)viewDidLoad {
    
    self.navigationItem.backBarButtonItem = nil;
    [super viewDidLoad];
    self.title = @"Choose Drinks";
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
   //self.navigationItem.backBarButtonItem.title = @"Drinks";
    
  //  [self.drinkTrackerViewController loadPersistent];
    
   // self.chooseDrinkCell.checkImage.hidden = YES;
    
  //  self.day = [self.appDelegate dayForDateOffset:0];
    self.pickerViewContainer.hidden = YES;
    
    
    self.amtArray = [NSArray arrayWithObjects:
                     @"0",
                     @"1",
                     @"2",
                     @"3",
                     @"4",
                     @"5",
                     @"6",
                     @"7",
                     @"8",
                     @"9",
                     @"10",
                     @"11",
                     @"12",
                     @"13",
                     @"14",
                     @"15",
                     @"16",
                     @"17",
                     @"18",
                     @"19",
                     @"20",
                     @"21",
                     nil];
    
    self.healthyDrinkArray = [NSMutableArray arrayWithObjects:
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Water",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Herbal tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Decaff green tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Decaff black tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Decaff coffee",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Sparkling/Mineral water",@"Name",
                               @"0",@"Amount",nil],
                              nil];
    
    self.sugaryDrinkArray = [NSMutableArray arrayWithObjects:
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Soda",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Diet Soda",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Sweet tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Juice cocktail ",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"100% juice",@"Name",
                               @"0",@"Amount",nil],
                              nil];
    
    self.caffeineDrinkArray = [NSMutableArray arrayWithObjects:
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Coffee",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Monster",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Redbull",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Decaff black tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Sparkling water",@"Name",
                               @"0",@"Amount",nil],
                              nil];
    
    self.alcoholDrinkArray = [NSMutableArray arrayWithObjects:
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Water",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Decaff herbal tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Decaff green tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Decaff black tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Sparkling water",@"Name",
                               @"0",@"Amount",nil],
                              nil];
    
    
}

//-(void)resetDay {
//    
//    if ([self.appDelegate.day.date compare:[TIHDate dateAtMidnightFromDate:[NSDate date]]] == NSOrderedSame) {
//        self.dayLabel.text = @"Today";
//    }
//    
//    else {
//        
//        self.dayLabel.text = [TIHDate dateStringFromDate:self.appDelegate.day.date withFormat:DateFormatMediumDateNoTime];
//    }
//    
//    [self updateArrays];
//    [self.thisTableView reloadData];
//    
//}
//
//-(void)updateData
//{
//    [self resetDay];
//}
//
//
//-(void)updateArrays
//{
//    NSInteger i = 0;
//    for (Food* item in self.appDelegate.day.foodArray)
//    {
//        item.foodArrayIndex = i;
//        i++;
//    }
//    
//    self.breakfastArray = [self find:mealTypeBreakfast inArray:self.appDelegate.day.foodArray];
//    self.lunchArray = [self find:mealTypeLunch inArray:self.appDelegate.day.foodArray];
//    self.dinnerArray  = [self find:mealTypeDinner inArray:self.appDelegate.day.foodArray];
//    self.snackArray = [self find:mealTypeSnack inArray:self.appDelegate.day.foodArray];
//    
//}
//
//
//-(NSMutableArray*)find:(NSInteger)section inArray:(NSMutableArray*)array
//{
//    NSMutableArray* filterArray = [NSMutableArray array];
//    for (id item in array)
//    {
//        if ([item isKindOfClass:[Food class]])
//        {
//            Food* thisItem = (Food*)item;
//            NSInteger thisType = thisItem.mealType;
//            if (thisType == section)
//            {
//                [filterArray addObject:item];
//            }
//            
//        }
//    }
//    return filterArray;
//    
//}


#pragma mark - UITableView delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 40;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 35;
    
    return h;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 25)];
    //    [headerView setBackgroundColor:[UIColor gree]];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.bounds.size.width, 22)];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    if (section == 0)
        [headerLabel setText:@"   Water and water equivalents"];
    else if( section == 1)
        [headerLabel setText:@"   Sugary beverages"];
    else if (section == 2)
        [headerLabel setText:@"   Caffeine beverages"];
    else
        [headerLabel setText:@"   Alcoholic beverages"];
    [headerView addSubview:headerLabel];
    
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
    [addButton addTarget:self action:@selector(addDrink:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(280, 2.5, 28, 28);
    addButton.titleLabel.text = @"+";
    addButton.tintColor = [UIColor grayColor];
    addButton.titleLabel.textColor = [UIColor purpleColor];
    
    addButton.tag = section;
    
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.cornerRadius = 15;
    
    return headerView;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    tableView.backgroundColor = [ColorsClass performSelector:NSSelectorFromString([self.appDelegate.backgroundColors objectAtIndex:7])];
    switch (section) {
        case 0:
            return self.healthyDrinkArray.count;
            break;
        case 1:
            return self.sugaryDrinkArray.count;
            break;
        case 2:
            return self.caffeineDrinkArray.count;
            break;
        case 3:
            return self.alcoholDrinkArray.count;
            break;
        default:
            break;
            
    }
    return 0;
}

// commit test

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *MyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    switch (indexPath.section) {
        case 0:{
            NSMutableDictionary* thisDrink = [self.healthyDrinkArray objectAtIndex:indexPath.row];
            MyCell.textLabel.text = [thisDrink objectForKey:@"Name"];
            MyCell.detailTextLabel.text = [thisDrink objectForKey:@"Amount"];
            break;}

        case 1:{
            NSMutableDictionary* thisDrink = [self.sugaryDrinkArray objectAtIndex:indexPath.row];
            MyCell.textLabel.text = [thisDrink objectForKey:@"Name"];
            MyCell.detailTextLabel.text = [thisDrink objectForKey:@"Amount"];
            break;}
        case 2:{
            NSMutableDictionary* thisDrink = [self.caffeineDrinkArray objectAtIndex:indexPath.row];
            MyCell.textLabel.text = [thisDrink objectForKey:@"Name"];
            MyCell.detailTextLabel.text = [thisDrink objectForKey:@"Amount"];
            break;}
        case 3:{
            NSMutableDictionary* thisDrink = [self.alcoholDrinkArray objectAtIndex:indexPath.row];
            MyCell.textLabel.text = [thisDrink objectForKey:@"Name"];
            MyCell.detailTextLabel.text = [thisDrink objectForKey:@"Amount"];
            break;}
            break;
            default:
            break;
            
    }
    
  //  MyCell.detailTextLabel.delgate = self;
    MyCell.detailTextLabel.tag = indexPath.row;
    
    return MyCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.pickerViewContainer.hidden = NO;
    self.pickerView.hidden = NO;
    
    [self showDatePicker];
    self.currentIndexPath = indexPath;
    switch (indexPath.section)
    {
        case 0:{
            NSMutableDictionary* thisDrink = [self.healthyDrinkArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [thisDrink objectForKey:@"Name"];
            break;}
            
        case 1:{
            NSMutableDictionary* thisDrink = [self.sugaryDrinkArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [thisDrink objectForKey:@"Name"];
            break;}
            
        case 2:{
            NSMutableDictionary* thisDrink = [self.caffeineDrinkArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [thisDrink objectForKey:@"Name"];
            break;}
            
        case 3:{
            NSMutableDictionary* thisDrink = [self.alcoholDrinkArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [thisDrink objectForKey:@"Name"];
            break;}
            
        default:
            break;
    }
   // [self addHealthyDrinkArrayObjectAtIndex:indexPath.row];
}
    
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    self.chooseDrinkCell.checkImage.hidden = NO;
// //   self.pickerView.date = [self.dataArray objectAtIndex:indexPath.row];
//    self.
//
//    self.pickerViewContainer.hidden = NO;
//    self.pickerView.hidden = NO;
//    
//    [self showDatePicker];
//    
//    switch (indexPath.section)
//    {
//        case 0:
//            self.drinkPickerLabel.text = [self.healthyDrinkArray objectAtIndex:indexPath.row];
//            break;
//    
//        case 1:
//            self.drinkPickerLabel.text = [self.sugaryDrinkArray objectAtIndex:indexPath.row];
//            break;
//    
//        case 2:
//            self.drinkPickerLabel.text = [self.caffeineDrinkArray objectAtIndex:indexPath.row];
//            break;
//        case 3:
//            self.drinkPickerLabel.text = [self.alcoholDrinkArray objectAtIndex:indexPath.row];
//            break;
//            default:
//            break;
//    }
//    [self addHealthyDrinkArrayObjectAtIndex:indexPath.row];
//}

//
//-(void)addHealthyDrinkArrayObjectAtIndex:(NSInteger)integer {
//    NSString* newHealthyDrink = [self.healthyDrinkArray objectAtIndex:integer];
//    [self.day.healthyDrinkArray addObject:newHealthyDrink];
//    [self.drinkTrackerViewController.thisTableView reloadData];
//}

//
//-(void)addHealthyDrinkArrayObjectAtIndex:(NSInteger)integer {
//    NSString* newHealthyDrink = [self.healthyDrinkArray objectAtIndex:integer];
////    [self.day.healthyDrinkArray addObject:newHealthyDrink];
//    [self.drinkTrackerViewController.thisTableView reloadData];
//}

-(IBAction)datePickerDoneButtonTapped:(id)sender {
    //[self hideDatePicker];
    self.pickerViewContainer.hidden = YES;

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
    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
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
                         [self.pickerViewContainer removeFromSuperview];
                     }];
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    

        return 2;

}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0)
    return self.amtArray.count;

    else {
        return 1;
    }
}

- (NSString*)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;

    if (component == 0)
    {
        title = self.amtArray[row];
    }
    else {
        title = @"Cup(s)";
    }
    
    return title;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (self.currentIndexPath.section)
    {
        case 0:{
            NSMutableDictionary* thisDrink = [self.healthyDrinkArray objectAtIndex:self.currentIndexPath.row];
            [thisDrink setObject:[self.amtArray objectAtIndex:row] forKey:@"Amount"];
            break;}
        case 1:{
            NSMutableDictionary* thisDrink = [self.sugaryDrinkArray objectAtIndex:self.currentIndexPath.row];
            [thisDrink setObject:[self.amtArray objectAtIndex:row] forKey:@"Amount"];
            break;}
            
        case 2:{
            NSMutableDictionary* thisDrink = [self.caffeineDrinkArray objectAtIndex:self.currentIndexPath.row];
            [thisDrink setObject:[self.amtArray objectAtIndex:row] forKey:@"Amount"];
            break;}
            
        case 3:{
            NSMutableDictionary* thisDrink = [self.alcoholDrinkArray objectAtIndex:self.currentIndexPath.row];
            [thisDrink setObject:[self.amtArray objectAtIndex:row] forKey:@"Amount"];
            break;}
            
        default:
            break;
    }
    
    [self.thisTableView reloadData];
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0)
    {
        return (self.view.frame.size.width * 25 ) / 100  ;
    }
    else
    {
        return (self.view.frame.size.width * 25 ) / 100  ;
    }
}




//    chooseDrinkCell.selectionStyle = UITableViewCellSelectionStyleNone;
//    MyCell.accessoryType = UITableViewCellAccessoryNone;


@end
