//
//  AppDelegate.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/2/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "AppDelegate.h"
#import "MgNetworkOperation2.h"
#import "GoalSetViewController.h"
#import "GoalGamePlanViewController.h"
#import "Day.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "UpGradeViewController.h"


@interface AppDelegate ()

-(void)getUserData;
-(void)getData;
- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;
-(NSString*)pathForFilename:(NSString*)filename;
@property (nonatomic, strong) NSURLConnection *myConnection;
@property (nonatomic) NSInteger currentVersion;
@property (nonatomic) NSInteger newVersion;
@property (nonatomic) NSInteger currentBlogVersion;
@property (nonatomic) NSInteger newBlogVersion;
@property (nonatomic) BOOL updateEnabled;
@property (nonatomic) BOOL updateBlogEnabled;
@property (strong, nonatomic) NSOperationQueue* mgOperationsQueue;
@property (strong, nonatomic) NSMutableArray *filesToUpdate;
@property (strong, nonatomic) NSMutableArray *blogfilesToUpdate;
@property (strong, nonatomic) NSArray *updatedRecords;
@property (strong, nonatomic) NSArray *updatedVersions;
@property (strong, nonatomic) NSArray *updatedBlogRecords;
@property (strong, nonatomic) NSArray *updatedBlogVersions;
@property (strong, nonatomic) NSArray *userArray;

//  for goal calendar

@property (strong, nonatomic)	NSMutableArray *backgroundColors;
	// 0; Today
	// 1; RetirementDay
	// 2; Workdays
	// 3; Non Workdays
	// 4; Holidays
	// 5; Manual Workdays
	// 6; Manual Non Workdays
	// 7; Current Calendar Background Color
	// 8: Current Predefined Background Color - used?
@property (strong, nonatomic)	NSMutableArray *textColors;
	// 0; Today
	// 1; RetirementDay
	// 2; Workdays
	// 3; Non Workdays
	// 4; Manual Workdays
	// 5; Manual Non Workdays
	// 6; Holidays
	// 7; Current Calendar textColor
	// 8: Current Predefined textColor  -  not used
@property (strong, nonatomic)	NSMutableDictionary *colorSettings;
@end

@implementation AppDelegate



-(void)loadPersistent
{

    NSString* path = [self dataFilePathofDocuments:@"DaysPersistent.archive"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        self.days = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
       // NSLog(@"loadPersistent self.days %@", self.days);
    }
    else
    {
        self.days = [NSMutableArray array];
      //  NSLog(@"loadPersistent self.days = [NSMutableArray array]");

    }
    

    self.subscriptionLevel = [[NSUserDefaults standardUserDefaults] integerForKey:@"subscriptionLevel"];
    
    self.contactEmail = [[NSUserDefaults standardUserDefaults] objectForKey:@"contactEmail"];
    if (!self.contactEmail)
    {
        self.contactEmail = [NSString string];
    }
    
    // how to obviscate?
    self.zohoAuthToken = @"1b761d65e759974cb77c0bf236ec1473";
    
    //  temp
    self.subscriptionLevel = 0;
}

