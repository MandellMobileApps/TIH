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

@interface MenuDayViewController ()

@end

@implementation MenuDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    self.navbarView.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
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
         addMenuItemViewController.selectedMenuDay = self.selectedMenuDay;
        [self.navigationController pushViewController:addMenuItemViewController animated:YES];
    

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

    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
    [addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame=CGRectMake(self.view.bounds.size.width-50, 2.5, 28, 28);
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.cornerRadius = 14;
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

    // go to recipe if id
}



-(IBAction)recipes:(id)sender {
//        RecipeViewController* recipeViewController = (RecipeViewController*)
//        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//        instantiateViewControllerWithIdentifier:@"RecipeViewController"];
//        [self.navigationController pushViewController:recipeViewController animated:YES];
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
