//
//  ChooseActivityViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ChooseActivityViewController.h"
#import "ChooseActivityCell.h"
#import "Activity.h"
#import "ActivityTrackerViewController.h"
#import "Day.h"
#import "AbstractViewController.h"
#import "AppDelegate.h"

@implementation ChooseActivityViewController 

-(void)viewDidLoad {
    [super viewDidLoad];
    

    [self filterContentForFavorites];
    
    self.title = @"Choose Activity";
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationItem.hidesBackButton = NO;
    
    self.navbarView.backgroundColor =   [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    self.titleLabel.backgroundColor =   [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = @"Choose Activity";
    
    [self.searchLabel setText:[[NSString alloc] initWithUTF8String:"\xF0\x9F\x94\x8D"]];
    [self.searchLabel sizeToFit];
    
    self.amtdescArray = [NSArray arrayWithObjects:@"Minute(s)", nil];
    
    self.filteredActivityArray = [NSMutableArray arrayWithArray:self.appDelegate.allActivities];
    [self.thisTableView reloadData];
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 50;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 35;
    
    return h;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.favoriteActivities.count;
            break;
        case 1:{
            return self.filteredActivityArray.count;
        }
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
    
    if (section == 0)
        [headerLabel setText:@"   Favorite Activities"];
    else 
        [headerLabel setText:@"   All Activities"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    ChooseActivityCell *MyCell = (ChooseActivityCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    MyCell.chooseActivityViewController = self;
    MyCell.row = indexPath.row;
    MyCell.favoritesButton.tag = indexPath.row;
    [MyCell.favoritesButton removeTarget:self action:@selector(favorites:) forControlEvents:UIControlEventTouchUpInside];
    [MyCell.favoritesButton removeTarget:self action:@selector(filteredFavorites:) forControlEvents:UIControlEventTouchUpInside];
    
    switch (indexPath.section) {
        case 0:;{
            
            Activity* thisActivity = [self.favoriteActivities objectAtIndex:indexPath.row];
            MyCell.activity = thisActivity;
            [MyCell refreshActivtyCell];
            [MyCell.favoritesButton addTarget:self action:@selector(favorites:) forControlEvents:UIControlEventTouchUpInside];


            break;}
        case 1:{
            
            Activity* thisActivity = [self.filteredActivityArray objectAtIndex:indexPath.row];
            MyCell.activity = thisActivity;
            [MyCell refreshActivtyCell];
            [MyCell.favoritesButton addTarget:self action:@selector(filteredFavorites:) forControlEvents:UIControlEventTouchUpInside];

        }
            break;
        default:
            break;
    }
    
    [MyCell refreshActivtyCell];
    return MyCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    switch (indexPath.section) {
        case 0:;{
            
            Activity* thisActivity = [self.favoriteActivities objectAtIndex:indexPath.row];
            [self.activityTrackerViewController activitySelected:thisActivity];
            [self.navigationController popViewControllerAnimated:YES];

            break;}
        case 1:{
            
            Activity* thisActivity = [self.filteredActivityArray objectAtIndex:indexPath.row];
            [self.activityTrackerViewController activitySelected:thisActivity];
            [self.navigationController popViewControllerAnimated:YES];

        }
            break;
        default:
            break;
    }


}

-(void)filteredFavorites:(UIButton*)sender{
    
    Activity* thisActivity = [self.filteredActivityArray objectAtIndex:sender.tag];

    if (thisActivity.isFavorite) {
        thisActivity.isFavorite = NO;
    }
    else {
        
        thisActivity.isFavorite = YES;
    }
    [self filterContentForFavorites];
    [self.thisTableView reloadData];
}

-(void)favorites:(UIButton*)sender{
    
    Activity* thisActivity = [self.favoriteActivities objectAtIndex:sender.tag];

    if (thisActivity.isFavorite) {
        thisActivity.isFavorite = NO;
    }
    else {
        
        thisActivity.isFavorite = YES;
    }
    [self filterContentForFavorites];
    [self.thisTableView reloadData];
}

#pragma PickerView delegates
    
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
                        // [self.pickerViewContainer removeFromSuperview];
                     }];
    
    
}
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
//    
//    
//    return 2;
//    
//}
//
//- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
//    
//    if (component == 0)
//        return self.amtArray.count;
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
//        title = @"Minute(s)";
//    }
//    
//    return title;
//}
//
//
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//    switch (self.currentIndexPath.section)
//    {
//        case 0:{
//            NSMutableDictionary* thisDrink = [self.filteredActivityArray objectAtIndex:self.currentIndexPath.row];
//            [thisDrink setObject:[self.amtArray objectAtIndex:row] forKey:@"Amount"];
//            break;}
//        case 1:{
//            NSMutableDictionary* thisDrink = [self.filteredActivityArray objectAtIndex:self.currentIndexPath.row];
//            [thisDrink setObject:[self.amtArray objectAtIndex:row] forKey:@"Amount"];
//           break;}
//        default:
//            break;
//    }
//    
//    [self.thisTableView reloadData];
//    
//}
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


#pragma mark - UISearchDisplayController Delegate Methods
//-(BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
//    // Tells the table data source to reload when text changes
//    [self filterContentForSearchText:searchString scope:nil];
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}

