//
//  MenuMealViewController.m
//  Together In Health
//
//  Created by Jon Mandell on 12/26/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "MenuDayViewController.h"
#import "MenuMeal.h"
#import "MenuItem.h"
#import "MenuDay.h"
#import "AddMenuItemViewController.h"
#import "NewMenuItemViewController.h"
#import "AppDelegate.h"

@interface MenuDayViewController ()

@end

@implementation MenuDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navbarView.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    self.navbarTitleLabel.text = self.selectedMenuDayName;
    self.changeMade = NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.thisTableView reloadData];

    
}


-(IBAction)cancelButtonTapped
{
   if (self.changeMade)
   {
        [self verifyCancel];
   }
   else
   {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(IBAction)saveButtonTapped
{

}

-(void)addItem:(UIButton*)button
{
    self.changeMade = YES;

    
       AddMenuItemViewController* addMenuItemViewController = (AddMenuItemViewController*)
        [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
         instantiateViewControllerWithIdentifier:@"AddMenuItemViewController"];
         self.selectedMenuDay.selectedMealType = button.tag;
         addMenuItemViewController.selectedMenuDay = self.selectedMenuDay;
    
    if (button.tag == 0)
    {
        addMenuItemViewController.selectedItemsArray = [NSMutableArray arrayWithArray:self.selectedMenuDay.breakfastMenuItems];
        addMenuItemViewController.navbarTitleLabel.text = [NSString stringWithFormat:@"%@  %@",self.selectedMenuDayName,@"Breakfast"];
    }
    else if (button.tag == 1)
    {
        addMenuItemViewController.selectedItemsArray = [NSMutableArray arrayWithArray:self.selectedMenuDay.lunchMenuItems];
        addMenuItemViewController.navbarTitleLabel.text = [NSString stringWithFormat:@"%@  %@",self.selectedMenuDayName,@"Lunch"];
    }
    else if (button.tag == 2)
    {
        addMenuItemViewController.selectedItemsArray = [NSMutableArray arrayWithArray:self.selectedMenuDay.dinnerMenuItems];
        addMenuItemViewController.navbarTitleLabel.text = [NSString stringWithFormat:@"%@  %@",self.selectedMenuDayName,@"Dinner"];
    }
    else if (button.tag == 3)
    {
        addMenuItemViewController.selectedItemsArray = [NSMutableArray arrayWithArray:self.selectedMenuDay.snackMenuItems];
        addMenuItemViewController.navbarTitleLabel.text = [NSString stringWithFormat:@"%@  %@",self.selectedMenuDayName,@"Snacks"];
    }
    [self.navigationController pushViewController:addMenuItemViewController animated:YES];

}

-(void)editItem:(NSIndexPath*)indexPath
{
    self.changeMade = YES;


    
    MenuItem* thisMenuItem;
    if (indexPath.section == 0)
    {
        thisMenuItem = [self.selectedMenuDay.breakfastMenuItems objectAtIndex:indexPath.row];

    }
    else if (indexPath.section == 1)
    {
        thisMenuItem = [self.selectedMenuDay.breakfastMenuItems objectAtIndex:indexPath.row];

    }
    else if (indexPath.section == 2)
    {
        thisMenuItem = [self.selectedMenuDay.breakfastMenuItems objectAtIndex:indexPath.row];

    }
    else if (indexPath.section == 3)
    {
        thisMenuItem = [self.selectedMenuDay.breakfastMenuItems objectAtIndex:indexPath.row];

    }

    if (thisMenuItem.recipeId>0)
    {
    
    }
    else
    {
        NewMenuItemViewController* newMenuItemViewController = (NewMenuItemViewController*)
        [[UIStoryboard storyboardWithName:@"MenuPlan" bundle:nil]
         instantiateViewControllerWithIdentifier:@"NewMenuItemViewController"];
            newMenuItemViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            newMenuItemViewController.menuDayViewController = self;
        
        [self presentViewController:newMenuItemViewController animated:YES completion:^{
                [newMenuItemViewController thisMenuItem:thisMenuItem];
            }];
    }
}


-(void)removeSelectedItem:(UIButton*)button
{


}

-(void)updateMenuItemInAllArray:(MenuItem*)thisItem
{
    [self.appDelegate.menuItemsArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(MenuItem *menuItem, NSUInteger index, BOOL *stop) {
    if (menuItem.menuItemId == thisItem.menuItemId) {
        [self.appDelegate.menuItemsArray replaceObjectAtIndex:index withObject:thisItem];
        [self.thisTableView reloadData];
    }
    }];
    [self.appDelegate saveMenuPlans];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 4;
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
    switch (section) {
  case 0:
    return self.selectedMenuDay.breakfastMenuItems.count;
    break;
  case 1:
    return self.selectedMenuDay.lunchMenuItems.count;
    break;
  case 2:
    return self.selectedMenuDay.dinnerMenuItems.count;
    break;
  case 3:
    return self.selectedMenuDay.snackMenuItems.count;
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

    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.bounds.size.width-10, 22)];
    [headerLabel setBackgroundColor:[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    headerLabel.textColor = [UIColor whiteColor];
    
    if (section == 0)
        [headerLabel setText:@"Breakfast"];
    else if (section == 1)
        [headerLabel setText:@"Lunch"];
    else if (section == 2)
        [headerLabel setText:@"Dinner"];
    else if (section == 3)
        [headerLabel setText:@"Snacks"];
    
    [headerView addSubview:headerLabel];

    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeCustom];
    addButton.tag = section;
    [addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(self.view.bounds.size.width-60, 2.5, 28, 28);
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
    addButton.tag = section;
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.cornerRadius = 15;
    [headerView addSubview:addButton];

    return headerView;

}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    MenuItem* thisMenuItem;
    switch (indexPath.section) {
      case 0:
        thisMenuItem = [self.selectedMenuDay.breakfastMenuItems objectAtIndex:indexPath.row];
        break;
      case 1:
        thisMenuItem = [self.selectedMenuDay.lunchMenuItems objectAtIndex:indexPath.row];
        break;
      case 2:
        thisMenuItem = [self.selectedMenuDay.dinnerMenuItems objectAtIndex:indexPath.row];
        break;
      case 3:
        thisMenuItem = [self.selectedMenuDay.snackMenuItems objectAtIndex:indexPath.row];
        break;
      default:
        break;
        }

    
    myCell.textLabel.text = thisMenuItem.menuItemName;
    myCell.imageView.image = [UIImage imageNamed:thisMenuItem.menuItemImage];
    return myCell;
}

//@property (nonatomic, strong) NSString *menuItemName;
//@property (nonatomic, strong) NSString *menuItemImage;


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self editItem:indexPath];
    
   
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        switch (indexPath.section) {
          case 0:
            [self.selectedMenuDay.breakfastMenuItems removeObjectAtIndex:indexPath.row];
            break;
          case 1:
            [self.selectedMenuDay.lunchMenuItems removeObjectAtIndex:indexPath.row];
            break;
          case 2:
            [self.selectedMenuDay.dinnerMenuItems removeObjectAtIndex:indexPath.row];
            break;
          case 3:
            [self.selectedMenuDay.snackMenuItems removeObjectAtIndex:indexPath.row];
            break;
          default:
            break;
            }
        [tableView reloadData]; // tell table to refresh now
    }
}

-(void)verifyCancel {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You've made changes, are you sure you want to cancel?" message:@"" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
    alert.tag = 2000;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex

{
    if (alertView.tag == 2000)
    {
        if (buttonIndex == 1)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
@end
