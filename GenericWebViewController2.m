//
//  GenericWebViewController2.m
//  Together In Health
//
//  Created by Cami Mandell on 11/2/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "GenericWebViewController2.h"
#import "AbstractViewController.h"
#import "FullOpeningViewController.h"

@implementation GenericWebViewController2

-(void)viewDidLoad {
    [super viewDidLoad];
    self.doneButton.hidden = YES;


switch (self.webViewType2) {
        
    case aboutTIH:{
        NSString *path = [self pathForFilename:@"AboutTIH.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
    }
        
    case fAQs:{
        NSString *path = [self pathForFilename:@"FAQs.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];

    }
        break;
        
    case directions:{
        NSString *path = [self pathForFilename:@"Directions.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        
    }
        break;
        
    case disclaimer:{
        NSString *path = [self pathForFilename:@"Disclaimer.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        }
        self.doneButton.hidden = NO;
        break;
        
    default:
        break;
}
}

@end
