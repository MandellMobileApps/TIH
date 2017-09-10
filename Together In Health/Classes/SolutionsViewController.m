//
//  SolutionsViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "SolutionsViewController.h"
#import "NoteViewController.h"

@implementation SolutionsViewController

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
    [self configureView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:34/255.0 green:80/255.0 blue:139/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // Do any additional setup after loading the view.
    
    //    UIBarButtonItem* editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(addBeenThere:)];
    //    self.navigationItem.rightBarButtonItem = editButton;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(IBAction)updateFavorites:(id)sender
//{
//    NSString* beenThere = [self.object objectForKey:@"Favorite"];
//    NSString* RecordId = [self.object objectForKey:@"RecordId"];
//    if ([beenThere isEqualToString:@"Yes"])
//    {
//        NSString* sql = [NSString stringWithFormat:@"UPDATE Recipes Set Favorite = \"No\" WHERE RecordId = \"%@\" ",RecordId];
//        [SQLiteAccess updateWithSQL:sql];
//        
//    }
//    else
//    {
//        NSString* sql = [NSString stringWithFormat:@"UPDATE Recipes Set Favorite = \"Yes\" WHERE RecordId = \"%@\" ",RecordId];
//        [SQLiteAccess updateWithSQL:sql];
//        
//    }
//    
//    [self updateObject];
//    [self saveRecipe];
//    
//}

//-(void)saveRecipe {
//    
//    if (self.favoritesButtonOn) {
//        [self.favoritesButton setTitle:@"Remove" forState:UIControlStateNormal];
//        //  self.imageView.hidden = NO;
//        self.favoritesButtonOn = NO;
//        
//    }
//    
//    else  {
//        [self.favoritesButton setTitle:@"Save" forState:UIControlStateNormal];
//        // self.imageView.hidden = YES;
//        self.favoritesButtonOn = NO;
//        
//    }
//    // [self.recipeViewController.thisTableView reloadData];
//    
//}

//-(void)updateObject
//{
//    NSString* RecordId = [self.object objectForKey:@"RecordId"];
//    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM Problems WHERE RecordId = \"%@\"",RecordId];
//    NSArray* new = [SQLiteAccess selectManyRowsWithSQL:sql];
//    
//    NSLog (@"before object %@",self.object);
//    
//    if (new.count>0)
//    {
//        self.object = [new objectAtIndex:0];
//    }
//    
//    NSLog (@"after object %@",self.object);
//    
//    [self updateFavoritesButton];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeenThereDetailUpdated" object:nil];
//    
//}

-(void)updateDetailWithObject:(NSDictionary*)newObject
{
    if (newObject)
    {
        if (self.object != newObject)
        {
            self.object = newObject;
            [self configureView];
        }
    }
    else
    {
        self.title = @"Solution";
        NSString *path = [self pathForFilename:@"NoDetail.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
    }
    //[self updateFavoritesButton];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    NSString* filename = [self.object objectForKey:@"Solution"];
    //    NSLog(@"filename %@",filename);
    if (filename.length>0)
    {
        NSString *path = [self pathForFilename:filename];
        self.title = [self.object objectForKey:@"Problem"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        
        
    }
    else
    {
        self.title = @"Solution";
        NSString *path = [self pathForFilename:@"NoDetail.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
    }
   // [self updateFavoritesButton];
}



-(NSString*)pathForFilename:(NSString*)filename
{
    NSString* path1 = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",filename]];
    NSString* path2 = [self dataFilePathofBundle:filename];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path1])
    {
        return path1;
    }
    else if ([fileManager fileExistsAtPath:path2])
    {
        return path2;
    }
    
    return @"";
    
}


@end

