//
//  ViewControllerGamePlan.m
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "ViewControllerGamePlan.h"

@implementation ViewControllerGamePlan

-(void)viewDidLoad {
    
    [super viewDidLoad];

    self.thisScrollView.contentSize = CGSizeMake(320, 850);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.textViewVacation.text = [defaults objectForKey:@"MyVacation"];
    self.textViewHolidays.text = [defaults objectForKey:@"MyHoliday"];
    self.textViewSick.text = [defaults objectForKey:@"MySick"];
    self.textViewOther1.text = [defaults objectForKey:@"MyOther1"];
    self.textViewOther2.text = [defaults objectForKey:@"MyOther2"];
    self.textFieldOther1Text.text = [defaults objectForKey:@"MyOther1Text"];
    self.textFieldOther2Text.text = [defaults objectForKey:@"MyOther2Text"];
    
}

-(void)createGoals {
    
    
    Goal* goal = [[Goal alloc] init];
    
    goal.holidays = self.textViewHolidays.text;
    

    [self.goals addObject:goal];
}

-(void)viewWillDisappear:(BOOL)animated {

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:self.textViewVacation.text forKeyPath:@"MyVacation"];
    [defaults setValue:self.textViewHolidays.text forKeyPath:@"MyHoliday"];
    [defaults setValue:self.textViewSick.text forKeyPath:@"MySick"];
    [defaults setValue:self.textViewOther1.text forKeyPath:@"MyOther1"];
    [defaults setValue:self.textViewOther2.text forKeyPath:@"MyOther2"];
    [defaults setValue:self.textFieldOther1Text.text forKeyPath:@"MyOther1Text"];
    [defaults setValue:self.textFieldOther2Text.text forKeyPath:@"MyOther2Text"];
    
}

-(IBAction)resignKeyboard:(id)sender {
    [self.textViewHolidays resignFirstResponder];
    [self.textViewVacation resignFirstResponder];
    [self.textViewSick resignFirstResponder];
    [self.textViewOther1 resignFirstResponder];
    [self.textViewOther2 resignFirstResponder];
    [self.textFieldOther1Text resignFirstResponder];
    [self.textFieldOther2Text resignFirstResponder];
}

- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:nameoffile];
    return documentsPath ;
}

- (NSString *)dataFilePathofBundle:(NSString *)nameoffile {
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameoffile];
    return bundlePath;
}


@end
