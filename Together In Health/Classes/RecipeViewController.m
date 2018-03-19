//
//  RecipeViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/11/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipeDetailViewController.h"
#import "RecipeTableViewCell.h"
#import "SQLiteAccess.h"
#import "AppDelegate.h"
#import "FullOpeningViewController.h"
#import "MenuItem.h"


@interface RecipeViewController ()

@end

@implementation RecipeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 //   self.menuPlanView.hidden = YES;

    self.navigationItem.backBarButtonItem = nil;

    // set custom navbar
    self.navbarTitleLabel.text = @"Recipes";
    self.navbarView.backgroundColor =[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    
    // set frames and search button
     self.searchBarShowRect = CGRectMake(0,44, self.view.bounds.size.width, 44);
     self.searchBarHideRect = CGRectMake(0,44, self.view.bounds.size.width, 0);
    self.searchBar.frame = self.searchBarHideRect;
    [self.searchLabel setText:[[NSString alloc] initWithUTF8String:"\xF0\x9F\x94\x8D"]];
    [self.searchLabel sizeToFit];
    
    self.navbarView.frame = CGRectMake(0,0, self.view.bounds.size.width, 44);
    self.baseContentView.frame = CGRectMake(0,44, self.view.bounds.size.width, self.view.bounds.size.height-44);

    self.filterString = @"";


    
    [self.activityIndicator stopAnimating];
    
    // initialize API operation queue
    //    [self performSelector:@selector(runDatabaseQuery) withObject:nil afterDelay:0.0];
   // self.filteredContentList = [[NSMutableArray alloc] init];

    [self runDatabaseQuery];
    
}

