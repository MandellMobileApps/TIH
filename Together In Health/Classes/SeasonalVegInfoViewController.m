//
//  SeasonalVegInfoViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 7/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "SeasonalVegInfoViewController.h"
#import "AbstractViewController.h"
#import "SeasonalVegGameViewController.h"
#import "SQLiteAccess.h"

@implementation SeasonalVegInfoViewController

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
    // Do any additional setup after loading the view.
    
    //    UIBarButtonItem* editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(addBeenThere:)];
    //    self.navigationItem.rightBarButtonItem = editButton;
    
}
//



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateObject
{
    NSString* RecordId = [self.object objectForKey:@"RecordId"];
    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM SeasonalVeg WHERE RecordId = \"%@\"",RecordId];
    NSArray* new = [SQLiteAccess selectManyRowsWithSQL:sql];
    
    NSLog (@"before object %@",self.object);
    
    if (new.count>0)
    {
        self.object = [new objectAtIndex:0];
    }
    
    NSLog (@"after object %@",self.object);

    
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    NSString* filename = [self.object objectForKey:@"SeasonalVegInfo"];
    //    NSLog(@"filename %@",filename);
    if (filename.length>0)
    {
        NSString *path = [self pathForFilename:filename];
        self.title = [self.object objectForKey:@"Vegetable"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        
        
    }
    else
    {
        self.title = @"No Detail";
        NSString *path = [self pathForFilename:@"NoDetail.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
    }
}

@end