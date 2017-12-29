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
#import "AppDelegate.h"

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
    
    self.title = @"Add Menu Items";
    //    self.navigationController.navigationBar.backgroundColor= [UIColor blackColor];
    
  // self.navigationController.navigationBar.tintColor= [UIColor colorWithRed:15/255.0 green:50/255.0 blue:30/255.0 alpha:1];
//     self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
//    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
//
//    self.navigationController.navigationBar.titleTextAttributes = size;
//
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
//
//        CGRect frameimg = CGRectMake(0, 0, 65, 20);
//        UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
//        someButton.tag = 2;
//        [someButton addTarget:self action:@selector(navButtonTapped:)
//             forControlEvents:UIControlEventTouchUpInside];
//    [someButton setTitle:@"Recipes" forState:UIControlStateNormal];
//        UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//
//        [self.navigationItem setRightBarButtonItem:barBtn];
    
    
//    CGRect frameimg2 = CGRectMake(0, 0, 50, 20);
//    UIButton *resetButton = [[UIButton alloc] initWithFrame:frameimg2];
//    resetButton.tag = 1;
//    [resetButton addTarget:self action:@selector(navButtonTapped:)
//         forControlEvents:UIControlEventTouchUpInside];
//    [resetButton setTitle:@"Done" forState:UIControlStateNormal];
//    UIBarButtonItem *barBtn2 =[[UIBarButtonItem alloc] initWithCustomView:resetButton];
//
//    [self.navigationItem setLeftBarButtonItem:barBtn2];
    
//    self.breakfastArray = [NSMutableArray array];
//    self.lunchArray = [NSMutableArray arrayWithObjects: @"test1", nil];
//    self.dinnerArray = [NSMutableArray arrayWithObjects: @"test1", nil];
//    self.snacksArray = [NSMutableArray arrayWithObjects: @"test1", nil];

    
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

-(void)navButtonTapped:(UIButton*)button
{


}

-(void)loadDatesForTheWeek
{
    

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
            return self.appDelegate.breakfastItemsArray.count;
            break;
        case 1:
            return self.appDelegate.lunchItemsArray.count;
            break;
        case 2:
            return self.appDelegate.dinnerItemsArray.count;
            break;
        case 3:
            return self.appDelegate.snackItemsArray.count;
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
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, tableView.bounds.size.width-10, 30)];
    //    [headerLabel setBackgroundColor:[UIColor lightGrayColor]];
    [headerLabel setTextColor:[UIColor blackColor]];
    
    if (section == 0)
        [headerLabel setText:@"Breakfast"];
    else if (section == 1)
        [headerLabel setText:@"Lunch"];
    else if (section == 2)
        [headerLabel setText:@"Dinner"];
    else if (section == 3)
        [headerLabel setText:@"Snacks"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    AddMenuItemCell *myCell = (AddMenuItemCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    switch (indexPath.section) {
        case 0:
            myCell.menuItem = [self.appDelegate.breakfastItemsArray objectAtIndex:indexPath.row];
            break;
        case 1:
            myCell.menuItem = [self.appDelegate.lunchItemsArray objectAtIndex:indexPath.row];
            break;
        case 2:
            myCell.menuItem = [self.appDelegate.dinnerItemsArray objectAtIndex:indexPath.row];
            break;
        case 3:
            myCell.menuItem = [self.appDelegate.snackItemsArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    [myCell refreshUI];
    
    return myCell;
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