-(IBAction)navbarButtonTapped:(UIButton*)sender
{
    switch (sender.tag) {
  case 1:
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

-(void)recipeItemAdded:(NSDictionary*)object
{

    MenuItem* thisMenuItem = [MenuItem newMenuItemWithName:[object valueForKey:@"Recipe"]];
    thisMenuItem.recipeId = [[object valueForKey:@"RecordId"] integerValue];
    [self.appDelegate.menuItemsArray addObject:thisMenuItem];
   [self.navigationController popViewControllerAnimated:YES];

}


-(void)createRandomArray {
    
    
}


-(void)runDatabaseQuery
{
    
    //    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
// Paid version
    
//    NSString* objects0Sql = @"SELECT * FROM Recipes WHERE SectionNumber = \"0\"";
//    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
//    
//    NSString* objects1Sql = @"SELECT * FROM Recipes WHERE SectionNumber = \"1\"";
//    self.objects1 = [SQLiteAccess selectManyRowsWithSQL:objects1Sql];
    
//Free version
    
    NSString* objects0Sql = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE SectionNumber = \"0\" AND Free = \"1\" AND Recipe LIKE \"%%%@%%\"",self.filterString];
    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
    NSLog(@"objects0Sql %@",objects0Sql);
    NSLog(@"self.objects0 %@",self.objects0);
    
    NSString* objects1Sql = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE SectionNumber = \"1\" AND Free = \"1\" AND Recipe LIKE \"%%%@%%\"",self.filterString];
    self.objects1 = [SQLiteAccess selectManyRowsWithSQL:objects1Sql];
    
    NSString* objects2Sql = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE SectionNumber = \"2\" AND Free = \"1\" AND Recipe LIKE \"%%%@%%\"",self.filterString];
    self.objects2 = [SQLiteAccess selectManyRowsWithSQL:objects2Sql];
    
    NSString* objects3Sql = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE SectionNumber = \"3\" AND Free = \"1\" AND Recipe LIKE \"%%%@%%\"",self.filterString];
    self.objects3 = [SQLiteAccess selectManyRowsWithSQL:objects3Sql];

    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE Favorite = \"Yes\" AND Recipe LIKE \"%%%@%%\"",self.filterString];
    self.myRecipes = [NSMutableArray arrayWithArray:[SQLiteAccess selectManyRowsWithSQL:sql]];
    
    //NSLog (@"master objects0 %@",self.objects0);
    //    NSLog (@"master objects1 %@",self.objects1);
    //    NSLog (@"master objects2 %@",self.objects2);
    [self.thisTableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 35;
    
    return h;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 30)];
    [headerView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, tableView.bounds.size.width, 22)];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    
    
    if (section == 0)
        [headerLabel setText:@"   Appetizers"];
    else if (section == 1)
        [headerLabel setText:@"   Entrees"];
    else if (section == 2)
        [headerLabel setText:@"   Soups and stews"];
    else if (section == 3)
        [headerLabel setText:@"   Dips, sauces and dressings"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 50;
    
    return h;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return 1;
//    }
//    
//    else {
//
//    switch (section) {
//        case 0:
//            return self.objects0.count;
//            break;
//        case 1:
//            return self.objects1.count;
//            break;
//        default:
//            break;
//    }
//    }
//    return 0;
//    
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return [self.filteredContentList count];
//        
//    }
//    else {
            switch (section) {
                case 0:
                    return self.objects0.count;
                    break;
                case 1:
                    return self.objects1.count;
                    break;
                case 2:
                    return self.objects2.count;
                    break;
                case 3:
                    return self.objects3.count;
                    break;
                default:
                    break;
            }
   // }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSDictionary* object;

    switch (indexPath.section) {
        case 0:
            object = [self.objects0 objectAtIndex:indexPath.row];
            break;
        case 1:
            object = [self.objects1 objectAtIndex:indexPath.row];
            break;
        case 2:
            object = [self.objects2 objectAtIndex:indexPath.row];
            break;
        case 3:
            object = [self.objects3 objectAtIndex:indexPath.row];
            break;
        default:
            break;
            
    }
    
    static NSString *CellIdentifier = @"MyCell";
    RecipeTableViewCell *myCell = (RecipeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        myCell.recipeLabel.text = [self.filteredContentList objectAtIndex:indexPath.row];
//    }
//    
//    else {
    // myCell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    myCell.thisReuseIdentifier = CellIdentifier;
    myCell.object = object;
    [myCell refreshSubviews];
   // }
//    NSString* Favorite = [self.object objectForKey:@"Favorite"];
//    if ([Favorite isEqualToString:@"Yes"])
//    {
//        myCell.favoritesImage.hidden = YES;
//    }
//    else
//    {
//        myCell.favoritesImage.hidden = NO;
//    }
   myCell.recipeViewController = self;
    return myCell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

[tableView deselectRowAtIndexPath:indexPath animated:YES];
NSDictionary*  object;

switch (indexPath.section) {
    case 0:; {
        if (self.objects0.count > 0)
        {
            object = [self.objects0 objectAtIndex:indexPath.row];
        }
        if (object)
        {
            
            if ([[object objectForKey:@"RecipeDetail"] length] > 0)
            {
                [self loadDetailViewForObject:object];
            }
        }
        break;
    case 1:; {
        if (self.objects1.count > 0)
        {
            object = [self.objects1 objectAtIndex:indexPath.row];
        }
        if (object)
        {
            
            if ([[object objectForKey:@"RecipeDetail"] length] > 0)
            {
                [self loadDetailViewForObject:object];
            }
        }
        break;
    case 2:; {
        if (self.objects2.count > 0)
        {
            object = [self.objects2 objectAtIndex:indexPath.row];
        }
        if (object)
        {
            
            if ([[object objectForKey:@"RecipeDetail"] length] > 0)
            {
                [self loadDetailViewForObject:object];
            }
        }
        break;
    case 3:; {
        if (self.objects3.count > 0)
        {
            object = [self.objects3 objectAtIndex:indexPath.row];
        }
        if (object)
        {
            
            if ([[object objectForKey:@"RecipeDetail"] length] > 0)
            {
                [self loadDetailViewForObject:object];
            }
        }
        break;
    default:
        break;
        
    }
    }
}
}
}
}
-(void)loadDetailViewForObject:(NSDictionary*)object
{
    RecipeDetailViewController* recipeDetailViewController = (RecipeDetailViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RecipeDetailViewController"];
    recipeDetailViewController.object = object;
    [self.navigationController pushViewController:recipeDetailViewController animated:YES];
}



#pragma mark - Search Bar


-(void)showSearchBar
{
   
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarShowRect;
                         self.baseContentView.frame = CGRectMake(0,88, self.view.bounds.size.width, self.view.bounds.size.height-88);
                     }
                     completion:^(BOOL finished){

                     }];
}
-(void)hideSearchBar
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.searchBar.frame = self.searchBarHideRect;
                        self.baseContentView.frame = CGRectMake(0,44, self.view.bounds.size.width, self.view.bounds.size.height-44);
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.filterString = searchText;
    [self runDatabaseQuery];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.filterString = @"";
    [self hideSearchBar];
    [self.searchBar resignFirstResponder];
    [self runDatabaseQuery];
}

