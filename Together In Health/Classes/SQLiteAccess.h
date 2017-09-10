//
//  SQLiteAccess.h
//  ProtocolPedia
//
//  Created by Jon Mandell on 4/16/10.
//  Copyright MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQLiteAccess : NSObject <UIApplicationDelegate, NSURLConnectionDelegate> {
}

+ (NSArray *)selectManyRowsWithSQL:(NSString *)sql;
+ (NSNumber *)insertWithSQL:(NSString *)sql;
+ (void)updateWithSQL:(NSString *)sql;
+ (void)deleteWithSQL:(NSString *)sql;

@end
