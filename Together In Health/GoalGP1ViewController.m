//
//  GoalGP1ViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 10/13/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "GoalGP1ViewController.h"
#import "GoalGamePlanViewController.h"
#import "SQLiteAccess.h"

@interface GoalGP1ViewController ()

@end

@implementation GoalGP1ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.thisScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 650);
    [self.thisScrollView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    // Do any additional setup after loading the view.
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    NSString* sql2 = [NSString stringWithFormat:@"SELECT * FROM Goal1 WHERE RecordId = \"%@\" ",RecordId];
    NSArray* temp = [SQLiteAccess selectManyRowsWithSQL:sql2];
    if (temp.count > 0)
    {
        self.object = [temp objectAtIndex:0];
    }
    
    self.holidaysTextView.text = [self.object objectForKey:@"Holidays"];
    self.vacationTextView.text = [self.object objectForKey:@"Vacations"];
    self.sickDaysTextView.text = [self.object objectForKey:@"SickDays"];
    self.other1InfoTextView.text = [self.object objectForKey:@"Other1Info"];
    self.other2InfoTextView.text = [self.object objectForKey:@"Other2Info"];
    self.other1TextView.text = [self.object objectForKey:@"Other1"];
    self.other2TextView.text = [self.object objectForKey:@"Other2"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismissButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [self.holidaysTextView resignFirstResponder];
    [self.vacationTextView resignFirstResponder];
    [self.sickDaysTextView resignFirstResponder];
    [self.other1TextView resignFirstResponder];
    [self.other2TextView resignFirstResponder];
    [self.other1InfoTextView resignFirstResponder];
    [self.other2InfoTextView resignFirstResponder];
    
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    
    NSString* sql2 = [NSString stringWithFormat:@"UPDATE Goal1 Set Holidays = \"%@\" WHERE RecordId = \"%@\" ",self.holidaysTextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql2];
    
    NSString* sql3 = [NSString stringWithFormat:@"UPDATE Goal1 Set Vacations = \"%@\" WHERE RecordId = \"%@\" ",self.vacationTextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql3];
    
    NSString* sql4 = [NSString stringWithFormat:@"UPDATE Goal1 Set SickDays = \"%@\" WHERE RecordId = \"%@\" ",self.sickDaysTextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql4];
    
    NSString* sql5 = [NSString stringWithFormat:@"UPDATE Goal1 Set Other1 = \"%@\" WHERE RecordId = \"%@\" ",self.other1TextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql5];
    
    
//    if (self.phoneDetailViewController)
//    {
//        [self.phoneDetailViewController updateObject];
//    }
//    
//    else if (self.detailViewController)
//    {
//        NSString* sql2 = [NSString stringWithFormat:@"SELECT * FROM Goal1 WHERE RecordId = \"%@\"",RecordId];
//        NSMutableArray* temp = [NSMutableArray arrayWithArray:[SQLiteAccess selectManyRowsWithSQL:sql2]];
//        if (temp.count>0)
//        {
//            self.object = [temp objectAtIndex:0];
//        }
//        [self.detailViewController updateDetailWithObject:self.object];
//    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeenThereDetailUpdated" object:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [self.holidaysTextView resignFirstResponder];
    [self.vacationTextView resignFirstResponder];
    [self.sickDaysTextView resignFirstResponder];
    [self.other1TextView resignFirstResponder];
    [self.other2TextView resignFirstResponder];
    [self.other1InfoTextView resignFirstResponder];
    [self.other2InfoTextView resignFirstResponder];
    
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    
    NSString* sql2 = [NSString stringWithFormat:@"UPDATE Goal1 Set Holidays = \"%@\" WHERE RecordId = \"%@\" ",self.holidaysTextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql2];
    
    NSString* sql3 = [NSString stringWithFormat:@"UPDATE Goal1 Set Vacations = \"%@\" WHERE RecordId = \"%@\" ",self.vacationTextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql3];
    
    NSString* sql4 = [NSString stringWithFormat:@"UPDATE Goal1 Set SickDays = \"%@\" WHERE RecordId = \"%@\" ",self.sickDaysTextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql4];
    
    NSString* sql5 = [NSString stringWithFormat:@"UPDATE Goal1 Set Other1 = \"%@\" WHERE RecordId = \"%@\" ",self.other1TextView.text,RecordId];
    [SQLiteAccess updateWithSQL:sql5];
    
    
    //    if (self.phoneDetailViewController)
    //    {
    //        [self.phoneDetailViewController updateObject];
    //    }
    //
    //    else if (self.detailViewController)
    //    {
    //        NSString* sql2 = [NSString stringWithFormat:@"SELECT * FROM Goal1 WHERE RecordId = \"%@\"",RecordId];
    //        NSMutableArray* temp = [NSMutableArray arrayWithArray:[SQLiteAccess selectManyRowsWithSQL:sql2]];
    //        if (temp.count>0)
    //        {
    //            self.object = [temp objectAtIndex:0];
    //        }
    //        [self.detailViewController updateDetailWithObject:self.object];
    //    }
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeenThereDetailUpdated" object:nil];
    //    [self dismissViewControllerAnimated:YES completion:nil];
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
