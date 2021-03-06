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

    
//    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
//    self.navigationController.navigationBar.titleTextAttributes = size;
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
//   self.navigationItem.backBarButtonItem.title = @"Back";
    
  //  [self.drinkTrackerViewController loadPersistent];
    
   // self.chooseDrinkCell.checkImage.hidden = YES;
    
  //  self.day = [self.appDelegate dayForDateOffset:0];
    self.pickerViewContainer.hidden = YES;
    
    [self loadArrays];

    // set custom navbar
    self.titleLabel.text = @"Choose Drinks";
    self.navbarView.backgroundColor =   [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    self.titleLabel.backgroundColor =   [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    self.titleLabel.textColor = [UIColor whiteColor];
    
    // set frames and search button
     self.searchBarShowRect = CGRectMake(0,44, self.view.bounds.size.width, 44);
     self.searchBarHideRect = CGRectMake(0,44, self.view.bounds.size.width, 0);
    self.searchBar.frame = self.searchBarHideRect;
    [self.searchLabel setText:[[NSString alloc] initWithUTF8String:"\xF0\x9F\x94\x8D"]];
    [self.searchLabel sizeToFit];
    
    self.navbarView.frame = CGRectMake(0,0, self.view.bounds.size.width, 44);
    self.containerView.frame = CGRectMake(0,44, self.view.bounds.size.width, self.view.bounds.size.height-44);


}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void) saveDrinks
{
    for (NSMutableDictionary* drinkDict in self.healthyDrinkArray)
    {
        if ([[drinkDict objectForKey:@"Amount"] integerValue] > 0)
        {
            Drink* thisDrink = [[Drink alloc]init];
            thisDrink.drinkName = [drinkDict objectForKey:@"Name"];
            thisDrink.drinkTextField = [[UITextField alloc] init];
            thisDrink.drinkTextField.text = [drinkDict objectForKey:@"Name"];
            thisDrink.amount = [drinkDict objectForKey:@"Amount"];
            thisDrink.unit = @"Cup";
            thisDrink.isChosen = YES;
            thisDrink.indexString= @"index string";
            thisDrink.drinkType = DrinkTypeWater;
            [self.appDelegate.day.drinksArray addObject:thisDrink];
        }
    }
    
    for (NSMutableDictionary* drinkDict in self.milkDrinkArray)
    {
        if ([[drinkDict objectForKey:@"Amount"] integerValue] > 0)
        {
            Drink* thisDrink = [[Drink alloc]init];
            thisDrink.drinkName = [drinkDict objectForKey:@"Name"];
            thisDrink.drinkTextField = [[UITextField alloc] init];
            thisDrink.drinkTextField.text = [drinkDict objectForKey:@"Name"];
            thisDrink.amount = [drinkDict objectForKey:@"Amount"];
            thisDrink.unit = @"Cup";
            thisDrink.isChosen = YES;
            thisDrink.indexString= @"index string";
            thisDrink.drinkType = DrinkTypeMilk;
            [self.appDelegate.day.drinksArray addObject:thisDrink];
        }
    }

     for (NSMutableDictionary* drinkDict in self.sugaryDrinkArray)
    {
        if ([[drinkDict objectForKey:@"Amount"] integerValue] > 0)
        {
            Drink* thisDrink = [[Drink alloc]init];
            thisDrink.drinkName = [drinkDict objectForKey:@"Name"];
            thisDrink.drinkTextField = [[UITextField alloc] init];
            thisDrink.drinkTextField.text = [drinkDict objectForKey:@"Name"];
            thisDrink.amount = [drinkDict objectForKey:@"Amount"];
            thisDrink.unit = @"Cup";
            thisDrink.isChosen = YES;
            thisDrink.indexString= @"index string";
            thisDrink.drinkType = DrinkTypeSugar;
            [self.appDelegate.day.drinksArray addObject:thisDrink];
        }
    }
    for (NSMutableDictionary* drinkDict in self.caffeineDrinkArray)
    {
        if ([[drinkDict objectForKey:@"Amount"] integerValue] > 0)
        {
            Drink* thisDrink = [[Drink alloc]init];
            thisDrink.drinkName = [drinkDict objectForKey:@"Name"];
            thisDrink.drinkTextField = [[UITextField alloc] init];
            thisDrink.drinkTextField.text = [drinkDict objectForKey:@"Name"];
            thisDrink.amount = [drinkDict objectForKey:@"Amount"];
            thisDrink.unit = @"Cup";
            thisDrink.isChosen = YES;
            thisDrink.indexString= @"index string";
            thisDrink.drinkType = DrinkTypeCaffeine;
            [self.appDelegate.day.drinksArray addObject:thisDrink];
        }
    }
    for (NSMutableDictionary* drinkDict in self.alcoholDrinkArray)
    {
        if ([[drinkDict objectForKey:@"Amount"] integerValue] > 0)
        {
            Drink* thisDrink = [[Drink alloc]init];
            thisDrink.drinkName = [drinkDict objectForKey:@"Name"];
            thisDrink.drinkTextField = [[UITextField alloc] init];
            thisDrink.drinkTextField.text = [drinkDict objectForKey:@"Name"];
            thisDrink.amount = [drinkDict objectForKey:@"Amount"];
            thisDrink.unit = @"Cup";
            thisDrink.isChosen = YES;
            thisDrink.indexString= @"index string";
            thisDrink.drinkType = DrinkTypeAlcohol;
            [self.appDelegate.day.drinksArray addObject:thisDrink];
        }
    }
    [self.appDelegate savePersistent];

}
-(void)dismiss
{
    
    [self saveDrinks];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)resetDay {
    [self.thisTableView reloadData];
    
}

