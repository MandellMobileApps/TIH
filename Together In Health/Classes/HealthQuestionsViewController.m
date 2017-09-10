//
//  HealthQuestionsViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "HealthQuestionsViewController.h"
#import "HQViewController.h"
#import "SQLiteAccess.h"
#import "HealthQuestionsCell.h"
#import "HQViewController.h"
#import "MgNetworkOperation2.h"
#import "AbstractViewController.h"

@interface HealthQuestionsViewController ()

@property (strong, nonatomic) NSArray *updatedRecords;
@property (strong, nonatomic) NSArray *updatedVersions;
@property (strong, nonatomic) NSArray *userArray;
@property (nonatomic) NSInteger currentVersion;
@property (nonatomic) NSInteger newVersion;
@property (nonatomic) BOOL updateEnabled;
@property (strong, nonatomic) NSOperationQueue* mgOperationsQueue;
@property (strong, nonatomic) NSMutableArray *filesToUpdate;


@end

@implementation HealthQuestionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Health Questions";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    
  //  [self checkForDatabaseInDocuments];
    
  //  [self.activityIndicator stopAnimating];
    
    // initialize API operation queue
    
    [self.activityIndicator stopAnimating];
    
    self.mgOperationsQueue = [[NSOperationQueue alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{});
//    [self performSelector:@selector(runDatabaseQuery) withObject:nil afterDelay:0.0];

 //   [self runDatabaseQuery];

    [self checkVersion];

    
    [self.activityIndicator stopAnimating];


//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
}

//-(void) checkForUpdates
//{
    // start version check
//    [self checkVersion];
    
//}




-(void)runDatabaseQuery
{
    
//    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    
    NSString* objects0Sql = @"SELECT * FROM HealthQuestions WHERE SectionNumber = \"0\"";
    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
    
    NSString* objects1Sql = @"SELECT * FROM HealthQuestions WHERE SectionNumber = \"1\"";
    self.objects1 = [SQLiteAccess selectManyRowsWithSQL:objects1Sql];


    
        NSLog (@"master objects0 %@",self.objects0);
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 60;
    
    return h;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredContentList count];
        
    }
    else {
        switch (section) {
            case 0:
                return self.objects0.count;
                break;
            case 1:
                return self.objects1.count;
                break;
            default:
                break;
        }
    }
    return 0;
   // return 1;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 30)];
    [headerView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, tableView.bounds.size.width, 22)];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    
    
    if (section == 0)
        [headerLabel setText:@"   Vegetarian"];
    else if (section == 1)
        [headerLabel setText:@"   Vegan"];
    else if (section == 2)
        [headerLabel setText:@"   Family"];
    else if (section == 3)
        [headerLabel setText:@"   Food"];
    else if (section == 4)
        [headerLabel setText:@"   Motivation"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
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
        default:
            break;
            
    }
    
    static NSString *CellIdentifier = @"MyCell";
    HealthQuestionsCell *myCell = (HealthQuestionsCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

   // myCell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    myCell.thisReuseIdentifier = CellIdentifier;
    myCell.object = object;
    [myCell refreshSubiews];
    return myCell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary* object;
    
        if (self.objects0.count > 0)
            {
                object = [self.objects0 objectAtIndex:indexPath.row];
            }
    if ([[object objectForKey:@"Answer"] length] > 0)
    {
        [self loadDetailViewForObject:object];
    }
    
}

