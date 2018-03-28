//
//  FoodTrackerViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "FoodTrackerViewController.h"
#import "FoodTrackerCell.h"
#import "AddFoodCell.h"
#import "ChoosePlateViewController.h"
#import "Food.h"
#import "TIHDate.h"
#import "Day.h"
#import "AppDelegate.h"
#import "AbstractViewController.h"
#import "GenericWebViewController2.h"
#import "UnderstandBalanceViewController.h"
#import "DisclaimerViewController.h"
#import "DirectionsViewController.h"
#import "MasterTrackerViewController.h"

@interface FoodTrackerViewController ()
@property (nonatomic, strong) NSMutableArray *breakfastArray;
@property (nonatomic, strong) NSMutableArray *lunchArray;
@property (nonatomic, strong) NSMutableArray *dinnerArray;
@property (nonatomic, strong) NSMutableArray *snackArray;


@end



@implementation FoodTrackerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }

    return self;
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.continueButton.enabled = NO;

    [self.thisTableView reloadData];
    

    self.pickerViewContainer.hidden = YES;
    self.pickerView.hidden = YES;
    
    self.directionsView.hidden = YES;

    

    
    self.plateImageArray = [NSArray arrayWithObjects:
                            @"Balanced Plate.png",
                            @"Balanced Plate2.png",
                            @"Balanced Plate3.png",
                            @"Balanced Plate4.png",
                            nil];
    
    self.addCellArray = [NSArray arrayWithObjects:@"+ Add food", nil];

    
    self.waterAmountArray = [NSArray arrayWithObjects:
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
    
    self.dessertAmountArray = [NSArray arrayWithObjects:
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
    

    



    [self resetDay];

    
}



-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self checkDirectionsView];

}



-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self resetDay];
    
}



