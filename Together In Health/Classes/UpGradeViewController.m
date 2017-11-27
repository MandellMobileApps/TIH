//
//  UpGradeViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 11/7/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "UpGradeViewController.h"
#import "AppDelegate.h"

@interface UpGradeViewController ()

@end

@implementation UpGradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doneButtonTapped:(UIButton*)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(IBAction)buttonTapped:(UIButton*)sender
{
    if ([self validEmail:self.emailTextField.text])
    {
    
        switch (sender.tag) {
            case 0:
                
                break;
            case 1:
                
                break;
            default:
                break;
        }
    }
    else
    {
        [self displayAlert:@"Invalid Email Format"];
        
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL) validEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(void)checkAuthToken
{
    
    
}

-(void)checkExistingContact
{
    
}

-(void)createContact
{
    
    
}

-(void)subscriptionComplete
{
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