//-(BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
//    // Tells the table data source to reload when scope bar selection changes
//    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
//     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self shrinkTable:170];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self enlargeTable:170];
}

- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText
{
    [self filterContentForSearchText:searchText scope:nil];

}

- (void)searchBarCancelButtonClicked:(UISearchBar * _Nonnull)searchBar
{
    self.filteredActivityArray = [NSMutableArray arrayWithArray:self.appDelegate.allActivities];
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    [self.thisTableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar
{
    [self filterContentForSearchText:self.filterSearchBar.text scope:nil];
    [searchBar resignFirstResponder];

}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    if (searchText.length>0)
    {
        [self.filteredActivityArray removeAllObjects];
        // Filter the array using NSPredicate
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"activityName contains[c] %@",searchText];
        self.filteredActivityArray = [NSMutableArray arrayWithArray:[self.appDelegate.allActivities filteredArrayUsingPredicate:predicate]];
    }
    else
    {
        self.filteredActivityArray = [NSMutableArray arrayWithArray:self.appDelegate.allActivities];
    }
    [self.thisTableView reloadData];
}


-(void)filterContentForFavorites {

    self.favoriteActivities = [NSMutableArray array];
    for (Activity* item in self.appDelegate.allActivities)
    {
        if (item.isFavorite)
        {
            [self.favoriteActivities addObject:item];
        }
    }
}



//    self.allActivityArray = [NSMutableArray arrayWithObjects:
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Movement (misc.)",@"Name",
//                               @"0",@"Type",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Abdominal exercises (general)",@"Name",
//                               @"0",@"Type",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Aqua bootcamp",@"Name",
//                               @"0",@"Type",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Arm exercises (general)",@"Name",
//                               @"0",@"Type",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Back exercises (general)",@"Name",
//                               @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Cardio (general)",@"Name",
//                              @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Bootcamp (misc.)",@"Name",
//                            @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Chair exercises",@"Name",
//                             @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Chest exercises (general)",@"Name",
//                            @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Crossfit",@"Name",
//                             @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Exercise class (general)",@"Name",
//                            @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (easy trail)",@"Name",
//                             @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (medium trail)",@"Name",
//                             @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (strenuous trail)",@"Name",
//                             @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (very strenuous trail)",@"Name",
//                             @"0",@"Type",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Interval training (run/walk)",@"Name",
//                             @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (leisurely)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (moderate)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (strenuous)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (very strenuous)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Leg exercises (general)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Lower body exercises (general)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Running (slow pace)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Running (moderate pace)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Running (quick pace)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Shoulder exercises (general)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Snow skiing",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Snowboarding",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Swimming (laps)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Swimming (pleasure)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Tai Chi",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Upper body exercises (general)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Wakeboarding",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Walking (slow pace)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Walking (moderate pace)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Walking (quick pace)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Interval training (run/walk)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Water aerobics",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Weight lifting (general)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Yoga (general)",@"Name",
//                               @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Anusara)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Ashtanga)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Bikram)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Hatha)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Iyengar)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Restorative)",@"Name",
//                              @"0",@"Type",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Vinyasa)",@"Name",
//                              @"0",@"Type",nil],
//    
//    nil];

