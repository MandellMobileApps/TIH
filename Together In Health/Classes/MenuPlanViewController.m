//
//  MenuPlanViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "MenuPlanViewController.h"
#import "MenuPlanCell.h"
#import "RecipeViewController.h"
#import "MenuPlan.h"
#import "MenuMeal.h"
#import "AddMenuItemViewController.h"
#import "AppDelegate.h"
#import "MgNetworkOperation2.h"
#import "AbstractViewController.h"
#import "UpGradeViewController.h"
#import "MenuDay.h"
#import "MenuDayViewController.h"

enum menuPlanIndex {
    planIndex = 0,
    addItemIndex = 1,

    
};

@implementation MenuPlanViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.weekdays = [NSArray arrayWithObjects:
                         @"Sunday",
                         @"Monday",
                         @"Tuesday",
                         @"Wednesday",
                         @"Thursday",
                         @"Friday",
                         @"Saturday",
                         nil];
    
    [self.appDelegate loadMenuPlans];
    if (self.appDelegate.menuPlansArray.count>0)
    {
        self.menuPlan = [self.appDelegate.menuPlansArray objectAtIndex:0];
    }
    else
    {
        NSLog(@"menu plans not loading");
    }
    [self.navigationController setNavigationBarHidden:YES];
    self.navbarView.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    self.navbarTitleLabel.text = @"Menu Plan";
//    self.navbarTitleLabel.font = [UIFont fontWithName:@"Arial" size:44.0];
    
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
//    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
//    self.navigationController.navigationBar.titleTextAttributes = size;
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
//
//
//    CGRect frameimg2 = CGRectMake(0, 0, 50, 20);
//    UIButton *resetButton = [[UIButton alloc] initWithFrame:frameimg2];
//    [resetButton addTarget:self action:@selector(reset:)
//         forControlEvents:UIControlEventTouchUpInside];
//    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
//    UIBarButtonItem *barBtn2 =[[UIBarButtonItem alloc] initWithCustomView:resetButton];
//    [self.navigationItem setLeftBarButtonItem:barBtn2];

    
    
    [self checkForUpdates];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkForUpdates) name:@"checkForUpdates" object:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self performSelector:@selector(delayedLoad) withObject:nil afterDelay:0.5];
    
//        switch (self.appDelegate.subscriptionLevel) {
//    
//            case SubscriptionFree:
//
//                self.upgradeButton.hidden = NO;
//                self.upgradeButton.enabled = YES;
//
//                break;
//            case SubscriptionPaid1:
//
//               self.upgradeButton.hidden = NO;
//                self.upgradeButton.enabled = NO;
//                break;
//
//            case SubscriptionPaid2:
//
//                self.upgradeButton.hidden = NO;
//                self.upgradeButton.enabled = NO;
//                break;
//            default:
//                break;
//        }
//    UIBarButtonItem* resetButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(reset:)];
//    
//    self.navigationItem.leftBarButtonItem = resetButton;
    
}

