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
#import "MenuPlan.h"
#import "FullOpeningViewController.h"

@interface RecipeViewController ()

@end

@implementation RecipeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 //   self.menuPlanView.hidden = YES;
    
    self.title = @"Recipes";
    
//    UIImage* image = [UIImage imageNamed:@"TIHsettings.png"];
//    UIImage* image2 = [UIImage imageNamed:@"Star.png"];
//    
//    CGRect frameimg = CGRectMake(0, 0, 20, 20);
//    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
//    
//    
//    
//    [someButton setBackgroundImage:image forState:UIControlStateNormal];
//    [someButton setBackgroundImage:image2 forState:UIControlStateSelected];
//    [someButton addTarget:self action:@selector(generateRandom)
//         forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//    
//    [self.navigationItem setRightBarButtonItem:barBtn];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    //  [self.activityIndicator stopAnimating];
    
    // initialize API operation queue
    
    [self.activityIndicator stopAnimating];
    

    //    [self performSelector:@selector(runDatabaseQuery) withObject:nil afterDelay:0.0];

    
   // self.filteredContentList = [[NSMutableArray alloc] init];

    //NSLog (@"random array %@",self.randomArray);
    [self runDatabaseQuery];
    
}



-(void)updateViewController
{
    
    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE Favorite = \"Yes\""];
    self.myRecipes = [NSMutableArray arrayWithArray:[SQLiteAccess selectManyRowsWithSQL:sql]];
    
    [self.thisTableView reloadData];
    
    
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
    
    NSString* objects0Sql = @"SELECT * FROM Recipes WHERE SectionNumber = \"0\" AND Free = \"1\"";
    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
    
    NSString* objects1Sql = @"SELECT * FROM Recipes WHERE SectionNumber = \"1\" AND Free = \"1\"";
    self.objects1 = [SQLiteAccess selectManyRowsWithSQL:objects1Sql];
    
    NSString* objects2Sql = @"SELECT * FROM Recipes WHERE SectionNumber = \"2\" AND Free = \"1\"";
    self.objects2 = [SQLiteAccess selectManyRowsWithSQL:objects2Sql];
    
    NSString* objects3Sql = @"SELECT * FROM Recipes WHERE SectionNumber = \"3\" AND Free = \"1\"";
    self.objects3 = [SQLiteAccess selectManyRowsWithSQL:objects3Sql];

    
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



#pragma mark - Search Bar test

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    self.filteredContentList = [self.objects0 filteredArrayUsingPredicate:resultPredicate];
   // self.filteredContentList = [self.objects1 filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}




#pragma mark - Search Bar

