//
//  RecipeDetailViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/11/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "NoteViewController.h"
#import "SQLiteAccess.h"
#import "AbstractViewController.h"

@implementation RecipeDetailViewController

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
    self.navigationItem.backBarButtonItem = nil;

    // set custom navbar

    self.navbarView.backgroundColor =[UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.backgroundColor = [UIColor colorWithRed:68/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    
    //  only show on paid  TODO
    self.notesButton.hidden = YES;
    self.favoritesButton.hidden = YES;

    [super viewDidLoad];
    [self configureView];
    // Do any additional setup after loading the view.
    
}
//
-(IBAction)navbarButtonTapped:(UIButton*)sender
{
    switch (sender.tag) {
  case 1:

    [self.navigationController popViewControllerAnimated:YES];
    break;
  case 2:

    break;
  default:
    break;
    }
}
-(void)updateFavorite {

        //self.thisWebView.frame = CGRectMake(0, 102, 704, 602);
        if ([[self.object objectForKey:@"Favorite"] isEqualToString:@"Yes"])
        {
            [self.favoritesButton setTitle:@"Remove from Favorites" forState:UIControlStateNormal];
            
            //            UIBarButtonItem* editBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Been There / Remove" style:UIBarButtonItemStyleBordered target:self action:@selector(updateBeenThere:)];
            //            self.navigationItem.rightBarButtonItem = editBarButton;
            UIImageView* thisView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Star.png"]];
            thisView.frame = CGRectMake(0, 0, 25, 25);
            
            UIBarButtonItem* beenThereImage = [[UIBarButtonItem alloc] initWithCustomView:thisView];
            self.navigationItem.rightBarButtonItem = beenThereImage;
        }
        else
        {
            //self.thisWebView.frame = CGRectMake(0, 0, 704, 704);
            [self.favoritesButton setTitle:@"Add to Favorites" forState:UIControlStateNormal];
            //            UIBarButtonItem* editBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Been There / Add" style:UIBarButtonItemStyleBordered target:self action:@selector(updateBeenThere:)];
            //           self.navigationItem.rightBarButtonItem = editBarButton;
            self.navigationItem.rightBarButtonItem = nil;
        }
        if ([[self.object objectForKey:@"Note"] length]>0)
        {
            //self.NoteImageView.hidden = NO;
            [self.notesButton setTitle:@"See Note" forState:UIControlStateNormal];
             NSLog (@"Note Present %@",self.notesButton);
        }
        else
        {
           // self.NoteImageView.hidden = YES;
            [self.notesButton setTitle:@"Add Note" forState:UIControlStateNormal];
            NSLog (@"No Note %@",self.notesButton);
        }
    }




-(IBAction)updateNote:(id)sender
{
    NoteViewController *noteViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"NoteViewController"];
    noteViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    noteViewController.object = self.object;
    noteViewController.recipeDetailViewController = self;
    [self presentViewController:noteViewController animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) updateFavoritesButton:(id)sender
{
    NSString* favorite = [self.object objectForKey:@"Favorite"];
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    if ([favorite isEqualToString:@"Yes"])
    {
        NSString* sql = [NSString stringWithFormat:@"UPDATE Recipes Set Favorite = \"No\" WHERE RecordId = \"%@\" ",RecordId];
        [SQLiteAccess updateWithSQL:sql];
        
    }
    else
    {
        NSString* sql = [NSString stringWithFormat:@"UPDATE Recipes Set Favorite = \"Yes\" WHERE RecordId = \"%@\" ",RecordId];
        [SQLiteAccess updateWithSQL:sql];
        
    }
    
    [self updateObject];
    
    
    
}

-(void)updateObject
{
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM Recipes WHERE RecordId = \"%@\"",RecordId];
    NSArray* new = [SQLiteAccess selectManyRowsWithSQL:sql];
    
    NSLog (@"before object %@",self.object);
    
    if (new.count>0)
    {
        self.object = [new objectAtIndex:0];
    }
    
    NSLog (@"after object %@",self.object);
    
    [self updateFavorite];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FavoriteUpdated" object:nil];
    
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    NSString* filename = [self.object objectForKey:@"RecipeDetail"];
    //    NSLog(@"filename %@",filename);
    if (filename.length>0)
    {
        NSString *path = [self pathForFilename:filename];
        self.navbarTitleLabel.text = [self.object objectForKey:@"Recipe"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        
        
    }
    else
    {
        self.navbarTitleLabel.text = @"No Detail";
        NSString *path = [self pathForFilename:@"NoDetail.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
    }
    [self updateFavorite];
}

@end