-(void)updateMenuButtons
{
    // clear buttons
    self.menuPlanButton.enabled = YES;
    self.addMenuItemButton.enabled = YES;

    self.menuPlanButton.backgroundColor = [UIColor whiteColor];
    [self.menuPlanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.addMenuItemButton.backgroundColor = [UIColor whiteColor];
    [self.addMenuItemButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    // update selected button
    switch (self.menuPlanIndex) {
        case planIndex:
            self.menuPlanButton.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
            [self.menuPlanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.menuPlanButton.enabled = NO;
            break;
        case addItemIndex:
            self.addMenuItemButton.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
            [self.addMenuItemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.addMenuItemButton.enabled = NO;
            break;
    }
}

//-(IBAction)menuPlan:(*UIButton)sender
//        {
//            
//            if (!self.menuPlanViewController)
//            {
//                self.menuPlanViewController = (MenuPlanViewController*)
//                [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
//                 instantiateViewControllerWithIdentifier:@"MenuPlanViewController"];
//            }
//
//            self.navbarTitleLabel.text = @"Menu Plans";
//           // self.menuPlanIndex = menuPlanIndex;
//            [self updateMenuButtons];
//
//            //    [self unloadOtherViewControllersExceptIndex:StressIndex];
//
//
//        }
//-(IBAction)addMenuItem:(*UIButton)sender
//        {
//
//            if (!self.addMenuItemViewController)
//            {
//                self.addMenuItemViewController = (AddMenuItemViewController*)
//                [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
//                 instantiateViewControllerWithIdentifier:@"AddMenuItemViewController"];
//
//            }
//            //self.activityTrackerViewController.view.frame = [self baseRect];
//
//
//            self.navbarTitleLabel.text = @"Create Menu Plan";
//            self.menuPlanIndex = addItemIndex;
//            [self updateMenuButtons];
//            //     [self unloadOtherViewControllersExceptIndex:ActivityIndex];
//
//
//        }

-(void) checkForUpdates
{
    // start version check
    [self checkForDatabaseInDocuments];
    [self checkVersion];
    
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

-(void)delayedLoad
{
    
    //self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    
    NSString* objects0Sql = @"SELECT * FROM TIHDatabase WHERE SectionNumber = \"0\" ORDER BY RowOrder";
    self.object = [SQLiteAccess selectManyRowsWithSQL:objects0Sql];
    
//    NSString* objects1Sql = @"SELECT * FROM ProSports WHERE Type = \"Main\" AND  SectionNumber = \"1\" ORDER BY RowOrder";
//    self.objects1 = [SQLiteAccess selectManyRowsWithSQL:objects1Sql];
//
//    NSString* objects2Sql = @"SELECT * FROM ProSports WHERE Type = \"Main\" AND  SectionNumber = \"2\" ORDER BY RowOrder";
//    self.objects2 = [SQLiteAccess selectManyRowsWithSQL:objects2Sql];
//
//    self.loadAd = NO;
    
}

-(void) checkVersion
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
                                                    //                NSLog(@"self.updatedVersions %@",self.updatedVersions);
                                                    if (self.updatedVersions.count > 0)
                                                    {
                                                        NSDictionary* thisVersion = [self.updatedVersions lastObject];
                                                        
                                                        self.updateEnabled = [[thisVersion objectForKey:@"Update Enabled"] boolValue];
                                                        
                                                        NSArray* files = [thisVersion objectForKey:@"FilesToUpdate"];
                                                        self.filesToUpdate = [NSMutableArray array];
                                                        
                                                        for (NSDictionary* item in files)
                                                        {
                                                            [self.filesToUpdate addObject:[item objectForKey:@"filename"]];
                                                        }
                                                        
                                                        self.newVersion = [[thisVersion objectForKey:@"NewVersion"] integerValue];
                                                    }
                                                }
                                            }
                                        }
                                        ];
}
                                        
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.menuPlan.menuDays.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat h = 50;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    

        int h = 35;
        return h;

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;

}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 22)];
    [headerView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.bounds.size.width-10, 22)];
    [headerLabel setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    [headerLabel setText:[self.weekdays objectAtIndex:section]];
    [headerLabel setTextColor:[UIColor whiteColor]];
    [headerView addSubview:headerLabel];
    
//    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
//    [addButton addTarget:self action:@selector(recipes:) forControlEvents:UIControlEventTouchUpInside];
//    addButton.frame=CGRectMake(280, 2.5, 28, 28);
////    [addButton setImage:[UIImage imageNamed:@"addButtonImage.png"] forState:UIControlStateNormal];
//    addButton.backgroundColor = [UIColor whiteColor];
//    addButton.layer.cornerRadius = 14;
//    [headerView addSubview:addButton];
    
    return headerView;
    
}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    MenuPlanCell *myCell = (MenuPlanCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    MenuDay* thisMenuDay = [self.menuPlan.menuDays objectAtIndex:indexPath.section];
    myCell.selectedMenuDay = thisMenuDay;
    myCell.row = indexPath.row;
    [myCell refreshCell];
    
    return myCell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
switch (self.appDelegate.subscriptionLevel)
    {
    
case SubscriptionFree:
    {
        [self loadUpgradeViewController];
        
    }
    break;
    
case SubscriptionPaid1:
    {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        self.selectedMenuDay = [self.menuPlan.menuDays objectAtIndex:indexPath.section];
        
        MenuDayViewController* menuDayViewController = (MenuDayViewController*)
        [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
         instantiateViewControllerWithIdentifier:@"MenuDayViewController"];
        menuDayViewController.selectedMenuDayName = [self.weekdays objectAtIndex:indexPath.section];
        menuDayViewController.selectedMenuDay = [self.menuPlan.menuDays objectAtIndex:indexPath.section];
        [self.navigationController pushViewController:menuDayViewController animated:YES];
    }
    
    break;
case SubscriptionPaid2:
    {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        self.selectedMenuDay = [self.menuPlan.menuDays objectAtIndex:indexPath.section];
        
        MenuDayViewController* menuDayViewController = (MenuDayViewController*)
        [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
         instantiateViewControllerWithIdentifier:@"MenuDayViewController"];
        menuDayViewController.selectedMenuDayName = [self.weekdays objectAtIndex:indexPath.section];
        menuDayViewController.selectedMenuDay = [self.menuPlan.menuDays objectAtIndex:indexPath.section];
        [self.navigationController pushViewController:menuDayViewController animated:YES];
    }
    break;
default:
    break;
}

}
#pragma mark - Navigation

