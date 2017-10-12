//
//  FullOpeningViewController.m
//  SimpleTable
//
//  Created by Cami Mandell on 3/27/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "FullOpeningViewController.h"
#import "FullOpeningCell.h"
#import "HealthQuestionsViewController.h"
#import "BlogPostsViewController.h"
#import "SeasonalVegGameViewController.h"
#import "HealthMeasuresViewController.h"
#import "RecipeViewController.h"
#import "MenuPlanViewController.h"
#import "BlogPostsMenu.h"
#import "AbstractViewController.h"
#import "GenericWebViewController.h"
#import "GenericWebViewController2.h"
#import "MenuItem.h"
#import "UnderstandBalanceViewController.h"

@implementation FullOpeningViewController

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
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.title = @"More";
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];

    self.menuFreeArray0 = [NSArray arrayWithObjects:@"Upgrade Now!", nil];
    
    self.menuFreeArray1 = [NSArray arrayWithObjects:
                          @"Recipes",
                          //@"Blog Posts",
                           nil];
                           
    self.menuFreeArray2 = [NSArray arrayWithObjects:
                           @"Plate breakdown",
                           @"Plate examples",
                           @"How to read a food label",
                           nil];
                          
    
    self.menuFreeArray3 = [NSArray arrayWithObjects:
                           @"About Together In Health",
                           @"Understanding Balance",
                           @"FAQs",
                           @"Directions",
                           @"Contact Us",
                           @"Share with a friend",
                           @"Rate this App",
                           @"Terms and Conditions",
                           nil];
    
    
    self.menuArrayS0 = [NSArray arrayWithObjects:@"Sign Out", nil];
    
    self.menuArrayS1 = [NSArray arrayWithObjects:
                        @"Recipes",
                        @"Blog Posts",
                        @"CSA and Farmer's Markets",
                        @"Health Questions Answered",
                        @"Understanding Balance",
                        nil];
    
    self.menuArrayS2 = [NSArray arrayWithObjects:
                        @"Playing For Health",
                       // @"Match the Veggie",
                        @"Try some new vegetables",
                        @"Plate breakdown",
                        @"Plate examples",
                        @"How to read a food label",
                        nil];
    
   self.menuArrayS3 =[NSArray arrayWithObjects:
                      
                      @"About Together In Health",
                      @"Understanding Balance",
                      @"FAQs",
                      @"Directions",
                      @"Contact Us",
                      @"Share with a friend",
                      @"Rate this App",
                      @"Terms and Conditions",
                      @"Health Measurements",
                      @"What they mean",
                       nil];
    
//    self.menuArrayS4 = [NSArray arrayWithObjects:
//                        @"Graph Settings",
//                        nil];
    
    self.menuArrayS5 = [NSArray arrayWithObjects:
                        @"Contact Us",
                        @"Terms and Conditions",
                        nil];

    
    self.menuImageArrayS1 = [NSArray arrayWithObjects:
                        @"TIHsettings.png",
                        @"Star.png",
                        @"",
                        @"",
                        @"",
                             @"",
                             @"",
                        nil];
    
    self.menuImageArrayS2 = [NSArray arrayWithObjects:
                        @"Balanced Plate.png",
                        @"",
                        @"",
                        nil];
    
    self.menuImageArrayS3 = [NSArray arrayWithObjects:
                        @"",
                        nil];
    
    self.menuImageArrayS4 = [NSArray arrayWithObjects:
                        @"",
                        @"",
                        nil];

    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
