//
//  AddMenuItemViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "AddMenuItemViewController.h"
#import "NewMenuItemViewController.h"
#import "AddMenuItemCell.h"
#import "RecipeViewController.h"
#import "AppDelegate.h"
#import "MenuItem.h"
#import "MenuDay.h"

@implementation AddMenuItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = nil;

    // set custom navbar
    self.navbarTitleLabel.text = @"Menu Items";
    self.navbarView.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    
    // set frames and search button
     self.searchBarShowRect = CGRectMake(0,64, self.view.bounds.size.width, 44);
     self.searchBarHideRect = CGRectMake(0,64, self.view.bounds.size.width, 0);
    self.searchBar.frame = self.searchBarHideRect;
    [self.searchLabel setText:[[NSString alloc] initWithUTF8String:"\xF0\x9F\x94\x8D"]];
    [self.searchLabel sizeToFit];
    
    self.navbarView.frame = CGRectMake(0,20, self.view.bounds.size.width, 44);
    self.baseContentView.frame = CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height-64);

    self.filterString = @"";
    [self updateTable];
    
    
    
}

#pragma mark - Button Controls

-(IBAction)navbarButtonTapped:(UIButton*)sender
{
    switch (sender.tag) {
  case 1:
    //[save menuitems];
    [self.navigationController popViewControllerAnimated:YES];
    break;
  case 2:
    [self showSearchBar];
    [self.searchBar becomeFirstResponder];
    break;
  default:
    break;
    }
}
-(IBAction)newMenuItem:(UIButton*)button {
    NewMenuItemViewController* newMenuItemViewController = (NewMenuItemViewController*)
    [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
     instantiateViewControllerWithIdentifier:@"NewMenuItemViewController"];
        newMenuItemViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        newMenuItemViewController.addMenuItemViewController = self;
        [self presentViewController:newMenuItemViewController animated:YES completion:^{

        }];
}
-(IBAction)recipes:(UIButton*)button {
    RecipeViewController* recipeViewController = (RecipeViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
    instantiateViewControllerWithIdentifier:@"RecipeViewController"];
    [self.navigationController pushViewController:recipeViewController animated:YES];
}
-(void) addItem:(UIButton*)button
{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Add Menu Item"
                                   message:@"Which Menu Item to Add?"
                                   preferredStyle:UIAlertControllerStyleActionSheet];
    
   
    UIAlertAction *newAction = [UIAlertAction actionWithTitle:@"Create New" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self newMenuItem:button];
    }];
    [alertController addAction:newAction];

    UIAlertAction *recipeAction = [UIAlertAction actionWithTitle:@"Add From Recipe" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self recipes:button];
    }];
    [alertController addAction:recipeAction];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

-(void)addMenuItemToSelectedArray:(MenuItem*)thisItem
{
    [self.selectedItemsArray addObject:thisItem];
    [self updateTable];
}

-(void)removeMenuItemFromSelectedArray:(MenuItem*)thisItem
{
    [self.selectedItemsArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(MenuItem *menuItem, NSUInteger index, BOOL *stop) {
    if (menuItem.menuItemId == thisItem.menuItemId) {
        [self.selectedItemsArray removeObjectAtIndex:index];
        [self updateTable];
    }
    }];

}

-(void)addMenuItemToAllArray:(MenuItem*)thisItem
{
    [self.appDelegate.menuItemsArray addObject:thisItem];
    [self updateTable];
}

-(void)removeMenuItemFromAllArray:(MenuItem*)thisItem
{
    [self.appDelegate.menuItemsArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(MenuItem *menuItem, NSUInteger index, BOOL *stop) {
    if (menuItem.menuItemId == thisItem.menuItemId) {
        [self.appDelegate.menuItemsArray removeObjectAtIndex:index];
        [self updateTable];
    }
    }];

}

#pragma mark - Table view data source