-(void)savePersistent
{
//    NSLog(@"savePersistent self.days %@", self.days);
    NSString* path = [self dataFilePathofDocuments:@"DaysPersistent.archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:self.days toFile:path];
    if (!success) {
        NSLog(@"DaysPersistent.archive did not save");
    }
   
    [self saveFavoriteActivities];
}

-(void)loadFavoriteActivities
{

    NSString* path = [self dataFilePathofDocuments:@"FavoriteActivities.archive"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSMutableArray* favs = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        for (Activity* item in favs)
        {
            for (Activity* act in self.allActivities)
            {
                if ([item.activityName isEqualToString:act.activityName])
                {
                    act.isFavorite = YES;
                }
            }
        }
    }

}



-(void)saveFavoriteActivities
{
    NSMutableArray* favorites = [NSMutableArray array];
    for (Activity* item in self.allActivities)
    {
        if (item.isFavorite)
        {
            [favorites addObject:item];
        }
    }
    
    NSString* path = [self dataFilePathofDocuments:@"FavoriteActivities.archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:favorites toFile:path];
    if (!success) {
        NSLog(@"FavoriteActivities.archive did not save");
    }
}

-(NSMutableArray*) initialCreationOfActivities
{
   NSMutableArray* initialActivities = [NSMutableArray arrayWithObjects:
                              [Activity activityName:@"Movement" category:@"0" Type:@"0"],
                              [Activity activityName:@"Abdominal exercises (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Aqua bootcamp" category:@"0" Type:@"0"],
                              [Activity activityName:@"Back exercises (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Construction" category:@"0" Type:@"0"],
                              [Activity activityName:@"Cardio (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Bike riding" category:@"0" Type:@"0"],
                              [Activity activityName:@"Bike (spin)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Bootcamp (misc.)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Chair exercises" category:@"0" Type:@"0"],
                              [Activity activityName:@"Chest exercises (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Crossfit" category:@"0" Type:@"0"],
                              [Activity activityName:@"Exercise class (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Hiking (easy trail)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Hiking (medium trail)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Hiking (strenuous trail)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Hiking (very strenuous trail)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Housework (light)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Housework (heavy)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Interval training (run/walk)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Kayaking (leisurely)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Kayaking (moderate)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Kayaking (strenuous)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Kayaking (very strenuous)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Kickboxing" category:@"0" Type:@"0"],
                              [Activity activityName:@"Leg exercises (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Lower body exercises (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Running (slow pace)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Running (moderate pace)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Running (quick pace)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Shoulder exercises (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Snow skiing" category:@"0" Type:@"0"],
                              [Activity activityName:@"Snowboarding" category:@"0" Type:@"0"],
                              [Activity activityName:@"Swimming (laps)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Swimming (pleasure)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Tai Chi" category:@"0" Type:@"0"],
                              [Activity activityName:@"Upper body exercises (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Wakeboarding" category:@"0" Type:@"0"],
                              [Activity activityName:@"Walking (slow pace)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Walking (moderate pace)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Walking (quick pace)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Interval training (run/walk)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Water aerobics" category:@"0" Type:@"0"],
                              [Activity activityName:@"Weight lifting (body building)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Weight lifting (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yardwork (light)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yardwork (heavy)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (general)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (Anusara)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (Ashtanga)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (Bikram)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (Hatha)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (Iyengar)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (Restorative)" category:@"0" Type:@"0"],
                              [Activity activityName:@"Yoga (Vinyasa)" category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],
//                              [Activity activityName: category:@"0" Type:@"0"],


    
                                nil];

    return initialActivities;
}

-(NSMutableArray*) initialCreationOfPlates
{
    NSMutableArray* initialPlates = [NSMutableArray arrayWithObjects:
                [Plate plateImage:@"Balanced Plate.png" protein:@"1/4 Protein" carbs:@"1/4 Carbs" vegetables:@"1/2 Vegetables" plateId:0],
                [Plate plateImage:@"Balanced Plate20.png" protein:@"3/8 Protein" carbs:@"1/8 Carbs" vegetables:@"1/2 Vegetables" plateId:1],
                [Plate plateImage:@"Balanced Plate21.png" protein:@"1/8 Protein" carbs:@"3/8 Carbs" vegetables:@"1/2 Vegetables" plateId:2],
                [Plate plateImage:@"Balanced Plate13.png" protein:@"1/2 Protein" carbs:@"1/4 Carbs" vegetables:@"1/4 Vegetables" plateId:3],
                [Plate plateImage:@"Balanced Plate19.png" protein:@"1/2 Protein" carbs:@"3/8 Carbs" vegetables:@"1/8 Vegetables" plateId:4],
                [Plate plateImage:@"Balanced Plate18.png" protein:@"1/2 Protein" carbs:@"1/8 Carbs" vegetables:@"3/8 Vegetables" plateId:5],
                [Plate plateImage:@"Balanced Plate8.png" protein:@"1/4 Protein" carbs:@"1/2 Carbs" vegetables:@"1/4 Vegetables" plateId:6],
                [Plate plateImage:@"Balanced Plate22.png" protein:@"3/8 Protein" carbs:@"1/2 Carbs" vegetables:@"1/8 Vegetables" plateId:7],
                [Plate plateImage:@"Balanced Plate23.png" protein:@"1/8 Protein" carbs:@"1/2 Carbs" vegetables:@"3/8 Vegetables" plateId:8],
                                     
                [Plate plateImage:@"Balanced Plate4.png" protein:@"0 Protein" carbs:@"1/2 Carbs" vegetables:@"1/2 Vegetables" plateId:9],
                [Plate plateImage:@"Balanced Plate3.png" protein:@"1/2 Protein" carbs:@"0 Carbs" vegetables:@"1/2 Vegetables" plateId:10],
                [Plate plateImage:@"Balanced Plate6.png" protein:@"1/2 Protein" carbs:@"1/2 Carbs" vegetables:@"0 Vegetables" plateId:11],
                [Plate plateImage:@"Balanced Plate7.png" protein:@"1/4 Protein" carbs:@"0 Carbs" vegetables:@"3/4 Vegetables" plateId:12],
                [Plate plateImage:@"Balanced Plate16.png" protein:@"0 Protein" carbs:@"3/4 Carbs" vegetables:@"1/4 Vegetables" plateId:13],
                [Plate plateImage:@"Balanced Plate14.png" protein:@"3/4 Protein" carbs:@"0 Carbs" vegetables:@"1/4 Vegetables" plateId:14],
                [Plate plateImage:@"Balanced Plate15.png" protein:@"0 Protein" carbs:@"1/4 Carbs" vegetables:@"3/4 Vegetables" plateId:15],
                [Plate plateImage:@"Balanced Plate17.png" protein:@"1/4 Protein" carbs:@"3/4 Carbs" vegetables:@"0 Vegetables" plateId:16],
                [Plate plateImage:@"Balanced Plate9.png" protein:@"3/4 Protein" carbs:@"1/4 Carbs" vegetables:@"0 Vegetables" plateId:17],
                [Plate plateImage:@"Balanced Plate10.png" protein:@"0 Protein" carbs:@"1 Carbs" vegetables:@"0 Vegetables" plateId:18],
                [Plate plateImage:@"Balanced Plate12.png" protein:@"0 Protein" carbs:@"0 Carbs" vegetables:@"1 Vegetables" plateId:19],
                [Plate plateImage:@"Balanced Plate11.png" protein:@"1 Protein" carbs:@"0 Carbs" vegetables:@"0 Vegetables" plateId:20],
                [Plate plateImage:@"Balanced Plate24.png" protein:@"1/3 Protein" carbs:@"0 Carbs" vegetables:@"2/3 Vegetables" plateId:21],
                [Plate plateImage:@"Balanced Plate25.png" protein:@"0 Protein" carbs:@"1/3 Carbs" vegetables:@"2/3 Vegetables" plateId:22],
                [Plate plateImage:@"Balanced Plate26.png" protein:@"1/3 Protein" carbs:@"2/3 Carbs" vegetables:@"0 Vegetables" plateId:23],
                [Plate plateImage:@"Balanced Plate27.png" protein:@"0 Protein" carbs:@"2/3 Carbs" vegetables:@"1/3 Vegetables" plateId:24],
                [Plate plateImage:@"Balanced Plate28.png" protein:@"2/3 Protein" carbs:@"0 Carbs" vegetables:@"1/3 Vegetables" plateId:25],
                [Plate plateImage:@"Balanced Plate29.png" protein:@"2/3 Protein" carbs:@"1/3 Carbs" vegetables:@"0 Vegetables" plateId:26],
                [Plate plateImage:@"Balanced Plate5.png" protein:@"1/3 Protein" carbs:@"1/3 Carbs" vegetables:@"1/3 Vegetables" plateId:27],
                [Plate plateImage:@"DessertPlate.png" protein:@"" carbs:@"" vegetables:@"Sweets/Desserts" plateId:28],
                [Plate plateImage:@"FriedGreasyPlate.png" protein:@"" carbs:@"" vegetables:@"Fried/Greasy" plateId:29],
                                         
                                     
                                         nil];
    
    return initialPlates;
}

-(NSMutableArray*) initialCreationOfMoods
{
    NSMutableArray* initialMoods = [NSMutableArray arrayWithObjects:
        [Mood moodImage:@"MoodImageHappy.png" moodId:0],
        [Mood moodImage:@"MoodImageMad.png" moodId:1],
        [Mood moodImage:@"MoodImageBored.png" moodId:2],
        [Mood moodImage:@"MoodImageSad.png" moodId:3],
        [Mood moodImage:@"MoodImageStressed.png" moodId:4],
                        
                                     
    nil];
    
    return initialMoods;
}


-(void) checkForDatabaseInDocuments
{
    NSString *path1 = [self dataFilePathofBundle:@"TIHDatabase.sqlite"];
    NSString *path2 = [self dataFilePathofDocuments:@"TIHDatabase.sqlite"];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path2])
    {
        NSError* error;
        [fileManager copyItemAtPath:path1 toPath: path2 error:&error];
        
        if (error != nil)
        {
            NSLog(@"Error message is %@", [error localizedDescription]);
        }
        
    }
    
    
}