//
//-(NSMutableArray*) initialCreationOfMoreMenuItems
//{
//    NSMutableArray* initialMenuItems = [NSMutableArray arrayWithObjects:
//        [MenuItem itemLabel:@"Sign Out" itemImage:@"" itemSection:@"0" itemSubscriptionLabel:@""],
//                                        
//        [MenuItem itemLabel:@"Recipes" itemImage:@"" itemSection:@"1" itemSubscriptionType:@"FreeSubscription"],
//        [MenuItem itemLabel:@"Blog Posts" itemImage:@"" itemSection:@"1" itemSubscriptionType:@"FreeSubscription"],
//        [MenuItem itemLabel:@"CSA and Farmer's Markets" itemImage:@"1" itemSection:@"" itemSubscriptionType:@"PaidSubscription1"],
//        [MenuItem itemLabel:@"Health Questions Answered" itemImage:@"1" itemSection:@"" itemSubscriptionType:@""],
//        [MenuItem itemLabel:@"Understanding Balance" itemImage:@"1" itemSection:@"" itemSubscriptionType:@""],
//                                        
//        [MenuItem itemLabel:@"Playing For Health" itemImage:@"2" itemSection:@"" itemSubscriptionType:@""],
//        [MenuItem itemLabel:@"Match the Veggie" itemImage:@"2" itemSection:@"" itemSubscriptionType:@""],
//        [MenuItem itemLabel:@"Try some new vegetables" itemImage:@"2" itemSection:@"" itemSubscriptionType:@""],
//        [MenuItem itemLabel:@"Plate breakdown" itemImage:@"2" itemSection:@"" itemSubscriptionType:@""],
//        [MenuItem itemLabel:@"Plate examples" itemImage:@"2" itemSection:@"" itemSubscriptionType:@""],
//        [MenuItem itemLabel:@"How to read a food label" itemImage:@"2" itemSection:@"" itemSubscriptionType:@""],
//                                        
//
//                                     
//        nil];
//
//    return initialMenuItems;
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    //Paid version
   // return 5;
    
    //Free version
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 50;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    //Paid version
    
//    if (section == 0) {
//        int h1 = 0;
//        return h1;
//        
//    }
//    else {
//    
//    int h2 = 30;
//        return h2;
//    }
    
    //Free version
    int h = 30;
    return h;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //Paid version
//    switch (section) {
//        case 0:
//            return self.menuArrayS0.count;
//            break;
//        case 1:
//            return self.menuArrayS1.count;
//            break;
//        case 2:
//            return self.menuArrayS2.count;
//            break;
//        case 3:
//            return self.menuArrayS3.count;
//            break;
//        case 4:
//            return self.menuArrayS5.count;
//            break;
//            default:
//            break;
//
//    }
    
    //Free version
    
        switch (section) {
            case 0:
                return self.menuFreeArray1.count;
                break;
            case 1:
                return self.menuFreeArray2.count;
                break;
            case 2:
                return self.menuFreeArray3.count;
                break;
                default:
                break;
    
        }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 22)];
    //[headerView setBackgroundColor:[UIColor lightGrayColor]];
    [headerView setBackgroundColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]];

    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, tableView.bounds.size.width, 22)];
//    [headerLabel setBackgroundColor:[UIColor lightGrayColor]];
    [headerLabel setTextColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1]];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    
    //Paid version
    
