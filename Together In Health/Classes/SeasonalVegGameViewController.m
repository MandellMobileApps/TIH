//
//  SeasonalVegGameViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/7/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "SeasonalVegGameViewController.h"
#import "SeasonalVegInfoViewController.h"
#import "RecipeViewController.h"
#import "SeasonalVegCell.h"
#import "SQLiteAccess.h"
#import "MgNetworkOperation2.h"

@implementation SeasonalVegGameViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
   // self.showVegButton.enabled = NO;
    
    self.mgOperationsQueue = [[NSOperationQueue alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{});

    self.tableViewArray = [NSArray arrayWithObjects:@"State", @"Month", nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   // self.seasonalVegCell.detailTextLabel.text = [defaults objectForKey:@"state"];
  //  self.seasonalVegCell.detailTextLabel.text = [defaults objectForKey:@"month"];
    self.myProduceField.text = [defaults objectForKey:@"myProduceField"];
    
    self.showInfoButton.hidden = YES;
    self.pickerViewMonth.hidden = YES;
    self.pickerViewState.hidden = YES;
    self.pickerViewContainer.hidden = YES;
    
     [self showPickerViewMonth];
    [self showPickerViewState];
    
    self.thisScrollView.contentSize = CGSizeMake(320, 600);

    self.monthArray = [NSArray arrayWithObjects:
                       @"January",
                       @"February",
                       @"March",
                       @"April",
                       @"May",
                       @"June",
                       @"July",
                       @"August",
                       @"September",
                       @"October",
                       @"November",
                       @"December",
                       nil];
    
    self.stateArray = [NSArray arrayWithObjects:
                       @"Alabama",
                       @"Alaska",
                       @"Arizona",
                       @"Arkansas",
                       @"California",
                       @"Colorado",
                       @"Connecticut",
                       @"Delaware",
                       @"Florida",
                       @"Georgia",
                       @"Hawaii",
                       @"Idaho",
                       @"Illinois",
                       @"Indiana",
                       @"Iowa",
                       @"Kansas",
                       @"Kentucky",
                       @"Louisiana",
                       @"Maine",
                       @"Maryland",
                       @"Massachusetts",
                       @"Michigan",
                       @"Minnesota",
                       @"Mississippi",
                       @"Missouri",
                       @"Montana",
                       @"Nebraska",
                       @"Nevada",
                       @"New Hampshire",
                       @"New Jersey",
                       @"New Mexico",
                       @"New York",
                       @"North Carolina",
                       @"North Dakota",
                       @"Ohio",
                       @"Oklahoma",
                       @"Oregon",
                       @"Pennsylvania",
                       @"Rhode Island",
                       @"South Carolina",
                       @"South Dakota",
                       @"Tennessee",
                       @"Texas",
                       @"Utah",
                       @"Vermont",
                       @"Virgina",
                       @"Washington",
                       @"West Virginia",
                       @"Wisconsin",
                       @"Wyoming",
                       
                       nil];
    

//    
//    NSString* sql1 = @"SELECT * FROM TranslatorFemale ORDER by RecordId";
//    NSArray* myArray1 = [SQLiteAccess selectManyRowsWithSQL:sql1];
//    
//    NSString* sql = @"SELECT * FROM SeasonalVeg WHERE StateType = \"Alabama\" AND MonthType = \"January\";
//    NSArray* myArray = [SQLiteAccess selectManyRowsWithSQL:sql];
    
}
//
//-(IBAction)pickState:(id)sender {
//    self.pickerView.hidden = NO;
//}

#pragma TableView Delegates


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 30;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 40;
    
    return h;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 22)];
    [headerView setBackgroundColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 3, tableView.bounds.size.width, 22)];
    //    [headerLabel setBackgroundColor:[UIColor lightGrayColor]];
    [headerLabel setTextColor:[UIColor whiteColor]];
    
        [headerLabel setText:@"   Choose your state and month"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.tableViewArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    SeasonalVegCell *MyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
   //NSMutableDictionary *temp = [self.dataArray objectAtIndex:indexPath.row];
    
   // MyCell.textLabel.text = [temp objectForKey:@"label"];
    
    MyCell.textLabel.text = [self.tableViewArray objectAtIndex:indexPath.row];
    
        if (indexPath.row == 0) {
            [MyCell.detailTextLabel setText:[self.stateArray objectAtIndex:self.currentStateSelection]];
            [defaults setValue:self.seasonalVegCell.detailTextLabel.text forKeyPath:@"state"];
        }
        
        if (indexPath.row == 1) {
            [MyCell.detailTextLabel setText:[self.monthArray objectAtIndex:self.currentMonthSelection]];
            [defaults setValue:self.seasonalVegCell.detailTextLabel.text forKeyPath:@"month"];
        }

    
   // MyCell.detailTextLabel.text = [self.dateFormatter stringForObjectValue:[temp objectForKey:@"time"]];
    
    //[MyCell.detailTextLabel setText:[self pickerView:self.pickerViewState titleForRow:[self.pickerViewState selectedRowInComponent:1] forComponent:1]];
    
    
    return MyCell;


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self showPickerViewState];
    self.pickerViewContainer.hidden = NO;
    
    if (indexPath.row == 0) {
        [self showPickerViewState];
        self.pickerViewState.hidden = NO;
        [self hidePickerViewMonth];
            self.pickerViewMonth.hidden = YES;
        
        
    }
    
    
    else {
        [self showPickerViewMonth];
        self.pickerViewMonth.hidden = NO;
        [self hidePickerViewState];
            self.pickerViewState.hidden = YES;
        
    }
    
}

