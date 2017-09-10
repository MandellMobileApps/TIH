//
//  BlogPostsViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface BlogPostsViewController : AbstractViewController

@property (nonatomic, strong) IBOutlet UIWebView* thisWebView;
@property(nonatomic,strong) NSDictionary* object;
@property (nonatomic, strong) NSURLConnection *myConnection;

@end