-(void)loadDetailViewForObject:(NSDictionary*)object
{
        HQViewController* hQViewController = (HQViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HQViewController"];
                hQViewController.object = object;
            [self.navigationController pushViewController:hQViewController animated:YES];
    
}

#pragma mark - Database Methods

-(void)checkVersion
{
    
//    NSString* urlString = @"http://mandellmobileapps.com/TIHHealthQuestions.php";
//    NSURL* url/Users/Cami/Desktop/TIHMaster/TIHMaster/HealthQuestionsViewController.ml = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
//            {
//                if (completedOperation.operationErrorMessage.length == 0)
//                    {
//                                                
//                        if ([completedOperation.json isKindOfClass:[NSArray class]])
//                                {
//                                    self.updatedVersions = completedOperation.json;
//                                        //  NSLog(@"self.updatedVersions %@",self.updatedVersions);
//                                        if (self.updatedVersions.count > 0)
//                                            {
//                                            NSDictionary* thisVersion = [self.updatedVersions lastObject];
//                                                        
//                                            self.updateEnabled = [[thisVersion objectForKey:@"Update Enabled"] boolValue];
//                                                        
//                                            NSArray* files = [thisVersion objectForKey:@"FilesToUpdate"];
//                                            self.filesToUpdate = [NSMutableArray array];
//                                                        
//                                            for (NSDictionary* item in files)
//                                                {
//                                                    [self.filesToUpdate addObject:[item objectForKey:@"filename"]];
//                                                }
//                                                        
//
//                                                self.newVersion = [[thisVersion objectForKey:@"NewVersion"] integerValue];
//                                                        
//                                                self.currentVersion = [[NSUserDefaults standardUserDefaults] integerForKey:@"version"];
//                                                        if (self.currentVersion < self.newVersion) {
//                                                          //  self.updateLabel.hidden = YES;
//                                                          //  self.updateVersionButton.hidden = YES;
//                                                          //  self.notNowButton.hidden = YES;
//                                                          //  self.updateView.hidden = YES;
//                                                            //                        }
//                                                        }
//                                                    }
//                                                }
//                                                else
//                                                {
//                                                    NSLog(@"getVersion JSON is not array");
//                                                    
//                                                }
//                                            }
//                                            else
//                                            {
//                                                NSLog(@"getVersion %@",completedOperation.operationErrorMessage);
//                                            }
//                                        }];
//    
//    [self.mgOperationsQueue addOperation:mgOperation];
    
    [self getData];
    
    
    
}

-(void) updateDatabase
{
  [self getUserData];
   // [self getData];
    
}

-(void)getUserData {
    //Select current user data
    NSString *path1 = [self dataFilePathofDocuments:@"HealthQuestions.sqlite"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path1])
    {
        self.userArray = [SQLiteAccess selectManyRowsWithSQL:@"Select * FROM HealthQuestions"];
    }
    else
    {
        self.userArray = [NSArray array];
    }
    [self getData];
}

-(void)getData {
    NSString* urlString = @"http://mandellmobileapps.com/TIHHealthQuestions.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
                        {
                        if (completedOperation.operationErrorMessage.length == 0)
                        {
                                                
                            if ([completedOperation.json isKindOfClass:[NSArray class]])
                            {
                                self.updatedRecords = completedOperation.json;
                                NSLog(@"self.updatedRecords %@",self.updatedRecords);
                                if (self.updatedRecords.count>0)
                                {
                                    [self deleteExistingTable];
                                }
                                else
                                {
                                    [self.activityIndicator stopAnimating];
                                }
                                                    
                            }
                            else
                            {
                                        NSLog(@"getData JSON is not array");
                                        self.updatedRecords = [NSMutableArray array];
                                        [self.activityIndicator stopAnimating];
                            }
                        }
                        else
                        {
                                                NSLog(@"getData %@",completedOperation.operationErrorMessage);
                                                [self.activityIndicator stopAnimating];
                                                self.updatedRecords = [NSMutableArray array];
                        }
                                            
                                            
                                        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];

}

-(void) deleteExistingTable
{

    
    NSString *sql = @"DROP TABLE IF EXISTS HealthQuestions";
    [SQLiteAccess updateWithSQL:sql];
    
    [self buildNewTable];
    
}




-(void)buildNewTable
{
    
    NSString* newSql = @"CREATE TABLE \"HealthQuestions\" (\"Question\" TEXT,\"Answer\" TEXT, \"SectionNumber\" TEXT, \"RecordId\" INTEGER DEFAULT (null) )";
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
        
        [sql appendFormat:@"INSERT INTO HealthQuestions ("];
        [sql appendFormat:@"Question,"];
        [sql appendFormat:@"Answer,"];
        [sql appendFormat:@"SectionNumber,"];
        [sql appendFormat:@"RecordId"];
        [sql appendFormat:@") VALUES "];
        
        
        for (i=start; i<(start+thisBlock); i++)
        {
            NSDictionary* item = [self.updatedRecords objectAtIndex:i];
            [sql appendFormat:@"("];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Question"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Answer"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"SectionNumber"]]];
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

-(void) getFiles
{
    
    NSString* urlString = @"http://mandellmobileapps.com/FilesToUpdate.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
                                        {
                                            if (completedOperation.operationErrorMessage.length == 0)
                                            {
                                                
                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
                                                {
                                                    NSArray* temp = completedOperation.json;
                                                    //                NSLog(@"getFiles %@",temp);
                                                    self.filesToUpdate = [NSMutableArray array];
                                                    if (temp.count > 0)
                                                    {
                                                        for (NSDictionary* item in temp)
                                                        {
                                                            [self.filesToUpdate addObject:[item objectForKey:@"FilesToUpdate"]];
                                                        }
                                                    }
                                                   // [self updateFiles];
                                                    
                                                }
                                            }
                                        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];
    
    
}