#pragma PickerView delegates

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    if (thePickerView == self.pickerViewState) {
        return 1;
    }
        
    else if (thePickerView == self.pickerViewMonth) {
        return 1;
    }
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (thePickerView == self.pickerViewState) {
        return self.stateArray.count;
    }
    
    else if (thePickerView == self.pickerViewMonth) {
        return self.monthArray.count;
    }
    return 0;
    
}

- (NSString*)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
        NSString *title;

    if (thePickerView == self.pickerViewState) {
        title = self.stateArray[row];
    }
    else if (thePickerView == self.pickerViewMonth) {
        title = self.monthArray[row];
}
    return title;
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (thePickerView == self.pickerViewState) {
        
        self.currentStateSelection = row;
        [self.thisTableView reloadData];
        
       // NSLog(@"Selected State: %@. Index of selected color: %li", [self.stateArray objectAtIndex:row], (long)row);
    
    }
    
    else if (thePickerView == self.pickerViewMonth) {
        
    }
    
//    NSLog(@"Selected Month: %@. Index of selected color: %i", [self.monthArray objectAtIndex:row], row);
    
    
    //Now, if you want to navigate then;
    // Say, OtherViewController is the controller, where you want to navigate:
//    OtherViewController *objOtherViewController = [OtherViewController new];
//    [self.navigationController pushViewController:objOtherViewController animated:YES];
    
}

-(IBAction)datePickerDoneButtonTapped:(id)sender {
    [self hidePickerViewState];
    [self hidePickerViewMonth];
    [self hidePickerView];
}

-(void) showPickerViewStateForIndex:(int)selection {
    
    if (selection == -1)
    {
        [self hidePickerView];
    }
    else if (selection == 0)
    {
        if (self.currentStateSelection == 1)
        {

            [self hidePickerView];
            [self performSelector:@selector(showPickerView) withObject:nil afterDelay:0.25];
            
        }
        else if (self.currentStateSelection < 0)
        {
            [self showPickerView];
        }
        
    }
    else if (selection == 1)
    {
        if (self.currentStateSelection == 0)
        {
            [self hidePickerView];
            [self performSelector:@selector(showPickerView) withObject:nil afterDelay:0.25];
            
        }
        else if (self.currentStateSelection < 0)
        {
            [self showPickerView];
        }
    }
    self.currentStateSelection = selection;
}

