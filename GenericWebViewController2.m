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
    
    [self.navigationController.navigationBar setHidden:YES];
    self.navbarView.backgroundColor =  [UIColor colorWithRed:255/255.0 green:243/255.0 blue:177/255.0 alpha:1];
    self.navbarTitleLabel.font = [UIFont fontWithName:@"Arial" size:24.0];
    self.navbarTitleLabel.textColor = [UIColor blackColor];
    self.navbarTitleLabel.text = @"";


switch (self.webViewType2) {
        
    case aboutTIH:{
        NSString *path = [self pathForFilename:@"AboutTIH.html"];
        self.navbarTitleLabel.text = @"About TIH";
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
    }
        break;
        
    case balance:{
        NSString *path = [self pathForFilename:@"UnderstandingBalance.html"];
        self.navbarTitleLabel.text = @"Balance";
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        
    }
        break;
    case fAQs:{
        NSString *path = [self pathForFilename:@"FAQs.html"];
        self.navbarTitleLabel.text = @"FAQs";
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];

    }
        break;
        
    case directions:{
        NSString *path = [self pathForFilename:@"Directions.html"];
        self.navbarTitleLabel.text = @"Directions";
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        
    }
        break;
        
    case disclaimer:{
        NSString *path = [self pathForFilename:@"Disclaimer.html"];
        self.navbarTitleLabel.text = @"Disclaimer";
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
-(IBAction)navbarButtonTapped:(UIButton*)sender
{
    switch (sender.tag) {
  case 0:
    
    break;
  case 1:
    [self.navigationController popViewControllerAnimated:YES];
    break;
  default:
    break;
}

}
@end