-(void)updateFiles
{
    
    BOOL success = [self checkForUpdatedFilesFolder];
    
    if (success)
    {
        
        for (NSString* filename in self.filesToUpdate)
        {
            
            if ([self string:filename containsString:@".html"])
            {
                
                NSString* urlString = [NSString stringWithFormat:@"http://mandellmobileapps.com/ProSportsHtmlFiles/%@",filename];
                NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                
                NSError* error;
                NSString* htmlString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
                if (error)
                {
                    //                     NSLog(@"Error: %@",[error localizedDescription]);
                }
                
                if(htmlString.length>0)
                {
                    [self writeString:htmlString toFile:filename];
                }
            }
            else if ([self string:filename containsString:@".png"])
            {
                
                
                
            }
        }
    }
    [[NSUserDefaults standardUserDefaults] setInteger:self.newVersion forKey:@"version"];

    [self.activityIndicator stopAnimating];
    //    NSLog(@"date complete %@",[NSDate date]);
   // [self delayedLoad];
    
}

-(BOOL) checkForUpdatedFilesFolder
{
    NSString *dataPath = [self dataFilePathofDocuments:@"/UpdatedFiles"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
    {
        NSError* error;
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error];
        if (error)
        {
            NSLog(@"Error creating updated files folder");
            return NO;
        }
    }
    return YES;
    
}

-(void) writeString:(NSString*)string toFile:(NSString*)filename
{
    
    NSString* stringPath = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",filename]];
    
    NSError* error;
    BOOL successSave = [string writeToFile:stringPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!successSave)
    {
        NSLog(@"Error: %@   saving file: %@",[error localizedDescription],filename);
    }
}


-(void) cancelAllOperations {
    [self.mgOperationsQueue cancelAllOperations];
}


#pragma mark - Search Bar

//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
//{
//    [self showSearchScope];
//    [self.searchBar setShowsScopeBar:YES];
//    [self.searchBar setShowsCancelButton:YES animated:YES];
//    CGRect newRect = self.searchBar.frame;
//   // newRect.size = [self.searchBar sizeThatFits:self.searchBarContainer.frame.size];
//    self.searchBar.frame = newRect;
//    
//}
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
////    self.agentsVCPersistent.agentSearchTerm = searchBar.text;
//    [self sortAgents];
//}
//
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//{
//    self.searchBar.text = @"";
//    [self.searchBar resignFirstResponder];
////    self.agentsVCPersistent.agentSearchTerm = @"";
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
//   // newRect.size = [self.searchBar sizeThatFits:self.searchBarContainer.frame.size];
//    self.searchBar.frame = newRect;
//    
////    self.agentsVCPersistent.agentSearchTerm = searchBar.text;
//    [self sortAgents];
//}
//
//- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
//{
////    self.agentsVCPersistent.agentSearchScope= selectedScope;
//    [self sortAgents];
//    
//}
//
//
//-(void) sortAgents {
//    
//    [self updateSelectedButton];
////    if (self.agentsVCPersistent.agentSearchTerm.length>0)
////    {
////        self.filteredLabel.text = [NSString stringWithFormat:@"Filtered by \"%@\"",self.agentsVCPersistent.agentSearchTerm];
////    }
////    else
////    {
//        self.filteredLabel.text = @"";
////    }
//    
////    self.filteredAgents = [FilterEngine filterArray:self.agents options:self.filterOptions
////                                         searchTerm:self.agentsVCPersistent.agentSearchTerm
////                                        searchScope:self.agentsVCPersistent.agentSearchScope
////                                          sortIndex:self.agentsVCPersistent.agentSortIndex
////                                      sortAscending:self.agentsVCPersistent.agentSortAscending];
//    
//    if (self.filteredAgents.count == 0)
//    {
////        if ([self iPad])
////        {
////            self.tableStatusMessage.text = @"     No Agents found for selected Group";
////            self.tableStatusMessage.hidden = NO;
////        }
////        else
////        {
//            self.tableStatusMessage.text = @"     No Agents found";
//            self.tableStatusMessage.hidden = NO;
//        //}
//    }
//    else
//    {
//        self.tableStatusMessage.text = @"";
//        self.tableStatusMessage.hidden = YES;
//    }
////    if (self.forceAnimatedRefresh)
////    {
////        self.forceAnimatedRefresh = NO;
////        [self addNewTableData];
////        
////    }
////    else
//    
//        [self.thisTableView reloadData];
//        [self.view setNeedsDisplay];
//    
//    [self scrollToSelectedAgent];
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


- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:nameoffile];
    return documentsPath ;
}

- (NSString *)dataFilePathofBundle:(NSString *)nameoffile {
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameoffile];
    return bundlePath;
}

@end
