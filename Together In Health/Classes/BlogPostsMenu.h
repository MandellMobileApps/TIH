//
//  BlogPostsMenu.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/2/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface BlogPostsMenu : AbstractViewController

@property (strong, nonatomic) NSArray *updatedRecords;
@property (strong, nonatomic) NSArray *updatedVersions;
@property (nonatomic) NSInteger currentVersion;
@property (nonatomic) NSInteger newVersion;
@property (nonatomic) BOOL updateEnabled;
@property (strong, nonatomic) NSOperationQueue* mgOperationsQueue;
@property (strong, nonatomic) NSMutableArray *filesToUpdate;
@property(nonatomic,strong) NSString* filename;
@property(nonatomic,strong) NSArray* objects0;
@property(nonatomic,strong) NSArray* objects1;
@property(nonatomic,strong) NSArray* objects2;
- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;

@property (nonatomic, strong) IBOutlet UITableView* thisTableView;
@property (nonatomic, strong) NSArray* testArray;

@property(nonatomic,strong) NSDictionary* object;

@property (nonatomic, strong) NSURLConnection *myConnection;

@property (nonatomic, strong) NSMutableData *buffer;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