-(void) showPickerViewMonthForIndex:(int)selection {
    
    if (selection == -1)
    {
        [self hidePickerView];
    }
    else if (selection == 0)
    {
        if (self.currentMonthSelection == 1)
        {
            
            [self hidePickerView];
            [self performSelector:@selector(showPickerView) withObject:nil afterDelay:0.25];
            
        }
        else if (self.currentMonthSelection < 0)
        {
            [self showPickerView];
        }
        
    }
    else if (selection == 1)
    {
        if (self.currentMonthSelection == 0)
        {
            [self hidePickerView];
            [self performSelector:@selector(showPickerView) withObject:nil afterDelay:0.25];
            
        }
        else if (self.currentMonthSelection < 0)
        {
            [self showPickerView];
        }
    }
    self.currentMonthSelection = selection;
}

//-(void)showPickerView
//{
//    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-200, self.view.bounds.size.width, 250);
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         [self.view addSubview:self.pickerViewContainer];
//                         self.pickerViewContainer.frame = showRect;
//                     }
//                     completion:^(BOOL finished){
//                         
//                     }];
//}

-(void)showPickerViewState
{
    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-200, self.view.bounds.size.width, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self.view addSubview:self.pickerViewState];
                         self.pickerViewState.frame = showRect;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void)showPickerViewMonth
{
    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-200, self.view.bounds.size.width, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self.view addSubview:self.pickerViewMonth];
                         self.pickerViewMonth.frame = showRect;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void) hidePickerView
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

-(void) hidePickerViewState
{
    
    CGRect	hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 0);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.pickerViewState.frame = hideRect;
                     }
                     completion:^(BOOL finished){
                         [self.pickerViewState removeFromSuperview];
                     }];
    
    
}

-(void) hidePickerViewMonth
{
    
    CGRect	hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 0);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.pickerViewMonth.frame = hideRect;
                     }
                     completion:^(BOOL finished){
                         [self.pickerViewMonth removeFromSuperview];
                     }];
    
    
}

#pragma VegInfo

-(IBAction)showVegetable:(id)sender {
    
//    if (self.detaildataArray.count > 0)
//    {
    self.myProduceField.hidden = NO;
    
    self.myProduceField.text = [self.object objectForKey:@"Vegetable"];
    
    NSLog (@"Vegetable %@",self.object);
    
    self.myProduceImage.hidden = NO;
    self.showInfoButton.hidden = NO;
        
      //  [self randomVeg];

    
}

-(IBAction)vegInfo:(id)sender {
    SeasonalVegInfoViewController* seasonalVegInfoViewController = (SeasonalVegInfoViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"SeasonalVegInfoViewController"];
    seasonalVegInfoViewController.object = self.object;
    [self.navigationController pushViewController:seasonalVegInfoViewController animated:YES];
}

-(IBAction)recipes:(id)sender {
    
    RecipeViewController* recipeViewController = (RecipeViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"RecipeViewController"];
    [self.navigationController pushViewController:recipeViewController animated:YES];
}

-(IBAction)Market:(id)sender {
    
}

-(IBAction)CSA:(id)sender {
    
}

//-(IBAction)done:(id)sender {
//    
//    if (self.doneButtonOn) {
//        self.doneButtonOn = NO;
////        self.completed.isDone = NO;
//        [self.doneButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
//        
//        
//    }
//    else {
//        
//        self.doneButtonOn = YES;
////        self.completed.isDone = YES;
//        [self.doneButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
//        
//    }
//    
//}

//-(void)getVegetables {
//    
//    NSString* sql = @"SELECT * FROM SeasonalVeg WHERE StateType = \"%@%\" AND MonthType = \"%@%\"";
//    NSArray* myArray = [SQLiteAccess selectManyRowsWithSQL:sql];
//    
//}

-(void) deleteExistingTable
{
    
    
    NSString *sql = @"DROP TABLE IF EXISTS SeasonalVeg";
    [SQLiteAccess updateWithSQL:sql];
    
    [self buildNewTable];
    
}




