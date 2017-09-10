//
//  PlateBreakdownViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 12/6/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "PlateBreakdownViewController.h"
#import "AbstractViewController.h"

@implementation PlateBreakdownViewController

-(void)viewDidLoad {
    [super viewDidLoad];

            NSString *path = [self pathForFilename:@"CarbsProVeg.html"];
            NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            NSURL *baseURL = [NSURL fileURLWithPath:path];
            [self.thisWebView loadHTMLString:webString baseURL:baseURL];

}
@end
