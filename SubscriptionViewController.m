//
//  SubscriptionViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 1/29/18.
//  Copyright © 2018 MandellMobileApps. All rights reserved.
//

#import "SubscriptionViewController.h"
#import "AbstractViewController.h"

@interface SubscriptionViewController ()

@end

@implementation SubscriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 2390);
    self.keypadShowing = NO;
    self.emailShowing = NO;
    self.emailContainerView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  Show Email View methods
// array of rows in order of components
-(IBAction)showEmailView
{
    if (!self.emailShowing)
    {
        self.emailShowing = YES;
        
        CGRect hideRect = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 0);
        CGRect showRect= CGRectMake(0, 64, self.view.bounds.size.width, 240);
        self.emailContainerView.clipsToBounds = YES;
        self.emailContainerView.frame = hideRect;
        self.emailContainerView.backgroundColor = [UIColor lightGrayColor];
        self.emailContainerView.hidden = NO;
        
        [UIView animateWithDuration:0.3
                         animations:^
         {
             self.emailContainerView.frame = showRect;
             
         }
                         completion:^(BOOL finished)
         {
             
         }];
    }
}

-(IBAction)showEmailViewNow
{
    if (!self.emailShowing)
    {
        self.emailShowing = YES;
        
        CGRect showRect= CGRectMake(0, 64, self.view.bounds.size.width, 240);
        self.emailContainerView.clipsToBounds = YES;
        self.emailContainerView.frame = showRect;
        self.emailContainerView.backgroundColor = [UIColor lightGrayColor];
        self.emailContainerView.hidden = NO;
        
    }
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
