//
//  DirectionsViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 12/6/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "DirectionsViewController.h"
#import "AbstractViewController.h"

@implementation DirectionsViewController

-(void)viewDidLoad {
    [super viewDidLoad];

NSString *path = [self pathForFilename:@"Directions.html"];
NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
NSURL *baseURL = [NSURL fileURLWithPath:path];
[self.thisWebView loadHTMLString:webString baseURL:baseURL];
    
}

@end
