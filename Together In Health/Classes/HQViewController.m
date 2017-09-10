//
//  HQViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "HQViewController.h"

@implementation HQViewController

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



- (void)configureView
{
    // Update the user interface for the detail item.
    
    NSString* filename = [self.object objectForKey:@"Answer"];
    //    NSLog(@"filename %@",filename);
    if (filename.length>0)
    {
        NSString *path = [self pathForFilename:filename];
        self.title = [self.object objectForKey:@"Question"];
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