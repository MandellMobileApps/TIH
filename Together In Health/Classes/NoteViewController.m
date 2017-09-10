//
//  NoteViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/23/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "NoteViewController.h"
#import "RecipeDetailViewController.h"
#import "SQLiteAccess.h"


@implementation NoteViewController

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
    // Do any additional setup after loading the view.
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    NSString* sql2 = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE RecordId = \"%@\" ",RecordId];
    NSArray* temp = [SQLiteAccess selectManyRowsWithSQL:sql2];
    if (temp.count > 0)
    {
        self.object = [temp objectAtIndex:0];
    }
    
    self.noteText.text = [self.object objectForKey:@"Note"];
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

-(IBAction)saveButtonTapped:(id)sender
{
    [self.noteText resignFirstResponder];
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    
    NSString* sql2 = [NSString stringWithFormat:@"UPDATE Recipes Set Note = \"%@\" WHERE RecordId = \"%@\" ",self.noteText.text,RecordId];
    [SQLiteAccess updateWithSQL:sql2];
//    if (self.recipeDetailViewController)
//    {
        [self.recipeDetailViewController updateObject];
//    }
//    
//    else if (self.detailViewController)
//    {
//        NSString* sql2 = [NSString stringWithFormat:@"SELECT * FROM ProSports WHERE RecordId = \"%@\"",RecordId];
//        NSMutableArray* temp = [NSMutableArray arrayWithArray:[SQLiteAccess selectManyRowsWithSQL:sql2]];
//        if (temp.count>0)
//        {
//            self.object = [temp objectAtIndex:0];
//        }
//        [self.detailViewController updateDetailWithObject:self.object];
//    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeenThereDetailUpdated" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
