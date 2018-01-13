//
//  AddMenuItemViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "NewMenuItemViewController.h"
#import "AddMenuItemViewController.h"
#import "MenuDayViewController.h"
#import "AppDelegate.h"
#import "MenuItem.h"


@implementation NewMenuItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = nil;

    // set custom navbar
    
    self.navbarView.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    self.newMenuItem = YES;
    
    

}

-(void)thisMenuItem:(MenuItem*)menuItem
{
    if (menuItem)
    {
        self.menuItem = menuItem;
        self.navbarTitleLabel.text = menuItem.menuItemName;
        self.nameTextField.text = menuItem.menuItemName;
        self.descriptionTextView.text = menuItem.menuItemDescription;
        self.newMenuItem = NO;
    }
    else
    {
        self.menuItem = [MenuItem newMenuItemWithName:@""];
        self.navbarTitleLabel.text = @"New Menu Item";
        
    }

}


#pragma mark - Button Controls

-(IBAction)navbarButtonTapped:(UIButton*)sender
{
    switch (sender.tag) {
  case 1:{
    [self updateMenuItem];
    if (self.newMenuItem)
    {
        [self.addMenuItemViewController addMenuItemToAllArray:self.menuItem];
    }
    else
    {
        if (self.addMenuItemViewController)
        {
            [self.addMenuItemViewController updateMenuItemInAllArray:self.menuItem];
        }
        else if (self.menuDayViewController)
        {
             [self.menuDayViewController updateMenuItemInAllArray:self.menuItem];
        }
    }
    

    [self dismissViewControllerAnimated:YES completion:^{}];
    break;}
  case 2:
    if (self.changeMade)
    {
        [self verifyCancel];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
   
    break;
  default:
    break;
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
            [self dismissViewControllerAnimated:YES completion:^{}];
        }
    }
}

-(void)updateMenuItem
{
    [self.nameTextField resignFirstResponder];
    [self.descriptionTextView resignFirstResponder];
    
    
    self.menuItem.menuItemName = self.nameTextField.text;
    self.menuItem.menuItemDescription = self.descriptionTextView.text;


}
@end
