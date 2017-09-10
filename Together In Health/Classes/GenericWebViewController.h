//
//  GenericWebViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 9/23/15.
//  Copyright © 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface GenericWebViewController : AbstractViewController

@property (nonatomic) int webViewType;
@property (nonatomic) int webViewType2;
@property (nonatomic, strong) IBOutlet UIWebView *thisWebView;
@property (nonatomic, strong) IBOutlet UIImageView *thisImage;

@end