-(void) checkForBlogDatabaseInDocuments
{
    NSString *path1 = [self dataFilePathofBundle:@"TIHDatabase.sqlite"];
    NSString *path2 = [self dataFilePathofDocuments:@"TIHDatabase.sqlite"];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path2])
    {
        NSError* error;
        [fileManager copyItemAtPath:path1 toPath: path2 error:&error];
        
        if (error != nil)
        {
            NSLog(@"Error message is %@", [error localizedDescription]);
        }
        
    }
    
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    

    //return [[NSUserDefaults standardUserDefaults]boolForKey:@"isAgree"];;
    return YES;
    
}


-(void) checkForUpdates
{
// start version check
    [self checkForDatabaseInDocuments];
    [self checkVersion];

    [self checkForBlogDatabaseInDocuments];
    [self checkBlogVersion];
    

}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.


    
    [Fabric with:@[[Crashlytics class]]];

        self.tabBarController = (UITabBarController *)self.window.rootViewController;
        self.tabBarController.delegate = self;
    
        [self loadPersistent];
        self.day = [self dayForDate:[NSDate date]];
    
        self.allActivities = [self initialCreationOfActivities];
        [self loadFavoriteActivities];
        self.allPlates = [self initialCreationOfPlates];
        self.allMoods = [self initialCreationOfMoods];

    
    self.mgOperationsQueue = [[NSOperationQueue alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{});
        [self checkForUpdates];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    [self savePersistent];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self savePersistent];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    self.day = [self dayForDate:[NSDate date]];

    [self checkForUpdates];

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self checkForUpdates];

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self savePersistent];
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
-(NSString*)pathForFilename:(NSString*)filename
{
    NSString* path1 = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",filename]];
    NSString* path2 = [self dataFilePathofBundle:filename];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path1])
    {
        return path1;
    }
    else if ([fileManager fileExistsAtPath:path2])
    {
        return path2;
    }
    
    return @"";
    
}


