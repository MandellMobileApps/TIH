//
//  OpeningViewController.m
//  SimpleTable
//
//  Created by Cami Mandell on 12/28/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "GoalMoreViewController.h"
//#import "BackgroundViewController.h"
#import "GoalMoreCell.h"
#import "ProgressViewController.h"
#import "ViewControllerGamePlan.h"
#import "GoalsMenuViewController.h"
#import "GoalCheckViewController.h"

@implementation GoalMoreViewController

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
    
    self.listArray = [NSArray arrayWithObjects:
                      @"Directions for goal setting",
                      @"Directions for game plans",
                      @"Directions for tracking progress",
                      
                      nil];
    
    self.listArray2 = [NSArray arrayWithObjects:
                       @"Example goal",
                       @"Example game plan",
                       nil];
    
    self.listArray3 = [NSArray arrayWithObjects:
                       @"Check your goal",
                       @"Invite a friend",
                       nil];

    
    self.progressViewController.textFieldBy.text = self.by1text;
    self.progressViewController.textFieldBy2.text = self.by2text;
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            return self.listArray.count;
            break;
        case 1:
            return self.listArray2.count;
            break;
        case 2:
            
#ifdef SimpleTableAdFree
            return  self.listArray3.count;
#else
            return self.listArray4.count;
#endif
        default:
            break;
            
    }
    
    return 0;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.section) {
        case 0:
            
            if (indexPath.row == 0)
            {
//                BackgroundViewController* backgroundViewController = (BackgroundViewController*)
//                [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]
//                 instantiateViewControllerWithIdentifier:@"BackgroundViewController"];
//                [self.navigationController pushViewController:backgroundViewController animated:YES];
                
            }
            break;
        case 1:
            if (indexPath.row == 0)
            {
                
                GoalsMenuViewController* goalsMenuViewController = (GoalsMenuViewController*)
                [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]
                 instantiateViewControllerWithIdentifier:@"GoalsMenuViewController"];
                [self.navigationController pushViewController:goalsMenuViewController animated:YES];

                
//                ViewControllerGoal1* viewControllerGoal1 = (ViewControllerGoal1*)
//                [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]
//                 instantiateViewControllerWithIdentifier:@"ViewControllerGoal1"];
//                [self.navigationController pushViewController:viewControllerGoal1 animated:YES];
                
            }
            
            else if (indexPath.row == 1)
            {
                ProgressViewController* progressViewController = (ProgressViewController*)
                [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]
                 instantiateViewControllerWithIdentifier:@"ProgressViewController"];
                [self.navigationController pushViewController:progressViewController animated:YES];
                
            }
            
            else if (indexPath.row == 2)
            {
                ViewControllerGamePlan* viewControllerGamePlan = (ViewControllerGamePlan*)
                [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]
                 instantiateViewControllerWithIdentifier:@"ViewControllerGamePlan"];
                [self.navigationController pushViewController:viewControllerGamePlan animated:YES];
                
            }
            break;
            
        case 2:
            
            if (indexPath.row == 0)
            {
                GoalCheckViewController* goalCheckViewController = (GoalCheckViewController*)
                [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]
                 instantiateViewControllerWithIdentifier:@"GoalCheckViewController"];
                [self.navigationController pushViewController:goalCheckViewController animated:YES];
                
            }
            
            else if (indexPath.row == 1)
            {
//                [self openEmailClientWithTo:@"support@mandellmobileapps.com" andSubject:@"iCan support."
//                                    andBody:@""];
            }
            
            else if (indexPath.row ==2)
            {
//                NSString *iTunesLink = @"https://itunes.apple.com/us/app/apple-store/id957991306?mt=8";
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
            }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Directions";
    }
    else if(section == 1)
    {
        return @"Examples";
    }
    else
    {
        return @"Resources";
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    GoalMoreCell *MyCell = (GoalMoreCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            MyCell.label1.text = [self.listArray objectAtIndex:indexPath.row];
            break;
        case 1:
            MyCell.label1.text = [self.listArray2 objectAtIndex:indexPath.row];
            break;
        case 2:
            
#ifdef SimpleTableAdFree
            MyCell.label1.text = [self.listArray3 objectAtIndex:indexPath.row];
#else
            MyCell.label1.text = [self.listArray4 objectAtIndex:indexPath.row];
#endif
            break;
        default:
            break;
    }
    
    
    return MyCell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 44;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 22;
    
    return h;
}


@end