#pragma mark  Filtering
//-(void)filterArrayWith:(NSString*)filter
//{
//    // Update the filtered array based on the search text and scope.
//    // Remove all objects from the filtered search array
//    if (filter.length>0)
//    {
//        [self.filteredItemsArray removeAllObjects];
//        // Filter the array using NSPredicate
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"menuItemName contains[c] %@",filter];
//        self.filteredItemsArray = [NSMutableArray arrayWithArray:[self.appDelegate.menuItemsArray filteredArrayUsingPredicate:predicate]];
//    }
//    else
//    {
//        self.filteredItemsArray = [NSMutableArray arrayWithArray:self.appDelegate.menuItemsArray];
//    }
//    [self.thisTableView reloadData];
//}

#pragma Random Recipe

-(void)recipe:(id)sender {
    
//    self.randomArray = [NSMutableArray array];
//    for (NSDictionary* item in self.objects0) {
//        
//        [self.randomArray addObject:[item objectForKey:@"Recipe"]];
//    }

//
//    NSString* sql = @"SELECT COUNT() FROM Recipes";
//    NSArray* myArray = [SQLiteAccess selectManyRowsWithSQL:sql];
//    NSLog(@"%@", myArray);
//    
//    // get number of rows
//    NSDictionary *temp = [myArray objectAtIndex:0];
//    int rows = [[temp objectForKey:@"COUNT()"] intValue];
//    
//    // get random
//    int rnd = [self getRandomNumberWithMax:rows-1];
//    
//    // filenane querry wehere id = max
//    NSString* sql2 = [NSString stringWithFormat:@"SELECT Recipe FROM Recipes WHERE RecordID = %i", rnd];
//    NSArray* myArray2 = [SQLiteAccess selectManyRowsWithSQL:sql2];
//    NSDictionary* temp2 = [myArray2 firstObject];
//    NSString *fileName = [temp2 objectForKey:@"Recipe"];
//    self.currentSelection = fileName;
}

-(int)getRandomNumberWithMax:(int) max {
    int r = rand() %max; //arc4random_uniform(max);
    return r;
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

-(void)generateRandom {
    
    NSString* objects1Sql = @"SELECT * FROM Recipes ORDER BY RANDOM() LIMIT 1";
    self.objects1 = [SQLiteAccess selectManyRowsWithSQL:objects1Sql];

        for (NSDictionary* item in self.objects0) {
    
            [self.randomArray addObject:[item objectForKey:@"Recipe"]];
        }

    NSString* sql = @"SELECT COUNT() FROM Recipes";
    NSArray* myArray = [SQLiteAccess selectManyRowsWithSQL:sql];
    NSLog(@"%@", myArray);
    
    // get number of rows
    NSDictionary *temp = [myArray objectAtIndex:0];
    int rows = [[temp objectForKey:@"COUNT()"] intValue];
    
    // get random
    int rnd = [self getRandomNumberWithMax:rows-1];
    
    // filenane querry wehere id = max
    NSString* sql2 = [NSString stringWithFormat:@"SELECT Recipe FROM Recipes WHERE RecordID = %i", rnd];
    NSArray* myArray2 = [SQLiteAccess selectManyRowsWithSQL:sql2];
    NSDictionary* temp2 = [myArray2 firstObject];
    NSString *fileName = [temp2 objectForKey:@"Recipe"];
    self.currentSelection = fileName;
    NSLog (@"myArray2 %@",self.currentSelection);
    
    //add to random array
    [self.randomArray addObject:fileName];
    NSLog (@"Random array %@",self.randomArray);
    

}
#pragma Adding Menu Item View


-(IBAction)menuDone:(id)sender {
    self.menuPlanView.hidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    self.fullOpeningViewController.navigationController.navigationBar.tintColor= [UIColor colorWithRed:255/255.0 green:243/255.0 blue:177/255.0 alpha:1];
}

-(void)viewWillDisappear:(BOOL)animated {
    self.fullOpeningViewController.navigationController.navigationBar.tintColor= [UIColor colorWithRed:255/255.0 green:243/255.0 blue:177/255.0 alpha:1];
}



@end
