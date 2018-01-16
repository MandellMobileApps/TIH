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

    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateTable];
}

#pragma mark - Button Controls

-(IBAction)navbarButtonTapped:(UIButton*)sender
{
    switch (sender.tag) {
      case 1:
        switch (self.selectedMenuDay.selectedMealType) {
      case mealTypeBreakfast:
        self.selectedMenuDay.breakfastMenuItems = self.selectedItemsArray;
        break;
      case mealTypeLunch:
        self.selectedMenuDay.lunchMenuItems = self.selectedItemsArray;
        break;
      case mealTypeDinner:
        self.selectedMenuDay.dinnerMenuItems = self.selectedItemsArray;
        break;
      case mealTypeSnack:
        self.selectedMenuDay.snackMenuItems = self.selectedItemsArray;
        break;
      default:
        break;
    }
    
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
-(void)newMenuItem:(UIButton*)button {
    NewMenuItemViewController* newMenuItemViewController = (NewMenuItemViewController*)
    [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
     instantiateViewControllerWithIdentifier:@"NewMenuItemViewController"];
        newMenuItemViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        newMenuItemViewController.addMenuItemViewController = self;
        [self presentViewController:newMenuItemViewController animated:YES completion:^{
            [newMenuItemViewController thisMenuItem:nil];
        }];
}
-(void)recipes:(UIButton*)button {
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
     [self.appDelegate saveMenuItems];
}


// still used?  TODO
-(void)removeMenuItemFromSelectedArray:(MenuItem*)thisItem
{
    [self.selectedItemsArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(MenuItem *menuItem, NSUInteger index, BOOL *stop) {
    if (menuItem.menuItemId == thisItem.menuItemId) {
        [self.selectedItemsArray removeObjectAtIndex:index];
        [self updateTable];
    }
    }];
     [self.appDelegate saveMenuItems];
}

-(void)updateMenuItemInAllArray:(MenuItem*)thisItem
{
    [self.appDelegate.menuItemsArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(MenuItem *menuItem, NSUInteger index, BOOL *stop) {
    if (menuItem.menuItemId == thisItem.menuItemId) {
        [self.appDelegate.menuItemsArray replaceObjectAtIndex:index withObject:thisItem];
        [self updateTable];
    }
    }];
     [self.appDelegate saveMenuItems];
}
-(void)addMenuItemToAllArray:(MenuItem*)thisItem
{
    [self.appDelegate.menuItemsArray addObject:thisItem];
    [self updateTable];
    [self.appDelegate saveMenuItems];
}


-(void)removeMenuItemFromAllArray:(MenuItem*)thisItem
{
    [self.appDelegate.menuItemsArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(MenuItem *menuItem, NSUInteger index, BOOL *stop) {
    if (menuItem.menuItemId == thisItem.menuItemId) {
        [self.appDelegate.menuItemsArray removeObjectAtIndex:index];
        [self updateTable];
    }
    }];
    [self.appDelegate saveMenuItems];
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
        [headerLabel setText:[NSString stringWithFormat:@"Selected Menu Items for %@",self.selectedMenuDayName]];
        [headerView addSubview:headerLabel];
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


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        switch (indexPath.section) {
          case 0:
            [self.selectedItemsArray removeObjectAtIndex:indexPath.row];
            break;
          case 1:{
            MenuItem* thisItem = [self.filteredItemsArray objectAtIndex:indexPath.row];
            [self removeMenuItemFromAllArray:thisItem];
            break;}
          default:
            break;
            }
        [self updateTable]; // tell table to refresh now
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
