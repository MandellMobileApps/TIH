//
//  ProblemsViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ProblemsViewController.h"
#import "SolutionsViewController.h"
#import "ProblemsCell.h"
#import "SQLiteAccess.h"
#import "MgNetworkOperation2.h"

@implementation ProblemsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Find your solution!";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:34/255.0 green:80/255.0 blue:139/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.mgOperationsQueue = [[NSOperationQueue alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{});
    //    [self performSelector:@selector(runDatabaseQuery) withObject:nil afterDelay:0.0];
    
       [self runDatabaseQuery];
    
    [self checkVersion];
    
    
    [self.activityIndicator stopAnimating];
    
}

-(void)runDatabaseQuery
{
    
    //    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    
    NSString* objects0Sql = @"SELECT * FROM Problems WHERE SectionNumber = \"0\"";
    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
    
    NSString* objects1Sql = @"SELECT * FROM Problems WHERE SectionNumber = \"1\"";
    self.objects1 = [SQLiteAccess selectManyRowsWithSQL:objects1Sql];
    
    self.totalArray = [NSArray arrayWithArray:self.objects0];
    
   // NSLog (@"master objects0 %@",self.objects0);
    //    NSLog (@"master objects1 %@",self.objects1);

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
    return 2;
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
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 35;
    
    return h;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 30)];
    [headerView setBackgroundColor:[UIColor colorWithRed:34/255.0 green:80/255.0 blue:139/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, tableView.bounds.size.width, 22)];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    
    
    if (section == 0)
        [headerLabel setText:@"   Work"];
    else if (section == 1)
        [headerLabel setText:@"   Home"];
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
    ProblemsCell *myCell = (ProblemsCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        myCell.problemLabel.text = [self.filteredContentList objectAtIndex:indexPath.row];
        NSLog(@"filtered problem %@",self.filteredContentList);
    }
    else {

        // myCell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        myCell.thisReuseIdentifier = CellIdentifier;
        myCell.object = object;
        [myCell refreshSubviews];
    }
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
                
                if ([[object objectForKey:@"Solution"] length] > 0)
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
                
                if ([[object objectForKey:@"Solution"] length] > 0)
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

-(void)loadDetailViewForObject:(NSDictionary*)object
{
    SolutionsViewController* solutionsViewController = (SolutionsViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SolutionsViewController"];
    solutionsViewController.object = object;
    [self.navigationController pushViewController:solutionsViewController animated:YES];
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

//-(void) updateDatabase
//{
//  [self getUserData];
//   // [self getData];
//
//}

//-(void)getUserData {
//    //Select current user data
//    NSString *path1 = [self dataFilePathofDocuments:@"HealthQuestions.sqlite"];
//    NSFileManager* fileManager = [NSFileManager defaultManager];
//    if ([fileManager fileExistsAtPath:path1])
//    {
//        self.userArray = [SQLiteAccess selectManyRowsWithSQL:@"Select * FROM HealthQuestions"];
//    }
//    else
//    {
//        self.userArray = [NSArray array];
//    }
//    [self getData];
//}

-(void)getData {
    NSString* urlString = @"http://mandellmobileapps.com/TIHProblems.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
                                        {
                                            if (completedOperation.operationErrorMessage.length == 0)
                                            {
                                                
                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
                                                {
                                                    self.updatedRecords = completedOperation.json;
                                                    //  NSLog(@"self.updatedRecords %@",self.updatedRecords);
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
                                                    //  NSLog(@"getData JSON is not array");
                                                    self.updatedRecords = [NSMutableArray array];
                                                    [self.activityIndicator stopAnimating];
                                                }
                                            }
                                            else
                                            {
                                                // NSLog(@"getData %@",completedOperation.operationErrorMessage);
                                                [self.activityIndicator stopAnimating];
                                                self.updatedRecords = [NSMutableArray array];
                                            }
                                            
                                            
                                        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];
    
}

-(void) deleteExistingTable
{
    
    
    NSString *sql = @"DROP TABLE IF EXISTS Problems";
    [SQLiteAccess updateWithSQL:sql];
    
    [self buildNewTable];
    
}




-(void)buildNewTable
{
    
    NSString* newSql = @"CREATE TABLE \"Problems\" (\"SectionNumber\" TEXT,\"Problem\" TEXT,\"Solution\" TEXT, \"Note\" TEXT, \"RecordId\" INTEGER DEFAULT (null) )";
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
        
        [sql appendFormat:@"INSERT INTO Problems ("];
        [sql appendFormat:@"Problem,"];
        [sql appendFormat:@"Solution,"];
        [sql appendFormat:@"Note,"];
        [sql appendFormat:@"SectionNumber,"];
        [sql appendFormat:@"RecordId"];
        [sql appendFormat:@") VALUES "];
        
        
        for (i=start; i<(start+thisBlock); i++)
        {
            NSDictionary* item = [self.updatedRecords objectAtIndex:i];
            [sql appendFormat:@"("];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Problem"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Solution"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Note"]]];
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


//-(void)updateFiles
//{
//
//    BOOL success = [self checkForUpdatedFilesFolder];
//
//    if (success)
//    {
//
//        for (NSString* filename in self.filesToUpdate)
//        {
//
//            if ([self string:filename containsString:@".html"])
//            {
//
//                NSString* urlString = [NSString stringWithFormat:@"http://mandellmobileapps.com/ProSportsHtmlFiles/%@",filename];
//                NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//
//                NSError* error;
//                NSString* htmlString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
//                if (error)
//                {
//                    //                     NSLog(@"Error: %@",[error localizedDescription]);
//                }
//
//                if(htmlString.length>0)
//                {
//                    [self writeString:htmlString toFile:filename];
//                }
//            }
//            else if ([self string:filename containsString:@".png"])
//            {
//
//
//
//            }
//        }
//    }
//    [[NSUserDefaults standardUserDefaults] setInteger:self.newVersion forKey:@"version"];
//    self.updateLabel.hidden = YES;
//    self.updateVersionButton.hidden = YES;
//    self.notNowButton.hidden = YES;
//    self.updateView.hidden = YES;
//    [self.activityIndicator stopAnimating];
//    //    NSLog(@"date complete %@",[NSDate date]);
//    [self delayedLoad];
//
//}
//
//-(BOOL) checkForUpdatedFilesFolder
//{
//    NSString *dataPath = [self dataFilePathofDocuments:@"/UpdatedFiles"];
//    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
//    {
//        NSError* error;
//        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error];
//        if (error)
//        {
//            NSLog(@"Error creating updated files folder");
//            return NO;
//        }
//    }
//    return YES;
//
//}
//
//-(void) writeString:(NSString*)string toFile:(NSString*)filename
//{
//
//    NSString* stringPath = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",filename]];
//
//    NSError* error;
//    BOOL successSave = [string writeToFile:stringPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
//    if (!successSave)
//    {
//        NSLog(@"Error: %@   saving file: %@",[error localizedDescription],filename);
//    }
//}

#pragma mark - Search Bar test

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
   // self.filteredContentList = [self.objects0 filteredArrayUsingPredicate:resultPredicate];
    self.filteredContentList = [self.totalArray filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

-(void) cancelAllOperations {
    [self.mgOperationsQueue cancelAllOperations];
}


@end