-(void)buildNewTable
{
    
    NSString* newSql = @"CREATE TABLE \"SeasonalVeg\" (\"StateType\" TEXT, \"MonthType\" TEXT, \"Vegetable\" TEXT, \"VegetableInfo\" TEXT, \"RecordId\" INTEGER DEFAULT (null) )";
    [SQLiteAccess updateWithSQL:newSql];
    
    NSInteger count = self.updatedRecords.count;
    NSInteger i = 0;
    NSInteger start = 0;
    NSInteger thisBlock = 100;
    BOOL complete = NO;
    
    while (!complete)
    {
        
        if ((count-start)<100)
        {
            thisBlock = (count-start);
        }
        
        // "BeenThere" TEXT,"StadiumNote" TEXT,"Stadium" TEXT,"RecordId" INTEGER DEFAULT (null) )
        NSMutableString* sql = [NSMutableString string];
        
        [sql appendFormat:@"INSERT INTO SeasonalVeg ("];
        [sql appendFormat:@"StateType,"];
        [sql appendFormat:@"MonthType,"];
        [sql appendFormat:@"Vegetable,"];
        [sql appendFormat:@"VegetableInfo,"];
        [sql appendFormat:@"RecordId"];
        [sql appendFormat:@") VALUES "];
        
        
        for (i=start; i<(start+thisBlock); i++)
        {
            NSDictionary* item = [self.updatedRecords objectAtIndex:i];
            [sql appendFormat:@"("];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"StateType"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"MonthType"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Vegetable"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"VegetableInfo"]]];
            [sql appendFormat:@"%@",[self checkIntegers:[item objectForKey:@"RecordId"]]];
            [sql appendString:@"),"];
            
        }
        
        NSString* thisSql1 = [sql substringToIndex:sql.length - 1];
        
        [SQLiteAccess insertWithSQL:thisSql1];
        
        // increment new start position
        start = start + thisBlock;
        if (start < (count-1))
        {
            complete = NO;
        }
        else
        {
            complete = YES;
        }
    }
    
    [self runDatabaseQuery];
    
    
}

-(NSString*)checkNull:(id)thisString
{
    if((thisString == [NSNull null]) || ([thisString isEqualToString:@"<NULL>"]) || ([thisString isEqualToString:@"<null>"]) || (!thisString))
    {
        return @"";
    }
    return thisString;
    
}

-(NSString*)checkIntegers:(id)thisString
{
    if((thisString == [NSNull null]) || ([thisString isEqualToString:@"<NULL>"]) || ([thisString isEqualToString:@"<null>"]) || (!thisString))
    {
        return @"0";
    }
    return thisString;
    
}

-(void)runDatabaseQuery
{
    
    //    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    
   // NSString* objects0Sql = @"SELECT * FROM SeasonVeg WHERE StateType = \"%@%\" AND MonthType = \"%@%\"";
    NSString* objects0Sql = @"SELECT * FROM SeasonVeg WHERE StateType = \"Alabama\" AND MonthType = \"January\"";
    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];

    NSLog (@"master objects0 %@",self.objects0);

    [self.thisTableView reloadData];
    
}

-(void)randomVeg
{
NSString* sql = @"SELECT COUNT() FROM SeasonalVeg";
NSArray* myArray = [SQLiteAccess selectManyRowsWithSQL:sql];
NSLog(@"%@", myArray);

// get number of rows
NSDictionary *temp = [myArray objectAtIndex:0];
int rows = [[temp objectForKey:@"COUNT()"] intValue];

// get random
int rnd = [self getRandomNumberWithMax:rows-1];

// filename querry wehere id = max
NSString* sql2 = [NSString stringWithFormat:@"SELECT FileName FROM SeasonalVeg WHERE uniqueId = %i", rnd];
NSArray* myArray2 = [SQLiteAccess selectManyRowsWithSQL:sql2];
NSDictionary* temp2 = [myArray2 firstObject];
NSString *fileName = [temp2 objectForKey:@"FileName"];

//saving current audio file
self.currentSelection = fileName;

}

-(int)getRandomNumberWithMax:(int) max {
    int r = rand() %max; //arc4random_uniform(max);
    return r;
}

-(void)saveDefaults

{
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   [defaults setValue:self.seasonalVegCell.detailTextLabel.text forKeyPath:@"state"];
    [defaults setValue:self.saveArray forKeyPath:@"saveArray"];
    [defaults setValue:self.myProduceField.text forKeyPath:@"myProduceField"];
}

-(void)viewDidDisappear:(BOOL)animated {
    [self saveDefaults];
}


@end