-(Day*)dayForDate:(NSDate*)thisDate
{
    NSDate* atMidnight = [TIHDate dateAtMidnightFromDate:thisDate];
    
    Day* thisDay;

    
    for (Day* day in self.days) {
        if ([atMidnight compare:day.date] == NSOrderedSame) {
            thisDay = day;
            NSLog(@"thisDay %@  %lu", day.date,day.drinksArray.count);
            return thisDay;
        }
    }

    Day *newDay = [[Day alloc] initWithDate:atMidnight];
    
    [self.days addObject:newDay];
    [self savePersistent];
    NSLog(@"newDay %@  %lu", newDay.date,newDay.drinksArray.count);
    return newDay;
    
}
    
    //  doesn't create day object, returns nil if none.
    // Don't want to create day object just for displaying goals on calendar
-(Day*)calendarDayForDate:(NSDate*)thisDate
{
    NSDate* atMidnight = [TIHDate dateAtMidnightFromDate:thisDate];
    
    Day* thisDay;
    for (Day* day in self.days)
    {
        
        if ([atMidnight compare:day.date] == NSOrderedSame) {
            thisDay = day;
        }
    }
    
    if (thisDay) {
        return thisDay;
    }


    return nil;
        

}

-(void)displayAlert:(NSString*)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alert.tag = 1001;
    [alert show];
    
}

#pragma mark - API Methods

-(NSString*) keyValuesForDictionary:(NSDictionary*)theseParams {
    
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in theseParams) {
        NSString *value = [theseParams valueForKey:key];
        [string appendFormat:@"%@=%@&", key, value];
    }
    
    return [string substringToIndex:string.length-1];
}

#pragma mark -
#pragma mark  Zoho Methods