-(void)loadMenuDayViewController
{
    

}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([segue.identifier isEqualToString:@"MenuDaySegue"])
//    {
//        MenuDayViewController* menuDayViewController = [segue destinationViewController];
//        menuDayViewController.selectedMenuDay = self.selectedMenuDay;
//        menuDayViewController.selectedMenuDayName = self.selectedMenuDayName;
//    }
//
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    
}

-(IBAction)recipes:(id)sender {
        RecipeViewController* recipeViewController = (RecipeViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
        instantiateViewControllerWithIdentifier:@"RecipeViewController"];
        [self.navigationController pushViewController:recipeViewController animated:YES];
}

-(IBAction)reset:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to clear all?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear all",nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
    }
    else if (buttonIndex == 1) {
        //[self.menuPlanCell resetCell];
    }
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

//- (IBAction)menutypeSegment:(UISegmentedControl* )sender {
//
//
//    switch (sender.selectedSegmentIndex) {
//        case 0:
//         self.menuTypeRating = 1;
//            {
//            MenuPlanViewController* menuPlanViewController = (menuPlanViewController*)
//            [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
//             instantiateViewControllerWithIdentifier:@"MenuPlanViewController"];
//            menuPlanViewController.navigationItem.hidesBackButton = YES;
//            [self.navigationController pushViewController:menuPlanViewController animated:NO];
//
//        }
//            break;
//        case 1:
//            self.menuTypeRating = 2;
//            StressTrackerViewController* stressTrackerViewController = (StressTrackerViewController*)
//            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//             instantiateViewControllerWithIdentifier:@"StressTrackerViewController"];
//            stressTrackerViewController.navigationItem.hidesBackButton = YES;
//            [self.navigationController pushViewController:stressTrackerViewController animated:NO];
//            break;
//        default:
//            break;
//    }

-(CGRect)baseRect
{
    CGRect baseRect = self.view.bounds;
    NSInteger menuHeight = 77+64;
    baseRect.origin.y = menuHeight;
    baseRect.size.height = self.view.frame.size.height-menuHeight;
    return baseRect;
    
}

-(IBAction)upgrade:(id)sender
{
 [self loadUpgradeViewController];
}





@end