-(void)updateTable
{
    [self filterArrayWith:self.filterString];
}

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
            return self.selectedItemsArray.count;
            break;
        case 1:{
            return self.filteredItemsArray.count;
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
    [headerView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];

    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.bounds.size.width, 22)];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    [headerLabel setTextColor:[UIColor whiteColor]];


    
    if (section == 0)
    {
        [headerLabel setText:@"Selected Menu Items"];
    }
    else if (section == 1)
    {
        [headerLabel setText:@"All Menu Items"];
         UIButton *addButton=[UIButton buttonWithType:UIButtonTypeCustom];
        addButton.tag = section;
        [addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
        addButton.frame=CGRectMake(self.view.bounds.size.width-60, 2.5, 28, 28);
        [addButton setTitle:@"+" forState:UIControlStateNormal];
        [addButton setTitleColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
        addButton.tag = section;
        addButton.backgroundColor = [UIColor whiteColor];
        addButton.layer.cornerRadius = 15;
        [headerView addSubview:addButton];
        [headerView addSubview:headerLabel];
    }
    return headerView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    AddMenuItemCell *myCell = (AddMenuItemCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    myCell.addMenuItemViewController = self;

//    myCell.chooseActivityViewController = self;
//    myCell.row = indexPath.row;
//    myCell.favoritesButton.tag = indexPath.row;
//    [myCell.favoritesButton removeTarget:self action:@selector(favorites:) forControlEvents:UIControlEventTouchUpInside];
//    [myCell.favoritesButton removeTarget:self action:@selector(filteredFavorites:) forControlEvents:UIControlEventTouchUpInside];
//
    switch (indexPath.section) {
        case 0:;{
            
            MenuItem* thisMenuItem = [self.selectedItemsArray objectAtIndex:indexPath.row];
            myCell.menuItem = thisMenuItem;

//            [MyCell.favoritesButton addTarget:self action:@selector(favorites:) forControlEvents:UIControlEventTouchUpInside];


            break;}
        case 1:{
            
            MenuItem* thisMenuItem = [self.appDelegate.menuItemsArray objectAtIndex:indexPath.row];
            myCell.menuItem = thisMenuItem;


        }
            break;
        default:
            break;
    }
    
    [myCell refreshUI];
    return myCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    switch (indexPath.section) {
        case 0:;{
            


            break;}
        case 1:{
            
            MenuItem* thisMenuItem = [self.filteredItemsArray objectAtIndex:indexPath.row];
            [self addMenuItemToSelectedArray:thisMenuItem];


        }
            break;
        default:
            break;
    }


}




//-(void)filteredMenuItems:(UIButton*)sender{
//
//    MenuItem* thisMenuItem = [self.filteredItemsArray objectAtIndex:sender.tag];
//
//    [self.thisTableView reloadData];
//}

//-(void)favorites:(UIButton*)sender{
//
//    Activity* thisActivity = [self.favoriteActivities objectAtIndex:sender.tag];
//
//    if (thisActivity.isFavorite) {
//        thisActivity.isFavorite = NO;
//    }
//    else {
//
//        thisActivity.isFavorite = YES;
//    }
//
//    [self.thisTableView reloadData];
//}







#pragma mark - Search Bar


-(void)showSearchBar
{
   
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarShowRect;
                         self.baseContentView.frame = CGRectMake(0,108, self.view.bounds.size.width, self.view.bounds.size.height-108);
                     }
                     completion:^(BOOL finished){

                     }];
}
-(void)hideSearchBar
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarHideRect;
                        self.baseContentView.frame = CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height-64);
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.filterString = searchText;
    [self filterArrayWith:self.filterString];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.filterString = @"";
    [self hideSearchBar];
    [self.searchBar resignFirstResponder];
    [self filterArrayWith:self.filterString];
}

#pragma mark  Filtering
-(void)filterArrayWith:(NSString*)filter
{
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    if (filter.length>0)
    {
        [self.filteredItemsArray removeAllObjects];
        // Filter the array using NSPredicate
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"menuItemName contains[c] %@",filter];
        self.filteredItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.menuItemsArray filteredArrayUsingPredicate:predicate]];
    }
    else
    {
        self.filteredItemsArray = [NSMutableArray arrayWithArray:self.appDelegate.menuItemsArray];
    }
    [self.thisTableView reloadData];
}
//-(void)filterArrayWith:(NSString*)filter
//{
//
//    NSPredicate *predicate;
//    if (filter.length>0)
//    {
//        predicate = [NSPredicate predicateWithFormat:@"activityName CONTAINS[cd] %@",filter];
//    }
//    else
//    {
//        predicate = [NSPredicate predicateWithFormat:@"activityName like[c] \"*\""];
//    }
//    NSMutableArray *predicates = [NSMutableArray array];
//
//    [predicates addObject:predicate];
//
//    NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
//    self.filteredItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.menuItemsArray filteredArrayUsingPredicate:compoundPredicate]];
//
//    [self.thisTableView reloadData];
//
//}