-(void)upsertContactForEmail:(NSString*)email atSubcriptionLevel:(NSInteger)subscriptionLevel inController:(UpGradeViewController*)controller
{
    self.contactEmail = email;
    [[NSUserDefaults standardUserDefaults] setObject:self.contactEmail forKey:@"contactEmail"];
    self.subscriptionLevel = subscriptionLevel;
    [[NSUserDefaults standardUserDefaults] setInteger:self.subscriptionLevel forKey:@"subscriptionLevel"];
    
    NSString *xmlString = [NSString stringWithFormat:
       @"<Contacts>"
       "<row no=\"1\">"
       "<FL val=\"Last Name\">%@</FL>"
       "<FL val=\"Email\">%@</FL>"
       "<FL val=\"SubscriptionLevel\">%lu</FL>"
       "</row>"
       "</Contacts>",
       email,email,subscriptionLevel];
    
    NSString* urlString = [NSString stringWithFormat:@"https://crm.zoho.com/crm/private/xml/Contacts/insertRecords?newFormat=1&duplicateCheck=2&authtoken=%@&scope=crmapi&xmlData=%@",self.zohoAuthToken,xmlString];
    NSString* urlStringEscaped =[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSURL* url = [NSURL URLWithString:urlStringEscaped];
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:NO responseBlock:^(MgNetworkOperation2* completedOperation)
        {
            if (completedOperation.operationErrorMessage.length>0)
            {
                [self displayAlert:completedOperation.operationErrorMessage];
                [controller subscriptionCompleteWithSuccess:NO];
            }
            else
            {
               NSLog(@"rawResponse %@\n\n",completedOperation.rawResponse);
               [controller subscriptionCompleteWithSuccess:YES];

            }
            
        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];

}



-(void)checkSubscriptionLevel
{
    NSString* method = @"https://crm.zoho.com/crm/private/json/Contacts/getSearchRecordsByPDC";
    NSDictionary* paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"1",
                                @"newFormat",
                                self.zohoAuthToken,
                                @"authtoken",
                                @"crmapi",
                                @"scope",
                                @"email",
                                @"searchColumn",
                                self.contactEmail,
                                @"searchValue",
                                nil];

    NSString* urlString = [NSMutableString stringWithFormat:@"%@?%@",method,[self keyValuesForDictionary:paramsDict]];
    NSString* urlStringEscaped =[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:urlStringEscaped];
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:YES responseBlock:^(MgNetworkOperation2* completedOperation)
          {
            if (completedOperation.operationErrorMessage.length>0)
            {
                [self displayAlert:completedOperation.operationErrorMessage];
            }
            else
            {
               NSLog(@"rawResponse %@\n\n",completedOperation.rawResponse);
//                self.subscriptionLevel = subscriptionLevel;
//                [[NSUserDefaults standardUserDefaults] setInteger:self.subscriptionLevel forKey:@"subscriptionLevel"];
            }
              
    }];

    [self.mgOperationsQueue addOperation:mgOperation];
    
    
}








 #pragma mark - Recipe Database Methods

-(void)checkVersion
{
    
        NSString* urlString = @"http://mandellmobileapps.com/TIHversion.php";
        NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
        MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:YES responseBlock:^(MgNetworkOperation2* completedOperation)
                {
                    if (completedOperation.operationErrorMessage.length == 0)
                        {
    
                            if ([completedOperation.json isKindOfClass:[NSArray class]])
                                    {
                                        self.updatedVersions = completedOperation.json;
                                            //  NSLog(@"self.updatedVersions %@",self.updatedVersions);
                                            if (self.updatedVersions.count > 0)
                                                {
                                                NSDictionary* thisVersion = [self.updatedVersions lastObject];
    
                                                self.updateEnabled = [[thisVersion objectForKey:@"Update Enabled"] boolValue];
    
                                                if (self.updateEnabled) {
                                                
                                                 
                                                    NSArray* files = [thisVersion objectForKey:@"FilesToUpdate"];
                                                    self.filesToUpdate = [NSMutableArray array];
        
                                                    for (NSDictionary* item in files)
                                                        {
                                                            [self.filesToUpdate addObject:[item objectForKey:@"filename"]];
                                                        }
        
        
                                                        self.newVersion = [[thisVersion objectForKey:@"NewVersionRecipes"] integerValue];
                                                        
                                                        
        
                                                        self.currentVersion = [[NSUserDefaults standardUserDefaults] integerForKey:@"version"];
                                                                if (self.currentVersion < self.newVersion)
                                                                {
                                                                    [self updateDatabase];
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        NSLog(@"getVersion JSON is not array");
    
                                                    }
                                                }
                                                else
                                                {
                                                    NSLog(@"getVersion %@",completedOperation.operationErrorMessage);
                                                }
                                            }];
    
        [self.mgOperationsQueue addOperation:mgOperation];
  
    
}

-(void) updateDatabase
{
  [self getUserData];

}

-(void)getUserData {
    //Select current user data
    NSString *path1 = [self dataFilePathofDocuments:@"TIHDatabase.sqlite"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path1])
    {
        self.userArray = [SQLiteAccess selectManyRowsWithSQL:@"Select * FROM Recipes"];
    }
    else
    {
        self.userArray = [NSArray array];
    }
    [self getData];
}

-(void)getData {
    NSString* urlString = @"http://mandellmobileapps.com/TIHRecipes.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:YES responseBlock:^(MgNetworkOperation2* completedOperation)
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
                                                    }
                                                    
                                                }
                                                else
                                                {
                                                  //  NSLog(@"getData JSON is not array");
                                                    self.updatedRecords = [NSMutableArray array];
                                                }
                                            }
                                            else
                                            {
                                               // NSLog(@"getData %@",completedOperation.operationErrorMessage);
                                                self.updatedRecords = [NSMutableArray array];
                                            }
                                            
                                            
                                        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];
    
}

-(void) deleteExistingTable
{
    
    
    NSString *sql = @"DROP TABLE IF EXISTS Recipes";
    [SQLiteAccess updateWithSQL:sql];
    
    [self buildNewTable];
    
}




