//
//  BlogPostsMenu.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/2/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "BlogPostsMenu.h"
#import "MgNetworkOperation2.h"
#import "BlogPostsViewController.h"
#import "BlogPostMenuCell.h"
#import "SQLiteAccess.h"

@implementation BlogPostsMenu
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Blog Posts";
    self.navigationController.navigationBar.tintColor= [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    //  [self.activityIndicator stopAnimating];
    
    // initialize API operation queue

    
    self.mgOperationsQueue = [[NSOperationQueue alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{});
    //    [self performSelector:@selector(runDatabaseQuery) withObject:nil afterDelay:0.0];
    
[self runDatabaseQuery];

}


-(void)runDatabaseQuery
{
    
    //    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
//Paid version
//    NSString* objects0Sql = @"SELECT * FROM WeeklyBlogPosts ORDER BY RowOrder DESC";
//    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
    
//Free version
    
    NSString* objects0Sql = @"SELECT * FROM WeeklyBlogPosts WHERE Free = \"1\" ORDER BY RowOrder DESC";
    self.objects0 = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
    

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
    
    int h = 230;
    
    return h;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.objects0.count;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* object;
    object = [self.objects0 objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"MyCell";
    BlogPostMenuCell *myCell = (BlogPostMenuCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
        // myCell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        myCell.thisReuseIdentifier = CellIdentifier;
        myCell.object = object;
        [myCell refreshSubviews];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 304, 117)];
    imgView.frame = CGRectMake((myCell.frame.size.width/2)-(imgView.frame.size.width/2), (myCell.frame.size.height/2)-(imgView.frame.size.height/2), 304, 117);
    [myCell addSubview:imgView];
    
    return myCell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary*  object;
    
    if (self.objects0.count > 0)
    {
        object = [self.objects0 objectAtIndex:indexPath.row];
    }
    
    if (object)
    {
        
        if ([[object objectForKey:@"HTML"] length] > 0)
        {
            [self loadDetailViewForObject:object];
        }
        
    }
}

-(void)loadDetailViewForObject:(NSDictionary*)object
{
    BlogPostsViewController* blogPostsViewController = (BlogPostsViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BlogPostsViewController"];
    blogPostsViewController.object = object;
    [self.navigationController pushViewController:blogPostsViewController animated:YES];
}



#pragma mark - Database Methods

//-(void)checkVersion
//{
//    
//    NSString* urlString = @"http://mandellmobileapps.com/TIHWeeklyBlogPosts.php";
//    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//        MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
//                {
//                    if (completedOperation.operationErrorMessage.length == 0)
//                        {
//    
//                            if ([completedOperation.json isKindOfClass:[NSArray class]])
//                                    {
//                                        self.updatedVersions = completedOperation.json;
//                                            //  NSLog(@"self.updatedVersions %@",self.updatedVersions);
//                                            if (self.updatedVersions.count > 0)
//                                                {
//                                                NSDictionary* thisVersion = [self.updatedVersions lastObject];
//
//                                                self.updateEnabled = [[thisVersion objectForKey:@"Update Enabled"] boolValue];
//    
//                                                NSArray* files = [thisVersion objectForKey:@"FilesToUpdate"];
//                                                self.filesToUpdate = [NSMutableArray array];
//    
//                                                for (NSDictionary* item in files)
//                                                    {
//                                                        [self.filesToUpdate addObject:[item objectForKey:@"filename"]];
//                                                    }
//    
//    
//                                                    self.newVersion = [[thisVersion objectForKey:@"NewVersion"] integerValue];
//    
//                                                    self.currentVersion = [[NSUserDefaults standardUserDefaults] integerForKey:@"version"];
//                                                            if (self.currentVersion < self.newVersion) {
//                                                              //  self.updateLabel.hidden = YES;
//                                                              //  self.updateVersionButton.hidden = YES;
//                                                              //  self.notNowButton.hidden = YES;
//                                                              //  self.updateView.hidden = YES;
//                                                                //                        }
//                                                            }
//                                                        }
//                                                    }
//                                                    else
//                                                    {
//                                                        NSLog(@"getVersion JSON is not array");
//    
//                                                    }
//                                                }
//                                            else
//                                            {
//                                                    NSLog(@"getVersion %@",completedOperation.operationErrorMessage);
//                                                }
//                                            }];
//    
//        [self.mgOperationsQueue addOperation:mgOperation];
//    
//    [self getData];
//    
//    
//}
//
//-(void) updateDatabase
//{
//
//    [self getData];
//
//}
//
//-(void)getData {
//    NSString* urlString = @"http://mandellmobileapps.com/TIHWeeklyBlogPosts.php";
//    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
//                                        {
//                                            if (completedOperation.operationErrorMessage.length == 0)
//                                            {
//                                                
//                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
//                                                {
//                                                    self.updatedRecords = completedOperation.json;
//                                                    //  NSLog(@"self.updatedRecords %@",self.updatedRecords);
//                                                    if (self.updatedRecords.count>0)
//                                                    {
//                                                        [self deleteExistingTable];
//                                                    }
//                                                    else
//                                                    {
//                                                        [self.activityIndicator stopAnimating];
//                                                    }
//                                                    
//                                                }
//                                                else
//                                                {
//                                                    //  NSLog(@"getData JSON is not array");
//                                                    self.updatedRecords = [NSMutableArray array];
//                                                    [self.activityIndicator stopAnimating];
//                                                }
//                                            }
//                                            else
//                                            {
//                                                // NSLog(@"getData %@",completedOperation.operationErrorMessage);
//                                                [self.activityIndicator stopAnimating];
//                                                self.updatedRecords = [NSMutableArray array];
//                                            }
//                                            
//                                            
//                                        }];
//    
//    [self.mgOperationsQueue addOperation:mgOperation];
//    
//}
//
//-(void) deleteExistingTable
//{
//    
//    
//    NSString *sql = @"DROP TABLE IF EXISTS WeeklyBlogPosts";
//    [SQLiteAccess updateWithSQL:sql];
//    
//    [self buildNewTable];
//    
//}
//
//-(void)buildNewTable
//{
//    
//    NSString* newSql = @"CREATE TABLE \"WeeklyBlogPosts\" (\"Date\" TEXT, \"Title\" TEXT, \"Image\" TEXT, \"HTML\" TEXT, \"Free\" TEXT, \"RowOrder\" INTEGER, \"RecordId\" INTEGER DEFAULT (null) )";
//    [SQLiteAccess updateWithSQL:newSql];
//    
//    NSInteger count = self.updatedRecords.count;
//    NSInteger i = 0;
//    NSInteger start = 0;
//    NSInteger thisBlock = 100;
//    BOOL complete = NO;
//    
//    while (!complete)
//    {
//        
//        if ((count-start)<100)
//        {
//            thisBlock = (count-start);
//        }
//        
//        NSMutableString* sql = [NSMutableString string];
//        
//        [sql appendFormat:@"INSERT INTO WeeklyBlogPosts ("];
//        [sql appendFormat:@"Date,"];
//        [sql appendFormat:@"Title,"];
//        [sql appendFormat:@"Image,"];
//        [sql appendFormat:@"HTML,"];
//        [sql appendFormat:@"Free,"];
//        [sql appendFormat:@"RowOrder,"];
//        [sql appendFormat:@"RecordId"];
//        [sql appendFormat:@") VALUES "];
//        
//        
//        for (i=start; i<(start+thisBlock); i++)
//        {
//            NSDictionary* item = [self.updatedRecords objectAtIndex:i];
//            [sql appendFormat:@"("];
//            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Date"]]];
//            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Title"]]];
//            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Image"]]];
//            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"HTML"]]];
//            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Free"]]];
//            [sql appendFormat:@"\"%@\",",[self checkIntegers:[item objectForKey:@"RowOrder"]]];
//            [sql appendFormat:@"%@",[self checkIntegers:[item objectForKey:@"RecordId"]]];
//            [sql appendString:@"),"];
//            
//        }
//        
//        NSString* thisSql1 = [sql substringToIndex:sql.length - 1];
//        
//        [SQLiteAccess insertWithSQL:thisSql1];
//        
//        // increment new start position
//        start = start + thisBlock;
//        if (start < (count-1))
//        {
//            complete = NO;
//        }
//        else
//        {
//            complete = YES;
//        }
//    }
//    
//    [self runDatabaseQuery];
//    
//    
//}
//
//-(NSString*)checkNull:(id)thisString
//{
//    if((thisString == [NSNull null]) || ([thisString isEqualToString:@"<NULL>"]) || ([thisString isEqualToString:@"<null>"]) || (!thisString))
//    {
//        return @"";
//    }
//    return thisString;
//    
//}
//
//-(NSString*)checkIntegers:(id)thisString
//{
//    if((thisString == [NSNull null]) || ([thisString isEqualToString:@"<NULL>"]) || ([thisString isEqualToString:@"<null>"]) || (!thisString))
//    {
//        return @"0";
//    }
//    return thisString;
//    
//}
//
//-(void)updateNotificationReceived
//{
//    
//    NSString* table = @"WeeklyBlogPosts";
//    
//    NSString* type = [self.object objectForKey:@"Title"];
//    
//    if (type.length>0)
//    {
//        
//        NSMutableString* section0SqlNoVars = [NSMutableString string];
//        
//        [section0SqlNoVars appendString:@"SELECT * FROM %@ WHERE Title = \"%@\""];
//        
//        [section0SqlNoVars appendString:@" ORDER BY \"RowOrder\" DESC"];
//
//        
//        NSString* title = [self.object objectForKey:@"Title"];
//        NSString* section0Sql = [NSString stringWithFormat:section0SqlNoVars,table,title];;
//        
//        self.objects0 = [SQLiteAccess selectManyRowsWithSQL:section0Sql];
//        
//        NSLog (@"base objects0 %@",self.objects0);
//        
//        [self.thisTableView reloadData];
//    }
//    
//}
//
//-(void) getFiles
//{
//    
//    NSString* urlString = @"http://mandellmobileapps.com/TIHFilesToUpdate.php";
//    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
//                                        {
//                                            if (completedOperation.operationErrorMessage.length == 0)
//                                            {
//                                                
//                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
//                                                {
//                                                    NSArray* temp = completedOperation.json;
//                                                    //                NSLog(@"getFiles %@",temp);
//                                                    self.filesToUpdate = [NSMutableArray array];
//                                                    if (temp.count > 0)
//                                                    {
//                                                        for (NSDictionary* item in temp)
//                                                        {
//                                                            [self.filesToUpdate addObject:[item objectForKey:@"FilesToUpdate"]];
//                                                        }
//                                                    }
//                                                    // [self updateFiles];
//                                                    
//                                                }
//                                            }
//                                        }];
//    
//    [self.mgOperationsQueue addOperation:mgOperation];
//    
//    
//}
//
//
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
//                NSString* urlString = [NSString stringWithFormat:@"http://mandellmobileapps.com/TIHBlogPostsHTMLs/%@",filename];
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
//
//    [self.activityIndicator stopAnimating];
//    //    NSLog(@"date complete %@",[NSDate date]);
//    [self runDatabaseQuery];
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


-(void) cancelAllOperations {
    [self.mgOperationsQueue cancelAllOperations];
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




@end