-(void)dismissOpeningViewController {

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(IBAction)continueProgram:(id)sender {
//    self.openingView.hidden = YES;
//    [[NSUserDefaults standardUserDefaults] setBool:self.isAgree forKey:@"isAgree"];
//    self.navigationItem.title = @"Track food";
//}
//
//-(IBAction)termsConditions:(id)sender {
//    
//    DisclaimerViewController* disclaimerViewController = (DisclaimerViewController*)
//    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//     instantiateViewControllerWithIdentifier:@"DisclaimerViewController"];
//    [self.navigationController pushViewController:disclaimerViewController animated:YES];
//    
//}





-(void)resetDay {
    
    [self updateArrays];
    [self.thisTableView reloadData];
    
}

-(void)updateData
{
    [self resetDay];
}


-(void)updateArrays
{
    NSInteger i = 0;
    for (Food* item in self.appDelegate.day.foodArray)
    {
        item.foodArrayIndex = i;
        i++;
    }
    
    self.breakfastArray = [self find:mealTypeBreakfast inArray:self.appDelegate.day.foodArray];
    self.lunchArray = [self find:mealTypeLunch inArray:self.appDelegate.day.foodArray];
    self.dinnerArray  = [self find:mealTypeDinner inArray:self.appDelegate.day.foodArray];
    self.snackArray = [self find:mealTypeSnack inArray:self.appDelegate.day.foodArray];

}


-(NSMutableArray*)find:(NSInteger)section inArray:(NSMutableArray*)array
{
    NSMutableArray* filterArray = [NSMutableArray array];
    for (id item in array)
    {
        if ([item isKindOfClass:[Food class]])
        {
            Food* thisItem = (Food*)item;
            NSInteger thisType = thisItem.mealType;
            if (thisType == section)
            {
                [filterArray addObject:item];
            }
        
        }
    }
    return filterArray;
    
}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if(indexPath.section == mealTypeWater) {
        return 35;
    }
    else
    {
    return 70;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 35;
    
    return h;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 5;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    switch (section) {
        case mealTypeBreakfast:
            return self.breakfastArray.count;
            break;
        case mealTypeLunch:
            return self.lunchArray.count;
            break;
        case mealTypeDinner:
            return  self.dinnerArray.count;
            break;
        case mealTypeSnack:
            return self.snackArray.count;
            break;
        case mealTypeWater:
            return 1;
            // return self.appDelegate.day.waterArray.count;
            break;
        default:
            break;
            
    }
    return 0;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 30)];
    [headerView setBackgroundColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.bounds.size.width, 22)];
     headerLabel.font = [UIFont boldSystemFontOfSize:18];
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [addButton addTarget:self action:@selector(addFood:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(self.view.bounds.size.width-60, 2.5, 28, 28);
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
    addButton.tag = section;
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.cornerRadius = 15;
    
    UIButton *addWaterButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [addWaterButton addTarget:self action:@selector(increaseWater) forControlEvents:UIControlEventTouchUpInside];
    addWaterButton.frame=CGRectMake(self.view.bounds.size.width-60, 2.5, 28, 28);
    [addWaterButton setTitle:@"+" forState:UIControlStateNormal];
    [addWaterButton setTitleColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
    addWaterButton.backgroundColor = [UIColor whiteColor];
    addWaterButton.layer.cornerRadius = 15;

    
    UIButton *removeWaterButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [removeWaterButton addTarget:self action:@selector(decreaseWater) forControlEvents:UIControlEventTouchUpInside];
    removeWaterButton.frame=CGRectMake(self.view.bounds.size.width-120, 2.5, 28, 28);
    [removeWaterButton setTitle:@"-" forState:UIControlStateNormal];
    [removeWaterButton setTitleColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
    removeWaterButton.backgroundColor = [UIColor whiteColor];
    removeWaterButton.layer.cornerRadius = 15;
    

    
    if (section == mealTypeBreakfast)
        [headerLabel setText:@"Breakfast"];
    else if (section == mealTypeLunch)
        [headerLabel setText:@"Lunch"];
    else if (section == mealTypeDinner)
        [headerLabel setText:@"Dinner"];
    else if (section == mealTypeSnack)
        [headerLabel setText:@"Snacks"];
    else if (section == mealTypeWater)
        [headerLabel setText:@"Water"];

    if (section == mealTypeWater) {
    [headerView addSubview:headerLabel];
    [headerView addSubview:addWaterButton];
    [headerView addSubview:removeWaterButton];
    }
 
    else {
        [headerView addSubview:headerLabel];
    [headerView addSubview:addButton];
    }
    return headerView;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    FoodTrackerCell *MyCell = (FoodTrackerCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    MyCell.foodTrackerViewController = self;
    MyCell.row = indexPath.row;
    switch (indexPath.section) {
        case mealTypeBreakfast:{
            MyCell.waterCups = nil;
            MyCell.food = [self.breakfastArray objectAtIndex:indexPath.row];
            [MyCell refreshFoodCell];
            break;}
        case mealTypeLunch:{
            MyCell.waterCups = nil;
            MyCell.food = [self.lunchArray objectAtIndex:indexPath.row];
            [MyCell refreshFoodCell];
            break;}
        case mealTypeDinner:{
            MyCell.waterCups = nil;
            MyCell.food = [self.dinnerArray objectAtIndex:indexPath.row];
            [MyCell refreshFoodCell];
            break;}
        case mealTypeSnack:{
            MyCell.waterCups = nil;
            MyCell.food = [self.snackArray objectAtIndex:indexPath.row];
            [MyCell refreshFoodCell];
            break;}
        case mealTypeWater:{
            MyCell.food = nil;
            MyCell.waterCups = self.appDelegate.day.waterCupsString;
            [MyCell refreshFoodCell];
            break;}
        default:
            break;
    }

    
    [MyCell refreshFoodCell];
    return MyCell;

}

//-(void)foodSelected:(Food*)food
//{
//    [self.appDelegate.day.foodArray addObject:food];
//    [self updateArrays];
//    [self resetDay];
//
//
//}
//
//-(void)foodUpdated:(Food*)food
//{
//    [self.appDelegate.day.foodArray replaceObjectAtIndex:food.foodArrayIndex withObject:food];
//    [self updateArrays];
//    [self resetDay];
//    
//}
//
//-(void)moodSelected:(Food*)food
//{
//    [self.appDelegate.day.moodArray addObject:food];
//    [self updateMoodArrays];
//    [self resetDay];
//    
//    
//}
//
//-(void)moodUpdated:(Food*)food
//{
//    [self.appDelegate.day.foodArray replaceObjectAtIndex:food.moodArrayIndex withObject:food];
//    [self updateMoodArrays];
//    [self resetDay];
//    
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == mealTypeWater)
    {
        [self addWater:nil];
    }
    else
    {
        ChoosePlateViewController* choosePlateViewController = (ChoosePlateViewController*)
        [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
         instantiateViewControllerWithIdentifier:@"ChoosePlateViewController"];
         choosePlateViewController.foodTrackerViewController = self;
        switch (indexPath.section) {
            case mealTypeBreakfast:{
                choosePlateViewController.food = [self.breakfastArray objectAtIndex:indexPath.row];
            }
                break;
            case mealTypeLunch:{
                choosePlateViewController.food =[self.lunchArray objectAtIndex:indexPath.row];
            }
                break;
                
            case mealTypeDinner:{
                choosePlateViewController.food =[self.dinnerArray objectAtIndex:indexPath.row];
            }
                break;
            case mealTypeSnack:{
                choosePlateViewController.food =[self.snackArray objectAtIndex:indexPath.row];
            }
                break;

            default:
                break;
        }
   
        [self.navigationController pushViewController:choosePlateViewController animated:YES];
    }
}





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

#pragma mark - Table edit methods

-(void) enterEditingMode:(id)sender  {
    if (self.thisTableView.editing) {
        [self.thisTableView setEditing:NO animated:YES];
    } else {
        [self.thisTableView setEditing:YES animated:YES];
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 4)
        
        return NO;
    
    else {
        return YES;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FoodTrackerCell* thisCell = [tableView  cellForRowAtIndexPath:indexPath];
    Food* thisFood = thisCell.food;
    [self.appDelegate.day.foodArray removeObjectAtIndex:thisFood.foodArrayIndex];
    [self resetDay];
    [tableView reloadData];
    
}


-(IBAction)addFood:(UIButton*)sender {
    ChoosePlateViewController* choosePlateViewController = (ChoosePlateViewController*)
    [[UIStoryboard storyboardWithName:@"Trackers" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ChoosePlateViewController"];
     choosePlateViewController.foodTrackerViewController = self;
    choosePlateViewController.mealType = sender.tag;
   // [self.navigationController pushViewController:choosePlateViewController animated:YES];

    
    [self.masterTrackerViewController addFood:choosePlateViewController];
}

-(void)increaseWater{
    NSInteger nextIndex = [self.appDelegate.day.waterCupsString integerValue]+1;
    if (nextIndex < self.waterAmountArray.count-1)
    {
        self.appDelegate.day.waterCupsString = [self.waterAmountArray objectAtIndex:nextIndex];
        [self.thisTableView reloadData];
    }
    
}

-(void)decreaseWater{
    NSInteger nextIndex = [self.appDelegate.day.waterCupsString integerValue]-1;
    if (nextIndex < self.waterAmountArray.count-1)
    {
        self.appDelegate.day.waterCupsString = [self.waterAmountArray objectAtIndex:nextIndex];
        [self.thisTableView reloadData];
    }
    
}

-(IBAction)addWater:(id)sender {
    
    [self showPickerView];
}

#pragma PickerView Delegates

//how to add images to pickerview
//pickerImageView.image = [UIImage imageNamed:imageData[row]];

-(IBAction)pickerDoneButtonTapped:(id)sender {
    [self hidePickerView];
//    self.pickerViewContainer.hidden = YES;
    [self.thisTableView reloadData];
    
}

//-(void) showPickerForIndex:(NSInteger)selection {
//
//    if (selection == -1)
//    {
//        [self hidePickerView];
//    }
//    else if (selection == 0)
//    {
//        if (self.currentSelection == 1)
//        {
//            [self hidePickerView];
//            [self performSelector:@selector(showDatePicker) withObject:nil afterDelay:0.25];
//
//        }
//        else if (self.currentSelection < 0)
//        {
//            [self showPickerView];
//        }
//
//    }
//    else if (selection == 1)
//    {
//        if (self.currentSelection == 0)
//        {
//            [self hidePickerView];
//            [self performSelector:@selector(showDatePicker) withObject:nil afterDelay:0.25];
//
//        }
//        else if (self.currentSelection < 0)
//        {
//            [self showPickerView];
//        }
//    }
//    self.currentSelection = selection;
//}
//
//-(void) showDatePicker
//{
//    CGRect    hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 250);
//    self.datePickerViewContainer.frame = hideRect;
//    self.datePickerViewContainer.hidden = NO;
//    [self.datePickerView setDate:self.appDelegate.day.date animated:NO];
//    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         self.datePickerViewContainer.frame = showRect;
//                     }
//                     completion:^(BOOL finished){
//
//                     }];
//}
//
//-(void) hideDatePicker
//{
//
//    CGRect    hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 250);
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         self.datePickerViewContainer.frame = hideRect;
//
//                     }
//                     completion:^(BOOL finished){
//                         self.datePickerViewContainer.hidden = YES;
//                     }];
//
//
//
//}

-(void) showPickerView
{
    CGRect    hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 0);
    self.pickerViewContainer.frame = hideRect;
    self.pickerViewContainer.hidden = NO;
    self.pickerView.hidden = NO;

    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
    
    [self.pickerView selectRow:[self.appDelegate.day.waterCupsString integerValue] inComponent:0 animated:NO];
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.pickerViewContainer.frame = showRect;
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
                        self.pickerViewContainer.hidden = YES;
                        self.pickerView.hidden = YES;
                     }];
    
    
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;

    if (component == 0)
    {
        title = [self.waterAmountArray objectAtIndex:row];
    }
    else {
            title = @"Cups";
    }


    NSAttributedString *attString =
        [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];

    return attString;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {

    //NSLog(@"numberOfComponentsInPickerView %d",2);
    return 2;
    
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {

    if (component == 0)
    {
       // NSLog(@"numberOfRowsInComponent 0 %lu",self.waterAmountArray.count);
        return self.waterAmountArray.count;
    }
    else {
       // NSLog(@"numberOfRowsInComponent 1 %d",1);
        return 1;
    }
}

//- (NSString*)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//
//    NSString *title;
//
//    if (component == 0)
//    {
//        title = [self.waterAmountArray objectAtIndex:row];
//    }
//    else {
//            title = @"Cups";
//    }
//
//    return title;
//}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.appDelegate.day.waterCupsString = [self.waterAmountArray objectAtIndex:row];
    [self.thisTableView reloadData];
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0)
    {
      //   NSLog(@"widthForComponent 0 %f",(self.view.frame.size.width * 25 ) / 100);
        return (self.view.frame.size.width * 25 ) / 100  ;
    }
    else
    {
      //  NSLog(@"widthForComponent 1 %f",(self.view.frame.size.width * 25 ) / 100);
        return (self.view.frame.size.width * 25 ) / 100  ;
    }
}

-(void)checkDirectionsView
{
    self.isShow = [[NSUserDefaults standardUserDefaults]boolForKey:@"isShow"];
    if (self.isShow == YES) {
        
    }
    else {
        
        [self.noShowButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        [self showDirectionsView];
        
    }


}

-(IBAction)noShow:(id)sender {
    
    
    if (self.isShow) {
        self.isShow = NO;
        [self.noShowButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    else {
        
        self.isShow = YES;
        [self.noShowButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:self.isShow forKey:@"isShow"];
    
}

-(void) showDirectionsView
{
    CGRect    hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 0);
    self.directionsView.frame = hideRect;
    self.directionsView.hidden = NO;
    CGRect  showRect = CGRectMake(0,self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.directionsView.frame = showRect;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void) hideDirectionsView
{
    
    CGRect    hideRect = CGRectMake(0,self.view.bounds.size.height, 320, 0);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.directionsView.frame = hideRect;
                     }
                     completion:^(BOOL finished){
                        self.directionsView.hidden = YES;
                     }];
    
    
}


-(IBAction)doneDirectionView:(id)sender {
   [self hideDirectionsView];
}


-(IBAction)directions:(id)sender {

            GenericWebViewController2* genericWebViewController2 = (GenericWebViewController2*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController2"];
            genericWebViewController2.webViewType2 = 3;
            [self.navigationController pushViewController:genericWebViewController2 animated:YES];
    
//    DirectionsViewController* directionsViewController = (DirectionsViewController*)
//    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//     instantiateViewControllerWithIdentifier:@"DirectionsViewController"];
//      [directionsViewController.navigationController setNavigationBarHidden:NO];
//    [self.navigationController pushViewController:directionsViewController animated:YES];
}




@end
