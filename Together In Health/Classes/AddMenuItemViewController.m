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
    
    self.title = @"Add Menu Item";
    //    self.navigationController.navigationBar.backgroundColor= [UIColor blackColor];
    
   self.navigationController.navigationBar.tintColor= [UIColor colorWithRed:15/255.0 green:50/255.0 blue:30/255.0 alpha:1];
    
    self.breakfastArray = [NSMutableArray array];
    self.lunchArray = [NSMutableArray arrayWithObjects: @"test1", nil];
    self.dinnerArray = [NSMutableArray arrayWithObjects: @"test1", nil];
    self.snacksArray = [NSMutableArray arrayWithObjects: @"test1", nil];

    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 4;
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
            return self.breakfastArray.count;
            break;
        case 1:
            return self.lunchArray.count;
            break;
        case 2:
            return self.dinnerArray.count;
            break;
        case 3:
            return self.snacksArray.count;
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
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 7, tableView.bounds.size.width, 30)];
    //    [headerLabel setBackgroundColor:[UIColor lightGrayColor]];
    [headerLabel setTextColor:[UIColor blackColor]];
    
    if (section == 0)
        [headerLabel setText:@"   Breakfast"];
    else if (section == 1)
        [headerLabel setText:@"   Lunch"];
    else if (section == 2)
        [headerLabel setText:@"   Dinner"];
    else if (section == 3)
        [headerLabel setText:@"   Snacks"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    AddMenuItemCell *MyCell = (AddMenuItemCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    switch (indexPath.section) {
        case 0:
            MyCell.menuItemLabel.text = [self.breakfastArray objectAtIndex:indexPath.row];
            break;
        case 1:
            MyCell.menuItemLabel.text = [self.lunchArray objectAtIndex:indexPath.row];
            break;
        case 2:
            MyCell.menuItemLabel.text = [self.dinnerArray objectAtIndex:indexPath.row];
            break;
        case 3:
            MyCell.menuItemLabel.text = [self.snacksArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }

    
    return MyCell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    RecipeViewController* recipeViewController = (RecipeViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"RecipeViewController"];
    [self.navigationController pushViewController:recipeViewController animated:YES];
    
}

@end
