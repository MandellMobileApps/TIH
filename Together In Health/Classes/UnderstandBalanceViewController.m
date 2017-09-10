//
//  UnderstandBalanceViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 9/15/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "UnderstandBalanceViewController.h"
#import "AbstractViewController.h"

@implementation UnderstandBalanceViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *path = [self pathForFilename:@"UnderstandingBalance.html"];
    NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [self.thisWebView loadHTMLString:webString baseURL:baseURL];


}



@end