-(void)buildNewTable
{
    
    NSString* newSql = @"CREATE TABLE \"Recipes\" (\"Recipe\" TEXT, \"SectionNumber\" TEXT, \"RecipeDetail\" TEXT, \"Note\" TEXT, \"Favorite\" TEXT, \"Free\" TEXT, \"RecordId\" INTEGER DEFAULT (null) )";
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
        
        [sql appendFormat:@"INSERT INTO Recipes ("];
        [sql appendFormat:@"Recipe,"];
        [sql appendFormat:@"SectionNumber,"];
        [sql appendFormat:@"RecipeDetail,"];
        [sql appendFormat:@"Note,"];
        [sql appendFormat:@"Favorite,"];
        [sql appendFormat:@"Free,"];
        [sql appendFormat:@"RecordId"];
        [sql appendFormat:@") VALUES "];
        
        
        for (i=start; i<(start+thisBlock); i++)
        {
            NSDictionary* item = [self.updatedRecords objectAtIndex:i];
            [sql appendFormat:@"("];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Recipe"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"SectionNumber"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"RecipeDetail"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Note"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Favorite"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Free"]]];
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
    [self updateUserData];
    
    
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


-(void) updateUserData
{
    for (NSDictionary* item in self.userArray ) {
        if (![item objectForKey:@"Note"])
        {
            [item setValue:@"" forKeyPath:@"Note"];
        }
        if ([item objectForKey:@"RecordId"])
        {
            if ([[item objectForKey:@"RecordId"] length] > 0)
            {
                NSString *sql = [NSString stringWithFormat:@"Update Recipes SET Favorite = \"%@\", Note = \"%@\" WHERE RecordId = \"%@\"", [item objectForKey:@"Favorite"], [item objectForKey:@"Note"], [item objectForKey:@"RecordId"]];
                [SQLiteAccess updateWithSQL:sql];
            }
        }
    }
    [self getFiles];
    
}

