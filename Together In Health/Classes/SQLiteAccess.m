//
//  SQLiteAccess.m
//  ProtocolPedia
//
//  Created by Jon Mandell on 4/16/10.
//  Copyright MandellMobileApps. All rights reserved.
//

#import "SQLiteAccess.h"
#import <sqlite3.h>

@implementation SQLiteAccess



static int multipleRowCallback(void *queryValuesVP, int columnCount, char **values, char **columnNames) {
//    NSLog(@"values %s",values);

	NSMutableArray *queryValues = (__bridge NSMutableArray *)queryValuesVP;
	NSMutableDictionary *individualQueryValues = [NSMutableDictionary dictionary];
	int i;
	for(i=0; i<columnCount; i++) {
    
        [individualQueryValues setObject:values[i] ? [NSString stringWithUTF8String:values[i]] : [NSString string]
								  forKey:[NSString stringWithFormat:@"%s", columnNames[i]]];
	}
	[queryValues addObject:[NSDictionary dictionaryWithDictionary:individualQueryValues]];
    
	return 0;
}



+ (NSNumber *)executeSQL:(NSString *)sql withCallback:(void *)callbackFunction context:(id)contextObject {
// add @try here
    
    // database in server is called ProDatebaseTest
    // table in the server is called ProDatabaseAdFree
 
    // database in app is called ProSports
    // table in the app is called ProSports
    
    NSString *path = [self dataFilePathofDocuments:@"TIHDatabase.sqlite"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path])
    {
        sqlite3 *db = NULL;
        int rc = SQLITE_OK;
        long long lastRowId = 0;
        rc = sqlite3_open([path UTF8String], &db);

        // suggestion to prevent sqlite from caching your queries and slowly consuming all of your memory.	
        const char *pragmaSql = "PRAGMA cache_size = 50";
        if (sqlite3_exec(db, pragmaSql, NULL, NULL, NULL) != SQLITE_OK) {
            NSAssert1(0, @"Error: failed to execute pragma statement with message '%s'.", sqlite3_errmsg(db));
        }
        
        if(SQLITE_OK != rc) {
            NSLog(@"Can't open database: %s\n", sqlite3_errmsg(db));
            sqlite3_close(db);
            return nil;
        } else {
            char *zErrMsg = NULL;

            rc = sqlite3_exec(db, [sql UTF8String], callbackFunction, (__bridge void*)contextObject, &zErrMsg);
            if(SQLITE_OK != rc) {
                NSLog(@"Can't run query '%@' error message: %s\n", sql, sqlite3_errmsg(db));
                sqlite3_free(zErrMsg);
            }
            lastRowId = sqlite3_last_insert_rowid(db);
            sqlite3_close(db);

        }
        NSNumber *lastInsertRowId = nil;
        if(0 != lastRowId) {
            lastInsertRowId = [NSNumber numberWithLongLong:lastRowId];
        }
        return lastInsertRowId;
        }

    return [NSNumber numberWithInteger:-1];
  
}



+ (NSArray *)selectManyRowsWithSQL:(NSString *)sql {
    NSMutableArray *queryValues = [NSMutableArray array];
    [self executeSQL:sql withCallback:multipleRowCallback context:queryValues];
    return [NSArray arrayWithArray:queryValues];
}

+ (NSNumber *)insertWithSQL:(NSString *)sql {
    sql = [NSString stringWithFormat:@"BEGIN TRANSACTION; %@; COMMIT TRANSACTION;", sql];
    return [self executeSQL:sql withCallback:NULL context:NULL];
}

+ (void)updateWithSQL:(NSString *)sql {
    sql = [NSString stringWithFormat:@"BEGIN TRANSACTION; %@; COMMIT TRANSACTION;", sql];
    [self executeSQL:sql withCallback:NULL context:nil];
}

+ (void)deleteWithSQL:(NSString *)sql {
    sql = [NSString stringWithFormat:@"BEGIN TRANSACTION; %@; COMMIT TRANSACTION;", sql];
    [self executeSQL:sql withCallback:NULL context:nil];
}


//   ****************************************************************************
//   File methods
//   ****************************************************************************


+ (NSString *)dataFilePathofDocuments:(NSString *)nameoffile {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:nameoffile];
	return documentsPath ;
}

+ (NSString *)dataFilePathofBundle:(NSString *)nameoffile {
	NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameoffile];
	return bundlePath;
}



@end