//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    self.title = @"Add Menu Items";
//    [self filterArrayWith:@""];
//    //    self.navigationController.navigationBar.backgroundColor= [UIColor blackColor];
//
//  // self.navigationController.navigationBar.tintColor= [UIColor colorWithRed:15/255.0 green:50/255.0 blue:30/255.0 alpha:1];
////     self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
////    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
////
////    self.navigationController.navigationBar.titleTextAttributes = size;
////
////    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
////
////        CGRect frameimg = CGRectMake(0, 0, 65, 20);
////        UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
////        someButton.tag = 2;
////        [someButton addTarget:self action:@selector(navButtonTapped:)
////             forControlEvents:UIControlEventTouchUpInside];
////    [someButton setTitle:@"Recipes" forState:UIControlStateNormal];
////        UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
////
////        [self.navigationItem setRightBarButtonItem:barBtn];
//
//
////    CGRect frameimg2 = CGRectMake(0, 0, 50, 20);
////    UIButton *resetButton = [[UIButton alloc] initWithFrame:frameimg2];
////    resetButton.tag = 1;
////    [resetButton addTarget:self action:@selector(navButtonTapped:)
////         forControlEvents:UIControlEventTouchUpInside];
////    [resetButton setTitle:@"Done" forState:UIControlStateNormal];
////    UIBarButtonItem *barBtn2 =[[UIBarButtonItem alloc] initWithCustomView:resetButton];
////
////    [self.navigationItem setLeftBarButtonItem:barBtn2];
//
////    self.breakfastArray = [NSMutableArray array];
////    self.lunchArray = [NSMutableArray arrayWithObjects: @"test1", nil];
////    self.dinnerArray = [NSMutableArray arrayWithObjects: @"test1", nil];
////    self.snacksArray = [NSMutableArray arrayWithObjects: @"test1", nil];
//
//
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(void)navButtonTapped:(UIButton*)button
//{
//    if (button.tag == 0) // done
//    {
//        //  save menuItems here
//        [self dismissViewControllerAnimated:YES completion:^{
//
//        }];
//    }
//    else if (button.tag == 1)
//    {
//
//
//    }
//
//}
//
//#pragma mark - Filtering Arrays
//
//-(void)showSearchBar
//{
//
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         self.searchBar.frame = self.searchBarShowRect;
//                         self.baseContentView.frame = CGRectMake(0,108, self.view.bounds.size.width, self.view.bounds.size.height-108);
//                     }
//                     completion:^(BOOL finished){
//
//                     }];
//}
//-(void)hideSearchBar
//{
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         self.searchBar.frame = self.searchBarHideRect;
//                        self.baseContentView.frame = CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height-64);
//                     }
//                     completion:^(BOOL finished){
//
//                     }];
//
//}
//
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    [self filterArrayWith:searchText];
//}
//
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//{
//    [self hideSearchBar];
//    [self.searchBar resignFirstResponder];
//    [self filterArrayWith:@""];
//}
//
//-(void)filterArrayWith:(NSString*)filter
//{
//    NSPredicate *predicate;
//    if (filter.length>0)
//    {
//        predicate = [NSPredicate predicateWithFormat:@"Name CONTAINS[cd] %@",filter];
//    }
//    else
//    {
//        predicate = [NSPredicate predicateWithFormat:@"Name like[c] \"*\""];
//    }
//    NSMutableArray *predicates = [NSMutableArray array];
//
//    [predicates addObject:predicate];
//
//    NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
//
////    self.filteredBreakfastItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.breakfastItemsArray filteredArrayUsingPredicate:compoundPredicate]];
////    self.filteredLunchItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.lunchItemsArray filteredArrayUsingPredicate:compoundPredicate]];
////    self.filteredDinnerItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.dinnerItemsArray filteredArrayUsingPredicate:compoundPredicate]];
////    self.filteredSnackItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.snackItemsArray filteredArrayUsingPredicate:compoundPredicate]];
//
//    [self.thisTableView reloadData];
//
//}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//
//    // Return the number of sections.
//    return 5;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    int h = 40;
//
//    return h;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//        int h = 35;
//        return h;
//
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    switch (section) {
//        case 0:
//            return self.selectedItemsArray.count;
//            break;
//        case 1:
//            return self.filteredBreakfastItemsArray.count;
//            break;
//        case 2:
//            return self.filteredLunchItemsArray.count;
//            break;
//        case 3:
//            return self.filteredDinnerItemsArray.count;
//            break;
//        case 4:
//            return self.filteredSnackItemsArray.count;
//            break;
//        default:
//            break;
//
//    }
//    return 0;
//}
//
//
//
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 22)];
//    [headerView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
//
//
//
//    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.bounds.size.width-10, 22)];
//    [headerLabel setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
//    headerLabel.font = [UIFont boldSystemFontOfSize:18];
//    headerLabel.textColor = [UIColor whiteColor];
//
//    UIButton* addButton;
//
//    if (section == 0)
//    {
//        [headerLabel setText:@"Selected"];
//         addButton=[self thisClearButton];
//
//    }
//    else if (section == 1)
//    {
//        [headerLabel setText:@"Breakfast"];
//        addButton=[self thisAddButton];
//
//    }
//    else if (section == 2)
//    {
//        [headerLabel setText:@"Lunch"];
//        addButton=[self thisAddButton];
//
//    }
//    else if (section == 3)
//    {
//        [headerLabel setText:@"Dinner"];
//         addButton=[self thisAddButton];
//
//    }
//    else if (section == 4)
//    {
//        [headerLabel setText:@"Snacks"];
//         addButton=[self thisAddButton];
//
//    }
//
//    [headerView addSubview:headerLabel];
//
//     addButton.tag = section;
//    [headerView addSubview:addButton];
//
//    return  headerView;
//}
//
//-(UIButton*)thisAddButton
//{
//    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
//
//    [addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
//    addButton.frame=CGRectMake(self.view.bounds.size.width-50, 2.5, 28, 28);
//    addButton.backgroundColor = [UIColor whiteColor];
//    addButton.layer.cornerRadius = 14;
//    return addButton;
//}
//
//-(UIButton*)thisClearButton
//{
//    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
//
//     [addButton setTitle:@"Clear" forState:UIControlStateNormal];
//    [addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
//    addButton.frame=CGRectMake(self.view.bounds.size.width-70, 2.5, 50, 28);
//    addButton.backgroundColor = [UIColor whiteColor];
//    return addButton;
//
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"MyCell";
//    AddMenuItemCell *myCell = (AddMenuItemCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//
//
//    switch (indexPath.section) {
//        case 0:
//            myCell.menuItem = [self.selectedItemsArray objectAtIndex:indexPath.row];
//            break;
//        case 1:
//            myCell.menuItem = [self.filteredBreakfastItemsArray objectAtIndex:indexPath.row];
//            break;
//        case 2:
//            myCell.menuItem = [self.filteredLunchItemsArray objectAtIndex:indexPath.row];
//            break;
//        case 3:
//            myCell.menuItem = [self.filteredDinnerItemsArray objectAtIndex:indexPath.row];
//            break;
//        case 4:
//            myCell.menuItem = [self.filteredSnackItemsArray objectAtIndex:indexPath.row];
//            break;
//        default:
//            break;
//    }
//    [myCell refreshUI];
//
//    return myCell;
//}


#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//
//    RecipeViewController* recipeViewController = (RecipeViewController*)
//    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//     instantiateViewControllerWithIdentifier:@"RecipeViewController"];
//    [self.navigationController pushViewController:recipeViewController animated:YES];
//
//}




@end
