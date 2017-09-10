//
//  HQViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface HQViewController : AbstractViewController

@property (nonatomic, strong) IBOutlet UIWebView *thisWebView;

@property (strong, nonatomic) NSDictionary* object;
//-(void)updateObject;
- (void)configureView;
//-(void)updateDetailWithObject:(NSDictionary*)newObject;

@end
