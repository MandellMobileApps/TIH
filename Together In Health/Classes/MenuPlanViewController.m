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
#import "AddMenuItemViewController.h"

@implementation MenuPlanViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Menu Plan";
    
    self.menuDayArray = [NSArray arrayWithObjects:
                         @"Sunday",
                         @"Monday",
                         @"Tuesday",
                         @"Wednesday",
                         @"Thursday",
                         @"Friday",
                         @"Saturday",
                         nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
        CGRect frameimg = CGRectMake(0, 0, 65, 20);
        UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
        [someButton addTarget:self action:@selector(recipes:)
             forControlEvents:UIControlEventTouchUpInside];
    [someButton setTitle:@"Recipes" forState:UIControlStateNormal];
        UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    
        [self.navigationItem setRightBarButtonItem:barBtn];
    
    
    CGRect frameimg2 = CGRectMake(0, 0, 50, 20);
    UIButton *resetButton = [[UIButton alloc] initWithFrame:frameimg2];
    [resetButton addTarget:self action:@selector(reset:)
         forControlEvents:UIControlEventTouchUpInside];
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    UIBarButtonItem *barBtn2 =[[UIBarButtonItem alloc] initWithCustomView:resetButton];
    
    [self.navigationItem setLeftBarButtonItem:barBtn2];
    
    
//    UIBarButtonItem* resetButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(reset:)];
//    
//    self.navigationItem.leftBarButtonItem = resetButton;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 150;
    
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
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 1;
            break;
        case 5:
            return 1;
            break;
        case 6:
            return 1;
            break;
        default:
            break;
            
    }
 
return 0;

}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 22)];

        [headerView setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, tableView.bounds.size.width, 22)];

    [headerLabel setTextColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1]];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    
//    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
//    [addButton addTarget:self action:@selector(recipes:) forControlEvents:UIControlEventTouchUpInside];
//    addButton.frame=CGRectMake(280, 2.5, 28, 28);
//    [addButton setImage:[UIImage imageNamed:@"addButtonImage.png"] forState:UIControlStateNormal];
//
//    
//    addButton.backgroundColor = [UIColor whiteColor];
//    addButton.layer.cornerRadius = 15;
    [headerLabel setTextColor:[UIColor whiteColor]];

    
    if (section == 0)
        [headerLabel setText:@"   Monday"];
    else if (section == 1)
        [headerLabel setText:@"   Tuesday"];
    else if (section == 2)
        [headerLabel setText:@"   Wednesday"];
    else if (section == 3)
        [headerLabel setText:@"   Thursday"];
    else if (section == 4)
        [headerLabel setText:@"   Friday"];
    else if (section == 5)
        [headerLabel setText:@"   Saturday"];
    else if (section == 6)
        [headerLabel setText:@"   Sunday"];

    
    [headerView addSubview:headerLabel];
    //[headerView addSubview:addButton];
    
    return headerView;
    
}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    MenuPlanCell *MyCell = (MenuPlanCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    self.menuPlan.breakfast = MyCell.breakfast.text;

    
    return MyCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

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
        [self.menuPlanCell resetCell];
    }
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}





@end