-(void)updateData
{
    [self resetDay];
}


-(void)showSearchBar
{
   
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarShowRect;
                         self.containerView.frame = CGRectMake(0,88, self.view.bounds.size.width, self.view.bounds.size.height-88);
                     }
                     completion:^(BOOL finished){

                     }];
}
-(void)hideSearchBar
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarHideRect;
                        self.containerView.frame = CGRectMake(0,44, self.view.bounds.size.width, self.view.bounds.size.height-44);
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

-(IBAction)navbarButtonTapped:(UIButton*)sender
{
    switch (sender.tag) {
  case 1:
    [self dismiss];
    break;
  case 2:
    [self showSearchBar];
    [self.searchBar becomeFirstResponder];
    break;
  default:
    break;
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self filterArrayWith:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self hideSearchBar];
    [self.searchBar resignFirstResponder];
    [self filterArrayWith:@""];
}


-(void)filterArrayWith:(NSString*)filter
{
    NSPredicate *predicate;
    if (filter.length>0)
    {
        predicate = [NSPredicate predicateWithFormat:@"Name CONTAINS[cd] %@",filter];
    }
    else
    {
        predicate = [NSPredicate predicateWithFormat:@"Name like[c] \"*\""];
    }
    NSMutableArray *predicates = [NSMutableArray array];

    [predicates addObject:predicate];

    NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
    self.healthyDrinkFilteredArray = [NSMutableArray arrayWithArray:[self.healthyDrinkArray filteredArrayUsingPredicate:compoundPredicate]];
    self.milkDrinkFilteredArray = [NSMutableArray arrayWithArray:[self.milkDrinkArray filteredArrayUsingPredicate:compoundPredicate]];
    self.sugaryDrinkFilteredArray = [NSMutableArray arrayWithArray:[self.sugaryDrinkArray filteredArrayUsingPredicate:compoundPredicate]];
    self.caffeineDrinkFilteredArray = [NSMutableArray arrayWithArray:[self.caffeineDrinkArray filteredArrayUsingPredicate:compoundPredicate]];
    self.alcoholDrinkFilteredArray = [NSMutableArray arrayWithArray:[self.alcoholDrinkArray filteredArrayUsingPredicate:compoundPredicate]];
    self.otherDrinkFilteredArray = [NSMutableArray arrayWithArray:[self.otherDrinkArray filteredArrayUsingPredicate:compoundPredicate]];

    [self.thisTableView reloadData];

}
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
        [headerLabel setText:@"   Milk beverages"];
    else if( section == 2)
        [headerLabel setText:@"   Sugary beverages"];
    else if (section == 3)
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
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    tableView.backgroundColor = [ColorsClass performSelector:NSSelectorFromString([self.appDelegate.backgroundColors objectAtIndex:7])];
    switch (section) {
        case 0:
            return self.healthyDrinkFilteredArray.count;
            break;
        case 1:
            return self.milkDrinkFilteredArray.count;
            break;
        case 2:
            return self.sugaryDrinkFilteredArray.count;
            break;
        case 3:
            return self.caffeineDrinkFilteredArray.count;
            break;
        case 4:
            return self.alcoholDrinkFilteredArray.count;
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
    NSMutableDictionary* thisDrink;
    switch (indexPath.section) {
        case 0:{
            thisDrink = [self.healthyDrinkFilteredArray objectAtIndex:indexPath.row];
            break;}
        case 1:{
            thisDrink = [self.milkDrinkFilteredArray objectAtIndex:indexPath.row];
            break;}
        case 2:{
            thisDrink = [self.sugaryDrinkFilteredArray objectAtIndex:indexPath.row];
            break;}
        case 3:{
            thisDrink = [self.caffeineDrinkFilteredArray objectAtIndex:indexPath.row];
            break;}
        case 4:{
            thisDrink = [self.alcoholDrinkFilteredArray objectAtIndex:indexPath.row];
            break;}

            default:
            break;
            
    }
    MyCell.textLabel.text = [thisDrink objectForKey:@"Name"];
    if ([[thisDrink objectForKey:@"Amount"] integerValue] > 0)
    {
        MyCell.detailTextLabel.text = [NSString stringWithFormat:@"%@ Cup(s)",[thisDrink objectForKey:@"Amount"]];
    }
    else
    {
        MyCell.detailTextLabel.text = @"";
    }
    MyCell.detailTextLabel.tag = indexPath.row;
    
    return MyCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
     [self.searchBar resignFirstResponder];

    self.currentIndexPath = indexPath;
    self.currentSelection = indexPath.row;
    switch (indexPath.section)
    {
        case 0:{
            self.thisDrinkDict = [self.healthyDrinkFilteredArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [self.thisDrinkDict objectForKey:@"Name"];
            self.selectedDrinkType = DrinkTypeWater;
            break;}
            
        case 1:{
            self.thisDrinkDict = [self.milkDrinkFilteredArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [self.thisDrinkDict objectForKey:@"Name"];
            self.selectedDrinkType = DrinkTypeMilk;
            break;}
            
        case 2:{
            self.thisDrinkDict = [self.sugaryDrinkFilteredArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [self.thisDrinkDict objectForKey:@"Name"];
            self.selectedDrinkType = DrinkTypeSugar;
            break;}
            
        case 3:{
            self.thisDrinkDict = [self.caffeineDrinkFilteredArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [self.thisDrinkDict objectForKey:@"Name"];
            self.selectedDrinkType = DrinkTypeCaffeine;
            break;}
            
        case 4:{
            self.thisDrinkDict = [self.alcoholDrinkFilteredArray objectAtIndex:indexPath.row];
            self.drinkPickerLabel.text = [self.thisDrinkDict objectForKey:@"Name"];
            self.selectedDrinkType = DrinkTypeAlcohol;
            break;}

            
        default:
            break;
    }
    NSArray* arrays = [NSArray arrayWithObjects:self.amtArray,[NSArray arrayWithObject:@"Cup(s)"], nil];
    [self addPickerViewForArrays:arrays
    defaultValues:nil animated:NO
    withTitle:[self.thisDrinkDict objectForKey:@"Name"] tag:1];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
 return self.pickerComponentsArrays.count;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
 NSArray* thisArray = [self.pickerComponentsArrays objectAtIndex:component];
 return thisArray.count;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

 NSArray* thisArray = [self.pickerComponentsArrays objectAtIndex:component];
 NSString *rowItem = [thisArray objectAtIndex:row];
 UILabel *lblRow = [[UILabel alloc] init];
 lblRow.frame = CGRectMake(0.0f, 0.0f, [pickerView bounds].size.width, 44.0f);
 [lblRow setTextAlignment:NSTextAlignmentCenter];
 if (component == 0)
 {
    [lblRow setFont:[UIFont systemFontOfSize:24.0]];
    [lblRow setTextColor: [UIColor blackColor]];
 }
 else if (component == 1)
 {
    [lblRow setFont:[UIFont systemFontOfSize:18.0]];
    [lblRow setTextColor: [UIColor darkGrayColor]];
 }
 
 [lblRow setText:rowItem];
 [lblRow setBackgroundColor:[UIColor clearColor]];
 

 return lblRow;
}

- (void)pickerViewDidSelect:(UIPickerView *)pickerView tag:(NSInteger)tag
{
    NSInteger row = [pickerView selectedRowInComponent:0];
    [self.thisDrinkDict setObject:[self.amtArray objectAtIndex:row] forKey:@"Amount"];
    [self.thisTableView reloadData];
    
}
//
//-(void) showDatePickerForIndex:(NSInteger)selection {
//
//    if (selection == -1)
//    {
//        [self hideDatePicker];
//    }
//    else if (selection == 0)
//    {
//        if (self.currentSelection == 1)
//        {
//            [self hideDatePicker];
//            [self performSelector:@selector(showDatePicker) withObject:nil afterDelay:0.25];
//
//        }
//        else if (self.currentSelection < 0)
//        {
//            [self showDatePicker];
//        }
//
//    }
//    else if (selection == 1)
//    {
//        if (self.currentSelection == 0)
//        {
//            [self hideDatePicker];
//            [self performSelector:@selector(showDatePicker) withObject:nil afterDelay:0.25];
//
//        }
//        else if (self.currentSelection < 0)
//        {
//            [self showDatePicker];
//        }
//    }
//    self.currentSelection = selection;
//}
//
//-(void) showDatePicker
//{
//
//    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         [self.view addSubview:self.pickerViewContainer];
//                         self.pickerViewContainer.frame = showRect;
//                     }
//                     completion:^(BOOL finished){
//
//                     }];
//}
//
//-(void) hideDatePicker
//{
//
//    if (self.pickerViewContainer)
//    {
//        CGRect    hideRect = CGRectMake(0,self.view.bounds.size.height, self.view.bounds.size.width, 0);
//        [UIView animateWithDuration:0.2
//                         animations:^{
//                             self.pickerViewContainer.frame = hideRect;
//                         }
//                         completion:^(BOOL finished){
//                             [self.pickerViewContainer removeFromSuperview];
//                         }];
//    }
//
//}
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
//
//
//        return 2;
//
//}
//
//- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
//
//    if (component == 0)
//    return self.amtArray.count;
//
//    else {
//        return 1;
//    }
//}
//
//- (NSString*)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    NSString *title;
//
//    if (component == 0)
//    {
//        title = self.amtArray[row];
//    }
//    else {
//        title = @"Cup(s)";
//    }
//
//    return title;
//}
//
//
//
//-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//    if (component == 0)
//    {
//        return (self.view.frame.size.width * 25 ) / 100  ;
//    }
//    else
//    {
//        return (self.view.frame.size.width * 25 ) / 100  ;
//    }
//}
//

-(void)loadArrays
{
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
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Unsweetened coconut water",@"Name",
                               @"0",@"Amount",nil],
                              nil];
    
    self.milkDrinkArray = [NSMutableArray arrayWithObjects:
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Milk",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Soy milk",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Almond milk",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Rice milk",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Cashew milk",@"Name",
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
                              @"Frappuccino",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Flavored latte",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Flavored soy milk",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Flavored almond milk",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Flavored rice milk",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Flavored cashew milk",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Flavored milk",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Sweetened coconut water",@"Name",
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
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Gatorade",@"Name",
                              @"0",@"Amount",nil],
                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              @"Powerade",@"Name",
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
                               @"Rockstar",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Green tea",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                @"Black tea",@"Name",
                                @"0",@"Amount",nil],
                              nil];
    
    self.alcoholDrinkArray = [NSMutableArray arrayWithObjects:
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Wine",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Beer",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Cocktail",@"Name",
                               @"0",@"Amount",nil],
                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"Hard liquor",@"Name",
                               @"0",@"Amount",nil],
                              nil];
    

    self.healthyDrinkFilteredArray = [NSMutableArray arrayWithArray:self.healthyDrinkArray];
    self.milkDrinkFilteredArray = [NSMutableArray arrayWithArray:self.milkDrinkArray];
    self.sugaryDrinkFilteredArray = [NSMutableArray arrayWithArray:self.sugaryDrinkArray];
    self.caffeineDrinkFilteredArray = [NSMutableArray arrayWithArray:self.caffeineDrinkArray];
    self.alcoholDrinkFilteredArray = [NSMutableArray arrayWithArray:self.alcoholDrinkArray];
    self.otherDrinkFilteredArray = [NSMutableArray arrayWithArray:self.otherDrinkArray];
    [self.thisTableView reloadData];
}

//    chooseDrinkCell.selectionStyle = UITableViewCellSelectionStyleNone;
//    MyCell.accessoryType = UITableViewCellAccessoryNone;


@end