//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
//{
//    [self showSearchScope];
//    [self.searchBar setShowsScopeBar:YES];
//    [self.searchBar setShowsCancelButton:YES animated:YES];
//    CGRect newRect = self.searchBar.frame;
//    // newRect.size = [self.searchBar sizeThatFits:self.searchBarContainer.frame.size];
//    self.searchBar.frame = newRect;
//    
//}
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    //    self.agentsVCPersistent.agentSearchTerm = searchBar.text;
//    [self sortAgents];
//}
//
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//{
//    self.searchBar.text = @"";
//    [self.searchBar resignFirstResponder];
//    //    self.agentsVCPersistent.agentSearchTerm = @"";
//    
//}
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    [self.searchBar resignFirstResponder];
//}
//
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
//{
//    [self.searchBar resignFirstResponder];
//    [self.searchBar setShowsScopeBar:NO];
//    [searchBar setShowsCancelButton:NO animated:YES];
//    [self hideSearchScope];
//    CGRect newRect = self.searchBar.frame;
//    // newRect.size = [self.searchBar sizeThatFits:self.searchBarContainer.frame.size];
//    self.searchBar.frame = newRect;
//    
//    //    self.agentsVCPersistent.agentSearchTerm = searchBar.text;
//    [self sortAgents];
//}
//
//- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
//{
//    //    self.agentsVCPersistent.agentSearchScope= selectedScope;
//    [self sortAgents];
//    
//}
//
//-(void) showSearchScope {
//    
//    NSLog(@"alarmSearchView %@",NSStringFromCGRect(self.alarmSearchView.frame));
//    
//   	float y = self.alarmSearchView.frame.origin.y;
//   	float w = self.alarmSearchView.bounds.size.width;
//    float x = self.alarmSearchView.frame.origin.x;
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         self.alarmSearchView.frame = CGRectMake(x,y-44, w, 88);
//                         
//                     }
//                     completion:^(BOOL finished) {
//                     }
//     ];
//    
//}
//
//-(void) hideSearchScope {
////    NSLog(@"hideSearchScope alarmSearchView %@",NSStringFromCGRect(self.alarmSearchView.frame));
////   	float y = self.alarmSearchView.frame.origin.y;
////    float w = self.alarmSearchView.bounds.size.width;
////   	float x = self.alarmSearchView.frame.origin.x;
////    [UIView animateWithDuration:0.2
////                     animations:^{
////                         self.alarmSearchView.frame = CGRectMake(x,y+44, w, 44);
////                     }
////     ];
//    
//}
//
//
//-(void) sortAgents {
//    
////    [self updateSelectedButton];
////        if (self.agentsVCPersistent.agentSearchTerm.length>0)
////        {
////            self.filteredLabel.text = [NSString stringWithFormat:@"Filtered by \"%@\"",self.agentsVCPersistent.agentSearchTerm];
////        }
////        else
////        {
////    self.filteredLabel.text = @"";
////        }
////    
////        self.filteredAgents = [FilterEngine filterArray:self.agents options:self.filterOptions
////                                             searchTerm:self.agentsVCPersistent.agentSearchTerm
////                                            searchScope:self.agentsVCPersistent.agentSearchScope
////                                              sortIndex:self.agentsVCPersistent.agentSortIndex
////                                          sortAscending:self.agentsVCPersistent.agentSortAscending];
//
//    if (self.filteredAgents.count == 0)
//    {
//        //        if ([self iPad])
//        //        {
//        //            self.tableStatusMessage.text = @"     No Agents found for selected Group";
//        //            self.tableStatusMessage.hidden = NO;
//        //        }
//        //        else
//        //        {
//        self.tableStatusMessage.text = @"     No Agents found";
//        self.tableStatusMessage.hidden = NO;
//        //}
//    }
//    else
//    {
//        self.tableStatusMessage.text = @"";
//        self.tableStatusMessage.hidden = YES;
//    }
////        if (self.forceAnimatedRefresh)
////        {
////            self.forceAnimatedRefresh = NO;
////            [self addNewTableData];
////    
////        }
////        else
//    
//    [self.thisTableView reloadData];
//    [self.view setNeedsDisplay];
//    
//   // [self scrollToSelectedAgent];
//    
//    
//}
//
//+(NSMutableArray*)filterArray:(NSMutableArray*)objectsArray options:(NSArray*)filterOptionsArray
//                   searchTerm:(NSString*)searchTerm searchScope:(int)searchScope sortIndex:(int)sortIndex sortAscending:(BOOL)ascending
//{
//    
//    
//    NSMutableArray* filteredObjects;
//    
//    if (searchTerm.length > 0) {
//        
//        NSMutableArray *predicates = [NSMutableArray array];
//        for (NSDictionary* item in filterOptionsArray)
//        {
//            if ([[item objectForKey:@"SearchName"] length] > 0)
//            {
//                switch (searchScope) {
//                    case BeginsWith:{
//                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K BEGINSWITH[cd] %@",[item objectForKey:@"SearchName"],searchTerm];
//                        [predicates addObject:predicate];
//                        break;}
//                    case EndsWith:{
//                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K ENDSWITH[cd] %@",[item objectForKey:@"SearchName"],searchTerm];
//                        [predicates addObject:predicate];
//                        break;}
//                    case Contains:{
//                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@",[item objectForKey:@"SearchName"],searchTerm];
//                        [predicates addObject:predicate];
//                        break;}
//                    default:
//                        break;
//                }
//            }
//            
//        }
//        /// this is to make sure there is at least one searchName listed.  If not don't filter arrayky
//        if (predicates.count>0)
//        {
//            NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
//            filteredObjects =  [NSMutableArray arrayWithArray:[objectsArray filteredArrayUsingPredicate:compoundPredicate]];
//        }
//        else
//        {
//            filteredObjects = [NSMutableArray arrayWithArray:objectsArray];
//        }
//        
//    } else {
//        filteredObjects = [NSMutableArray arrayWithArray:objectsArray];
//    }
//    
//    
//    NSString* sortProperty = [[filterOptionsArray objectAtIndex:sortIndex] objectForKey:@"SortName"];
//    if (sortProperty.length>0)
//    {
//        NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:sortProperty ascending:ascending];
//        NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
//        [filteredObjects sortUsingDescriptors:sortDescriptors];
//    }
//    
//    
//    return filteredObjects;
//    
//}
//
//+(NSMutableArray*)filterArray:(NSMutableArray*)objectsArray searchTerm:(NSString*)searchTerm
//             searchProperties:(NSMutableArray*)searchProperties searchScope:(int)searchScope sortProperty:(NSString*)sortProperty sortAscending:(BOOL)ascending
//{
//    
//    NSMutableArray* filteredObjects;
//    
//    if (searchTerm.length > 0) {
//        
//        NSMutableArray *predicates = [NSMutableArray array];
//        for (NSString* item in searchProperties)
//        {
//            switch (searchScope) {
//                case BeginsWith:{
//                    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K BEGINSWITH[cd] %@",item,searchTerm];
//                    [predicates addObject:predicate];
//                    break;}
//                case EndsWith:{
//                    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K ENDSWITH[cd] %@",item,searchTerm];
//                    [predicates addObject:predicate];
//                    break;}
//                case Contains:{
//                    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@",item,searchTerm];
//                    [predicates addObject:predicate];
//                    break;}
//                default:
//                    break;
//            }
//        }
//        /// this is to make sure there is at least one searchName listed.  If not don't filter arrayky
//        if (predicates.count>0)
//        {
//            NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
//            filteredObjects =  [NSMutableArray arrayWithArray:[objectsArray filteredArrayUsingPredicate:compoundPredicate]];
//        }
//        else
//        {
//            filteredObjects = [NSMutableArray arrayWithArray:objectsArray];
//        }
//        
//    }
//    else
//    {
//        filteredObjects = [NSMutableArray arrayWithArray:objectsArray];
//    }
//    
//    
//    if (sortProperty.length>0)
//    {
//        NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:sortProperty ascending:ascending];
//        NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
//        [filteredObjects sortUsingDescriptors:sortDescriptors];
//    }
//    
//    return filteredObjects;
//    
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
    self.fullOpeningViewController.navigationController.navigationBar.tintColor= [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
}



@end
