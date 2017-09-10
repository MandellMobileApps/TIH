//
//  SolutionsViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface SolutionsViewController : AbstractViewController

@property (strong, nonatomic) NSDictionary* object;
@property (nonatomic, strong) IBOutlet UIWebView *thisWebView;

@end
