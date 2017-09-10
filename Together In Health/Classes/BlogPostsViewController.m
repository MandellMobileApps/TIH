//
//  BlogPostsViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "BlogPostsViewController.h"
#import "MgNetworkOperation2.h"

@implementation BlogPostsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Blog Posts";
//    self.object = [NSDictionary dictionary];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateObject) name:@"DetailViewUpdateBeenThere" object:nil];
}
//
//
- (void)configureView
{
    // Update the user interface for the detail item.
    
    NSString* filename = [self.object objectForKey:@"HTML"];
        NSLog(@"filename %@",filename);
    if (filename.length>0)
    {
        NSString *path = [self pathForFilename:filename];
        self.title = [self.object objectForKey:@"Title"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
//        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
    
    
    else
    {
        self.title = @"Weekly Blog Post";
        NSString *path = [self pathForFilename:@"NoDetail.html"];
        NSString *webString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [self.thisWebView loadHTMLString:webString baseURL:baseURL];
    }
}
//
//-(void) getFiles
//{
//    
//    NSString* urlString = @"http://mandellmobileapps.com/TIHFilesToUpdate.php";
//    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    MgNetworkOperation2 *mgOperation = [[MgNetworkOperation2 alloc] initWithUrl:url responseBlock:^(MgNetworkOperation2* completedOperation)
//        {
//            if (completedOperation.operationErrorMessage.length == 0)
//        {
//                                                
//            if ([completedOperation.json isKindOfClass:[NSArray class]])
//                    {
//                        NSArray* temp = completedOperation.json;
//                        //                NSLog(@"getFiles %@",temp);
//                        self.filesToUpdate = [NSMutableArray array];
//                                if (temp.count > 0)
//                                        {
//                                            for (NSDictionary* item in temp)
//                                        {
//                                            [self.filesToUpdate addObject:[item objectForKey:@"FilesToUpdate"]];
//                                        }
//                                    }
//                                [self updateFiles];
//                                                    
//                            }
//                    }
//        }];
//    
//    [self.mgOperationsQueue addOperation:mgOperation];
//    
//    
//}
//
//
//-(void)updateFiles
//{
//    
//    BOOL success = [self checkForUpdatedFilesFolder];
//    
//    if (success)
//    {
//        
//        for (NSString* filename in self.filesToUpdate)
//        {
//            
//            if ([self string:filename containsString:@".html"])
//            {
//                
//                NSString* urlString = [NSString stringWithFormat:@"http://mandellmobileapps.com/TIHBlogPostsHTMLs/%@",filename];
//                NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//                
//                NSError* error;
//                NSString* htmlString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
//                if (error)
//                {
//                    //                     NSLog(@"Error: %@",[error localizedDescription]);
//                }
//                
//                if(htmlString.length>0)
//                {
//                    [self writeString:htmlString toFile:filename];
//                }
//            }
//            else if ([self string:filename containsString:@".png"])
//            {
//                
//                
//                
//            }
//        }
//    }
//
//    [self.activityIndicator stopAnimating];
//    //    NSLog(@"date complete %@",[NSDate date]);
//    [self delayedLoad];
//    
//}
//
//-(BOOL) checkForUpdatedFilesFolder
//{
//    NSString *dataPath = [self dataFilePathofDocuments:@"/UpdatedFiles"];
//    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
//    {
//        NSError* error;
//        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error];
//        if (error)
//        {
//            NSLog(@"Error creating updated files folder");
//            return NO;
//        }
//    }
//    return YES;
//    
//}
//
//-(void) writeString:(NSString*)string toFile:(NSString*)filename
//{
//    
//    NSString* stringPath = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",filename]];
//    
//    NSError* error;
//    BOOL successSave = [string writeToFile:stringPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
//    if (!successSave)
//    {
//        NSLog(@"Error: %@   saving file: %@",[error localizedDescription],filename);
//    }
//}
//
//
//-(void) cancelAllOperations {
//    [self.mgOperationsQueue cancelAllOperations];
//}
//
//
//


-(NSString*)pathForFilename:(NSString*)filename
{
    NSString* path1 = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",filename]];
    NSString* path2 = [self dataFilePathofBundle:filename];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path1])
    {
        return path1;
    }
    else if ([fileManager fileExistsAtPath:path2])
    {
        return path2;
    }
    
    return @"";
    
}
- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:nameoffile];
    return documentsPath ;
}

- (NSString *)dataFilePathofBundle:(NSString *)nameoffile {
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameoffile];
    return bundlePath;
}

@end
