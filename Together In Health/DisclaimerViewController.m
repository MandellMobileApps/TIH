//
//  DisclaimerViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 11/29/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "DisclaimerViewController.h"
#import "FullOpeningViewController.h"
#import "AbstractViewController.h"

@implementation DisclaimerViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];

NSString *path = [self pathForFilename:@"Disclaimer.html"];
NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
NSURL *baseURL = [NSURL fileURLWithPath:path];
[self.thisWebView loadHTMLString:webString baseURL:baseURL];
    
}

@end