//    self.allActivityArray = [NSMutableArray arrayWithObjects:
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Movement (misc.)",@"Name",
//                               @"0",@"Amount",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Abdominal exercises (general)",@"Name",
//                               @"0",@"Amount",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Aqua bootcamp",@"Name",
//                               @"0",@"Amount",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Arm exercises (general)",@"Name",
//                               @"0",@"Amount",nil],
//                              [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Back exercises (general)",@"Name",
//                               @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Cardio (general)",@"Name",
//                              @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Bootcamp (misc.)",@"Name",
//                            @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Chair exercises",@"Name",
//                             @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Chest exercises (general)",@"Name",
//                            @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Crossfit",@"Name",
//                             @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                            @"Exercise class (general)",@"Name",
//                            @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (easy trail)",@"Name",
//                             @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (medium trail)",@"Name",
//                             @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (strenuous trail)",@"Name",
//                             @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Hiking (very strenuous trail)",@"Name",
//                             @"0",@"Amount",nil],
//                            [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                             @"Interval training (run/walk)",@"Name",
//                             @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (leisurely)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (moderate)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (strenuous)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Kayaking (very strenuous)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Leg exercises (general)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Lower body exercises (general)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Running (slow pace)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Running (moderate pace)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Running (quick pace)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Shoulder exercises (general)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Snow skiing",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Snowboarding",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Swimming (laps)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Swimming (pleasure)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Tai Chi",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Upper body exercises (general)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Wakeboarding",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Walking (slow pace)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Walking (moderate pace)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Walking (quick pace)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Interval training (run/walk)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Water aerobics",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Weight lifting (general)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                               @"Yoga (general)",@"Name",
//                               @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Anusara)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Ashtanga)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Bikram)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Hatha)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Iyengar)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Restorative)",@"Name",
//                              @"0",@"Amount",nil],
//                             [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                              @"Yoga (Vinyasa)",@"Name",
//                              @"0",@"Amount",nil],
//    
//    nil];

//    self.allActivityArray = [NSMutableArray arrayWithObjects:
//                               @"Movement (misc.)",
//                               @"Abdominal exercises (general)",
//                               @"Aqua bootcamp",
//                               @"Arm exercises (general)",
//                               @"Back exercises (general)",
//                              @"Cardio (general)",
//                            @"Bootcamp (misc.)",
//                            @"Chair exercises",
//                            @"Chest exercises (general)",
//                            @"Crossfit",
//                            @"Exercise class (general)",
//                             @"Hiking (easy trail)",
//                             @"Hiking (medium trail)",
//                             @"Hiking (strenuous trail)",
//                             @"Hiking (very strenuous trail)",
//                             @"Interval training (run/walk)",
//                              @"Kayaking (leisurely)",
//                              @"Kayaking (moderate)",
//                              @"Kayaking (strenuous)",
//                              @"Kayaking (very strenuous)",
//                              @"Leg exercises (general)",
//                              @"Lower body exercises (general)",
//                              @"Running (slow pace)",
//                              @"Running (moderate pace)",
//                              @"Running (quick pace)",
//                              @"Shoulder exercises (general)",
//                              @"Snow skiing",
//                              @"Snowboarding",
//                              @"Swimming (laps)",
//                              @"Swimming (pleasure)",
//                              @"Tai Chi",
//                              @"Upper body exercises (general)",
//                              @"Wakeboarding",
//                              @"Walking (slow pace)",
//                              @"Walking (moderate pace)",
//                              @"Walking (quick pace)",
//                              @"Interval training (run/walk)",
//                              @"Water aerobics",
//                              @"Weight lifting (general)",
//                                @"Yoga (general)",
//                              @"Yoga (Anusara)",
//                              @"Yoga (Ashtanga)",
//                              @"Yoga (Bikram)",
//                              @"Yoga (Hatha)",
//                              @"Yoga (Iyengar)",
//                              @"Yoga (Restorative)",
//                              @"Yoga (Vinyasa)",
//                                nil];
//


-(void)showSearchBar
{
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarShowRect;
                         self.containerView.frame = CGRectMake(0,108, self.view.bounds.size.width, self.view.bounds.size.height-108);
                     }
                     completion:^(BOOL finished){
                         
                     }];
}
-(void)hideSearchBar
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarHideRect;
                         self.containerView.frame = CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height-64);
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

-(void)dismiss
{
    
    //[self saveActivity];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
