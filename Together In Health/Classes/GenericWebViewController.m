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

    //self.navigationItem.backBarButtonItem.text = @{NSForegroundColorAttributeName : [UIColor whiteColor]};


switch (self.webViewType) {
        
    case groupExplanations:{
        NSString *path = [self pathForFilename:@"CarbsProVeg.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        }
        break;
    
    case plateExamples:{
        NSString *path = [self pathForFilename:@"PlateExamples.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
        }
        break;
    
    case foodLabels:{
        NSString *path = [self pathForFilename:@"ReadingAFoodLabel.html"];
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


@end