-(void) getFiles
{
    
    NSString* urlString = @"http://mandellmobileapps.com/TIHFilesToUpdate.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:YES responseBlock:^(MgNetworkOperation2* completedOperation)
                                        {
                                            if (completedOperation.operationErrorMessage.length == 0)
                                            {
                                                
                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
                                                {
                                                    NSArray* temp = completedOperation.json;
                                                                    NSLog(@"getFiles %@",temp);
                                                    self.filesToUpdate = [NSMutableArray array];
                                                    if (temp.count > 0)
                                                    {
                                                        for (NSDictionary* item in temp)
                                                        {
                                                            [self.filesToUpdate addObject:[item objectForKey:@"FileName"]];
                                                        }
                                                    }
                                                     [self updateFiles];
                                                    
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

                NSString* urlString = [NSString stringWithFormat:@"http://mandellmobileapps.com/TIHhtmls/%@",filename];
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateData" object:nil];

    }
    [[NSUserDefaults standardUserDefaults] setInteger:self.newVersion forKey:@"version"];


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

- (BOOL)string:(NSString*)string containsString:(NSString*)other {
  NSRange range = [string rangeOfString:other];
  return range.length != 0;
}


#pragma BlogPosts Database Methods

-(void)checkBlogVersion
{
    
    NSString* urlString = @"http://mandellmobileapps.com/TIHversion.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:YES responseBlock:^(MgNetworkOperation2* completedOperation)
                                        {
                                            if (completedOperation.operationErrorMessage.length == 0)
                                            {
                                                
                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
                                                {
                                                    self.updatedBlogVersions = completedOperation.json;
                                                    //  NSLog(@"self.updatedVersions %@",self.updatedVersions);
                                                    if (self.updatedBlogVersions.count > 0)
                                                    {
                                                        NSDictionary* thisBlogVersion = [self.updatedBlogVersions lastObject];
                                                        
                                                        self.updateBlogEnabled = [[thisBlogVersion objectForKey:@"Blog Update Enabled"] boolValue];
                                                        
                                                        if (self.updateBlogEnabled) {
                                                            
                                                            
                                                            NSArray* files = [thisBlogVersion objectForKey:@"FilesToUpdate"];
                                                            self.blogfilesToUpdate = [NSMutableArray array];
                                                            
                                                            for (NSDictionary* item in files)
                                                            {
                                                                [self.blogfilesToUpdate addObject:[item objectForKey:@"blogfilename"]];
                                                            }
                                                            
                                                            
                                                            self.newBlogVersion = [[thisBlogVersion objectForKey:@"WeeklyBlogPosts"] integerValue];
                                                            
                                                            
                                                            
                                                            self.currentBlogVersion = [[NSUserDefaults standardUserDefaults] integerForKey:@"versionBlog"];
                                                            if (self.currentBlogVersion < self.newBlogVersion)
                                                            {
                                                                [self updateBlogDatabase];
                                                            }
                                                        }
                                                    }
                                                }
                                                else
                                                {
                                                    NSLog(@"getBlogVersion JSON is not array");
                                                    
                                                }
                                            }
                                            else
                                            {
                                                NSLog(@"getBlogVersion %@",completedOperation.operationErrorMessage);
                                            }
                                        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];
    
    
}

-(void) updateBlogDatabase
{
   // [self getBlogUserData];
    [self getBlogData];
    
}

//-(void)getBlogUserData {
//    //Select current user data
//    NSString *path1 = [self dataFilePathofDocuments:@"TIHDatabase.sqlite"];
//    NSFileManager* fileManager = [NSFileManager defaultManager];
//    if ([fileManager fileExistsAtPath:path1])
//    {
//        self.blogUserArray = [SQLiteAccess selectManyRowsWithSQL:@"Select * FROM BlogPosts"];
//    }
//    else
//    {
//        self.blogUserArray = [NSArray array];
//    }
//    
//}

-(void)getBlogData {
    NSString* urlString = @"http://mandellmobileapps.com/TIHWeeklyBlogPosts.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:YES responseBlock:^(MgNetworkOperation2* completedOperation)
                                        {
                                            if (completedOperation.operationErrorMessage.length == 0)
                                            {
                                                
                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
                                                {
                                                    self.updatedBlogRecords = completedOperation.json;
                                                    //  NSLog(@"self.updatedRecords %@",self.updatedRecords);
                                                    if (self.updatedBlogRecords.count>0)
                                                    {
                                                        [self deleteExistingBlogTable];
                                                    }
                                                    else
                                                    {
                                                    }
                                                    
                                                }
                                                else
                                                {
                                                    //  NSLog(@"getData JSON is not array");
                                                    self.updatedBlogRecords = [NSMutableArray array];
                                                }
                                            }
                                            else
                                            {
                                                // NSLog(@"getData %@",completedOperation.operationErrorMessage);
                                                self.updatedBlogRecords = [NSMutableArray array];
                                            }
                                            
                                            
                                        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];
    
}

-(void) deleteExistingBlogTable
{
    
    
    NSString *sql = @"DROP TABLE IF EXISTS WeeklyBlogPosts";
    [SQLiteAccess updateWithSQL:sql];
    
    [self buildNewBlogTable];
    
}




-(void)buildNewBlogTable
{
    
    NSString* newSql = @"CREATE TABLE \"WeeklyBlogPosts\" (\"Date\" TEXT, \"Title\" TEXT, \"Image\" TEXT, \"HTML\" TEXT, \"Free\" TEXT, \"RowOrder\" INTEGER, \"RecordId\" INTEGER DEFAULT (null) )";
    [SQLiteAccess updateWithSQL:newSql];
    
    NSInteger count = self.updatedBlogRecords.count;
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
        
        [sql appendFormat:@"INSERT INTO Recipes ("];
        [sql appendFormat:@"Date,"];
        [sql appendFormat:@"Title,"];
        [sql appendFormat:@"Image,"];
        [sql appendFormat:@"HTML,"];
        [sql appendFormat:@"Free,"];
        [sql appendFormat:@"RowOrder,"];
        [sql appendFormat:@"RecordId"];
        [sql appendFormat:@") VALUES "];
        
        
        for (i=start; i<(start+thisBlock); i++)
        {
            NSDictionary* item = [self.updatedBlogRecords objectAtIndex:i];
            [sql appendFormat:@"("];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Date"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Title"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Image"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"HTML"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"Free"]]];
            [sql appendFormat:@"\"%@\",",[self checkNull:[item objectForKey:@"RowOrder"]]];
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
   // [self updateUserData];
    [self getBlogFiles];
    
    
}

-(NSString*)checkBlogNull:(id)thisString
{
    if((thisString == [NSNull null]) || ([thisString isEqualToString:@"<NULL>"]) || ([thisString isEqualToString:@"<null>"]) || (!thisString))
    {
        return @"";
    }
    return thisString;
    
}

-(NSString*)checkBlogIntegers:(id)thisString
{
    if((thisString == [NSNull null]) || ([thisString isEqualToString:@"<NULL>"]) || ([thisString isEqualToString:@"<null>"]) || (!thisString))
    {
        return @"0";
    }
    return thisString;
    
}


//-(void) updateBlogUserData
//{
//    for (NSDictionary* item in self.userArray ) {
//        if (![item objectForKey:@"Note"])
//        {
//            [item setValue:@"" forKeyPath:@"Note"];
//        }
//        if ([item objectForKey:@"RecordId"])
//        {
//            if ([[item objectForKey:@"RecordId"] length] > 0)
//            {
//                NSString *sql = [NSString stringWithFormat:@"Update Recipes SET Favorite = \"%@\", Note = \"%@\" WHERE RecordId = \"%@\"", [item objectForKey:@"Favorite"], [item objectForKey:@"Note"], [item objectForKey:@"RecordId"]];
//                [SQLiteAccess updateWithSQL:sql];
//            }
//        }
//    }
//    [self getBlogFiles];
//    
//}

-(void) getBlogFiles
{
    
    NSString* urlString = @"http://mandellmobileapps.com/FilesToUpdate.php";
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url isJson:YES responseBlock:^(MgNetworkOperation2* completedOperation)
                                        {
                                            if (completedOperation.operationErrorMessage.length == 0)
                                            {
                                                
                                                if ([completedOperation.json isKindOfClass:[NSArray class]])
                                                {
                                                    NSArray* temp = completedOperation.json;
                                                                    NSLog(@"getblog Files %@",temp);
                                                    self.blogfilesToUpdate = [NSMutableArray array];
                                                    if (temp.count > 0)
                                                    {
                                                        for (NSDictionary* item in temp)
                                                        {
                                                            [self.blogfilesToUpdate addObject:[item objectForKey:@"BlogFilesToUpdate"]];
                                                        }
                                                    }
                                                    [self updateBlogFiles];
                                                    
                                                }
                                            }
                                        }];
    
    [self.mgOperationsQueue addOperation:mgOperation];
    
    
}


-(void)updateBlogFiles
{
    
    BOOL success = [self checkForUpdatedFilesFolder];
    
    if (success)
    {
        
        for (NSString* blogfilename in self.blogfilesToUpdate)
        {
            
            if ([self string:blogfilename containsString:@".html"])
            {
                
                NSString* urlString = [NSString stringWithFormat:@"http://mandellmobileapps.com/TIHhtmls/%@",blogfilename];
                NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                
                NSError* error;
                NSString* htmlString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
                if (error)
                {
                    //                     NSLog(@"Error: %@",[error localizedDescription]);
                }
                
                if(htmlString.length>0)
                {
                    [self writeString:htmlString toFile:blogfilename];
                }
            }
            else if ([self string:blogfilename containsString:@".png"])
            {
                
                
                
            }
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateData" object:nil];

    }
    [[NSUserDefaults standardUserDefaults] setInteger:self.newBlogVersion forKey:@"versionBlog"];
    
    
}

-(BOOL) checkForUpdatedBlogFilesFolder
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

-(void) writeStringBlog:(NSString*)string toFile:(NSString*)blogfilename
{
    
    NSString* stringPath = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",blogfilename]];
    
    NSError* error;
    BOOL successSave = [string writeToFile:stringPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!successSave)
    {
        NSLog(@"Error: %@   saving file: %@",[error localizedDescription],blogfilename);
    }
}


-(void) cancelAllBlogOperations {
    [self.mgOperationsQueue cancelAllOperations];
}

- (BOOL)blogstring:(NSString*)string containsString:(NSString*)other {
    NSRange range = [string rangeOfString:other];
    return range.length != 0;
}



-(void) loadGoals
{
    NSString* path = [self dataFilePathofDocuments:@"GoalsArray.archive"];
    self.goalsArray = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (self.goalsArray.count < 3)
    {
        self.goalsArray = [NSMutableArray arrayWithObjects:
                           [Goal thisGoal],
                           [Goal thisGoal],
                           [Goal thisGoal],
                           nil];
        NSInteger g = 1;
        for (Goal* item in self.goalsArray)
        {
            item.goalName = [NSString stringWithFormat:@"Goal %lu",g];
            item.goalColor = [self defaultGoalColors:g];
            g++;
        }
        [self saveGoals];
        
    }

}

-(UIColor*)defaultGoalColors:(NSInteger)g
{
        switch (g) {
      case 1:
            return [UIColor blueColor];
        break;
      case 2:
            return [UIColor redColor];
        break;
      case 3:
            return [UIColor yellowColor];
        break;
      default:
        break;
    }
    return [UIColor whiteColor];
}

-(void)saveGoals
{
    
    NSString* path = [self dataFilePathofDocuments:@"GoalsArray.archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:self.goalsArray toFile:path];
    if (!success) {
        NSLog(@"GoalsArray.archive Did Not Save");
    }
}



@end
