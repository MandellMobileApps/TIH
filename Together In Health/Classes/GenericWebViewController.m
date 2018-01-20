//
//  GenericWebViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 9/23/15.
//  Copyright © 2015 Cami Mandell. All rights reserved.
//

#import "GenericWebViewController.h"
#import "FullOpeningViewController.h"
#import "AbstractViewController.h"

@implementation GenericWebViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController.navigationBar setHidden:YES];
    self.navbarView.backgroundColor =  [UIColor colorWithRed:255/255.0 green:243/255.0 blue:177/255.0 alpha:1];
    self.navbarTitleLabel.font = [UIFont fontWithName:@"Arial" size:24.0];
    self.navbarTitleLabel.textColor = [UIColor blackColor];
    

switch (self.webViewType) {
        
    case groupExplanations:{
        NSString *path = [self pathForFilename:@"CarbsProVeg.html"];
        self.navbarTitleLabel.text = @"Plate Breakdown";
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        }
        break;
    
    case plateExamples:{
        NSString *path = [self pathForFilename:@"PlateExamples.html"];
        self.navbarTitleLabel.text = @"Plate Examples";
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        }
        break;
    
    case foodLabels:{
        NSString *path = [self pathForFilename:@"ReadingAFoodLabel.html"];
        self.navbarTitleLabel.text = @"Food Label";
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        }
        break;
        

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