//    if (section == 1)
//        [headerLabel setText:@"   Resources"];
//    else if (section == 2)
//        [headerLabel setText:@"   Games"];
//    else if (section == 3)
//        [headerLabel setText:@"   Health"];
//    else if (section == 4)
//        [headerLabel setText:@"   More"];

    //Free version
    if (section == 0)
    [headerLabel setText:@"   For Fun"];
    
    else if (section == 1)
        [headerLabel setText:@"   References"];
    
    else if (section == 2)
        [headerLabel setText:@"   Resources"];
    
    [headerView addSubview:headerLabel];

    return headerView;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    FullOpeningCell *MyCell = (FullOpeningCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Paid version
    
//   // MyCell.imageView.frame = CGRectMake(0, 0, 5, 5);
//
//    NSString* filename1 = [self.menuImageArrayS1 objectAtIndex:indexPath.row];
//    //NSString* filename2 = [self.menuImageArrayS2 objectAtIndex:indexPath.row];
//    //NSString* filename3 = [self.menuImageArrayS3 objectAtIndex:indexPath.row];
//    //NSString* filename4 = [self.menuImageArrayS4 objectAtIndex:indexPath.row];
//    
//    switch (indexPath.section) {
//        case 0:
//            MyCell.label1.text = [self.menuArrayS0 objectAtIndex:indexPath.row];
//            MyCell.accessoryType = UITableViewCellAccessoryNone;
//            break;
//        case 1:
//            MyCell.label1.text = [self.menuArrayS1 objectAtIndex:indexPath.row];
//             MyCell.imageView.image = [UIImage imageNamed:filename1];
//            break;
//        case 2:
//            MyCell.label1.text = [self.menuArrayS2 objectAtIndex:indexPath.row];
////            MyCell.imageView.image = [UIImage imageNamed:filename2];
//            break;
//        case 3:
//            MyCell.label1.text = [self.menuArrayS3 objectAtIndex:indexPath.row];
////             MyCell.imageView.image = [UIImage imageNamed:filename3];
//            break;
//        case 4:
//            MyCell.label1.text = [self.menuArrayS5 objectAtIndex:indexPath.row];
////            MyCell.imageView.image = [UIImage imageNamed:filename4];
//            break;
//        default:
//            break;
//    }
    
    //Free version
    
    switch (indexPath.section) {
        case 0:
            MyCell.label1.text = [self.menuFreeArray1 objectAtIndex:indexPath.row];
            break;
        case 1:
            MyCell.label1.text = [self.menuFreeArray2 objectAtIndex:indexPath.row];
            break;
        case 2:
            MyCell.label1.text = [self.menuFreeArray3 objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
    
    
    return MyCell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

[tableView deselectRowAtIndexPath:indexPath animated:NO];

    //Paid version
    
//switch (indexPath.section) {
//    case 0:
//
//    {
//
//    }
//    break;
//    case 1:
//        
//    if (indexPath.row == 0)
//    {
//        
//        RecipeViewController* recipeViewController = (RecipeViewController*)
//        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"RecipeViewController"];
//        [self.navigationController pushViewController:recipeViewController animated:YES];
//        
//
//    }
//        
//    else if (indexPath.row == 1) {
//        
//        BlogPostsMenu* blogPostsMenu = (BlogPostsMenu*)
//        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"BlogPostsMenu"];
//        [self.navigationController pushViewController:blogPostsMenu animated:YES];
//        
//    }
//        
//    else if (indexPath.row == 2)
//    {
//
//    }
//        
//    else if (indexPath.row == 3)
//    {
//        HealthQuestionsViewController* healthQuestionsViewController = (HealthQuestionsViewController*)
//        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"HealthQuestionsViewController"];
//        [self.navigationController pushViewController:healthQuestionsViewController animated:YES];
//    }
//        
//    
//    else if (indexPath.row == 4)
//    {
//
//    }
//    
//    break;
//case 2:
//        if (indexPath.row == 0) {
//            
//
//            
//        }
//        
//        else if (indexPath.row == 1) {
//            
//        SeasonalVegGameViewController* seasonalVegGameViewController = (SeasonalVegGameViewController*)
//        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//        instantiateViewControllerWithIdentifier:@"SeasonalVegGameViewController"];
//        [self.navigationController pushViewController:seasonalVegGameViewController animated:YES];
//            
//        }
//    break;
//case 3:
//    if (indexPath.row == 0)
//    {
//        
//        HealthMeasuresViewController* healthMeasuresViewController = (HealthMeasuresViewController*)
//        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"HealthMeasuresViewController"];
//        [self.navigationController pushViewController:healthMeasuresViewController animated:YES];
//        
//        
//    }
//    
//    else if (indexPath.row == 1)
//    {
//
//        
//    }
//
//    break;
//    
//case 4:
//
//    if (indexPath.row == 0)
//    {
//      //  [self openEmailClientWithTo:@"support@mandellmobileapps.com" andSubject:@"iCan support."
//     //                       andBody:@""];
//    }
//    
//    else if (indexPath.row ==1)
//    {
////        NSString *iTunesLink = @"https://itunes.apple.com/us/app/apple-store/id957991306?mt=8";
////        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
//    }
//        break;
//        default:
//        break;
//
//}
    
    
    //Free version

    
switch (indexPath.section) {
    case 0:
    if (indexPath.row == 0)
    {
        
        RecipeViewController* recipeViewController = (RecipeViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"RecipeViewController"];
        [self.navigationController pushViewController:recipeViewController animated:YES];
        
        
    }
    
//    else if (indexPath.row == 1) {
//        
//        BlogPostsMenu* blogPostsMenu = (BlogPostsMenu*)
//        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//         instantiateViewControllerWithIdentifier:@"BlogPostsMenu"];
//        [self.navigationController pushViewController:blogPostsMenu animated:YES];
//        
//    }
        break;

    case 1:
        
    if (indexPath.row == 0) {
        GenericWebViewController* genericWebViewController = (GenericWebViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"GenericWebViewController"];
        genericWebViewController.webViewType = indexPath.row;
        [self.navigationController pushViewController:genericWebViewController animated:YES];
    }
        
        else if (indexPath.row == 1) {
            GenericWebViewController* genericWebViewController = (GenericWebViewController*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController"];
            genericWebViewController.webViewType = indexPath.row;
            [self.navigationController pushViewController:genericWebViewController animated:YES];
        }
        
        else if (indexPath.row == 2) {
            GenericWebViewController* genericWebViewController = (GenericWebViewController*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController"];
            genericWebViewController.webViewType = indexPath.row;
            [self.navigationController pushViewController:genericWebViewController animated:YES];
        }

        
        break;
        
    case 2:
    
    
        if (indexPath.row == 0) {
            GenericWebViewController2* genericWebViewController2 = (GenericWebViewController2*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController2"];
            genericWebViewController2.webViewType2 = indexPath.row;
            [self.navigationController pushViewController:genericWebViewController2 animated:YES];
        }
        
        else if (indexPath.row == 1) {
            GenericWebViewController* genericWebViewController = (GenericWebViewController*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController"];
            genericWebViewController.webViewType2 = indexPath.row;
            [self.navigationController pushViewController:genericWebViewController animated:YES];
        }
        
        else if (indexPath.row == 2) {
            GenericWebViewController2* genericWebViewController2 = (GenericWebViewController2*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController2"];
            genericWebViewController2.webViewType2 = indexPath.row;
            [self.navigationController pushViewController:genericWebViewController2 animated:YES];
        }
        
        else if (indexPath.row == 3) {
            GenericWebViewController2* genericWebViewController2 = (GenericWebViewController2*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController2"];
            genericWebViewController2.webViewType2 = indexPath.row;
            [self.navigationController pushViewController:genericWebViewController2 animated:YES];
        }
        
        else if (indexPath.row == 4) {
                
                [self openEmailClientWithTo:@"support@mandellmobileapps.com" andSubject:@"Together In Health support"
                                    andBody:@""];
        }
        
        else if (indexPath.row == 5)
            {
                [self openEmailClientWithTo:@"" andSubject:@"Check out this cool new app."
                                    andBody:@"Check out more cool apps at <a href='http://www.mandellmobileapps.com/'>Mandell Mobile Apps</a>."];
                
            }
        
        else if (indexPath.row == 6) {
            
            NSString *iTunesLink = @"https://itunes.apple.com/us/app/apple-store/id957991306?mt=8";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
            
        }

        
        else if (indexPath.row == 7) {
            
            GenericWebViewController2* genericWebViewController2 = (GenericWebViewController2*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"GenericWebViewController2"];
            genericWebViewController2.webViewType2 = indexPath.row;
            [self.navigationController pushViewController:genericWebViewController2 animated:YES];
            
        }

        break;
        default:
        break;

}
}
@end
