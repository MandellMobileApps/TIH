//
//  GenericWebViewController2.h
//  Together In Health
//
//  Created by Cami Mandell on 11/2/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface GenericWebViewController2 : AbstractViewController

@property (nonatomic) int webViewType2;
@property (nonatomic, strong) IBOutlet UIWebView *thisWebView;
@property (nonatomic, strong) IBOutlet UIButton *doneButton;
-(IBAction)done:(id)sender;

@end
