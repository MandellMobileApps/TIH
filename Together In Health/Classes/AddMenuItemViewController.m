//
//  AddMenuItemViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "AddMenuItemViewController.h"
#import "AddMenuItemCell.h"
#import "RecipeViewController.h"
#import "AppDelegate.h"

@implementation AddMenuItemViewController

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
    
    self.title = @"Add Menu Items";
    [self filterArrayWith:@""];
    //    self.navigationController.navigationBar.backgroundColor= [UIColor blackColor];
    
  // self.navigationController.navigationBar.tintColor= [UIColor colorWithRed:15/255.0 green:50/255.0 blue:30/255.0 alpha:1];
//     self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
//    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
//
//    self.navigationController.navigationBar.titleTextAttributes = size;
//
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
//
//        CGRect frameimg = CGRectMake(0, 0, 65, 20);
//        UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
//        someButton.tag = 2;
//        [someButton addTarget:self action:@selector(navButtonTapped:)
//             forControlEvents:UIControlEventTouchUpInside];
//    [someButton setTitle:@"Recipes" forState:UIControlStateNormal];
//        UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//
//        [self.navigationItem setRightBarButtonItem:barBtn];
    
    
//    CGRect frameimg2 = CGRectMake(0, 0, 50, 20);
//    UIButton *resetButton = [[UIButton alloc] initWithFrame:frameimg2];
//    resetButton.tag = 1;
//    [resetButton addTarget:self action:@selector(navButtonTapped:)
//         forControlEvents:UIControlEventTouchUpInside];
//    [resetButton setTitle:@"Done" forState:UIControlStateNormal];
//    UIBarButtonItem *barBtn2 =[[UIBarButtonItem alloc] initWithCustomView:resetButton];
//
//    [self.navigationItem setLeftBarButtonItem:barBtn2];
    
//    self.breakfastArray = [NSMutableArray array];
//    self.lunchArray = [NSMutableArray arrayWithObjects: @"test1", nil];
//    self.dinnerArray = [NSMutableArray arrayWithObjects: @"test1", nil];
//    self.snacksArray = [NSMutableArray arrayWithObjects: @"test1", nil];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)navButtonTapped:(UIButton*)button
{
    if (button.tag == 0) // done
    {
        //  save menuItems here
        [self dismissViewControllerAnimated:YES completion:^{
        
        }];
    }
    else if (button.tag == 1)
    {
        
    
    }

}

#pragma mark - Filtering Arrays

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
    self.filteredBreakfastItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.breakfastItemsArray filteredArrayUsingPredicate:compoundPredicate]];
    self.filteredLunchItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.lunchItemsArray filteredArrayUsingPredicate:compoundPredicate]];
    self.filteredDinnerItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.dinnerItemsArray filteredArrayUsingPredicate:compoundPredicate]];
    self.filteredSnackItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.snackItemsArray filteredArrayUsingPredicate:compoundPredicate]];

    [self.thisTableView reloadData];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 40;
    
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
        case 1:
            return self.filteredBreakfastItemsArray.count;
            break;
        case 2:
            return self.filteredLunchItemsArray.count;
            break;
        case 3:
            return self.filteredDinnerItemsArray.count;
            break;
        case 4:
            return self.filteredSnackItemsArray.count;
            break;
        default:
            break;

    }
    return 0;
}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 22)];
    [headerView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];


    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.bounds.size.width-10, 22)];
    [headerLabel setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    headerLabel.textColor = [UIColor whiteColor];
    
    UIButton* addButton;
    
    if (section == 0)
    {
        [headerLabel setText:@"Selected"];
         addButton=[self thisClearButton];
        
    }
    else if (section == 1)
    {
        [headerLabel setText:@"Breakfast"];
        addButton=[self thisAddButton];
        
    }
    else if (section == 2)
    {
        [headerLabel setText:@"Lunch"];
        addButton=[self thisAddButton];
        
    }
    else if (section == 3)
    {
        [headerLabel setText:@"Dinner"];
         addButton=[self thisAddButton];
        
    }
    else if (section == 4)
    {
        [headerLabel setText:@"Snacks"];
         addButton=[self thisAddButton];
        
    }
    
    [headerView addSubview:headerLabel];

     addButton.tag = section;
    [headerView addSubview:addButton];
    
    return  headerView;
}

-(UIButton*)thisAddButton
{
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];

    [addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(self.view.bounds.size.width-50, 2.5, 28, 28);
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.cornerRadius = 14;
    return addButton;
}

-(UIButton*)thisClearButton
{
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];

     [addButton setTitle:@"Clear" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(self.view.bounds.size.width-70, 2.5, 50, 28);
    addButton.backgroundColor = [UIColor whiteColor];
    return addButton;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    AddMenuItemCell *myCell = (AddMenuItemCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    switch (indexPath.section) {
        case 0:
            myCell.menuItem = [self.selectedItemsArray objectAtIndex:indexPath.row];
            break;
        case 1:
            myCell.menuItem = [self.filteredBreakfastItemsArray objectAtIndex:indexPath.row];
            break;
        case 2:
            myCell.menuItem = [self.filteredLunchItemsArray objectAtIndex:indexPath.row];
            break;
        case 3:
            myCell.menuItem = [self.filteredDinnerItemsArray objectAtIndex:indexPath.row];
            break;
        case 4:
            myCell.menuItem = [self.filteredSnackItemsArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    [myCell refreshUI];
    
    return myCell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    RecipeViewController* recipeViewController = (RecipeViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"RecipeViewController"];
    [self.navigationController pushViewController:recipeViewController animated:YES];
    
}

-(void) addItem:(UIButton*)button
{
    

}


@end
