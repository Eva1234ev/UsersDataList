//
//  SQLiteDatabase.m
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "SQLiteDatabase.h"
\

@implementation SQLiteDatabase
- (instancetype) initDatabase
{
    self = [super init];
    if (self) {
        NSString *docsDir;
        NSArray *dirPaths;
        //NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        //Get the directory
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir = dirPaths[0];
        
        //Build the path to keep the database
        _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"myUsers.db"]];
        
        NSFileManager *filemgr = [NSFileManager defaultManager];
        
        if([filemgr fileExistsAtPath:_databasePath] == NO){
            const char *dbpath = [_databasePath UTF8String];
            
            if(sqlite3_open(dbpath, &_DB) == SQLITE_OK){
                char *errorMessage;
                const char *sql_statement = "CREATE TABLE IF NOT EXISTS users (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)";
                
                if(sqlite3_exec(_DB, sql_statement, NULL, NULL, &errorMessage) != SQLITE_OK){
                   // [self showUIAlertWithMessage:@"Failed to create the table" andTitle:@"Error"];
                }
                sqlite3_close(_DB);
            }
            else{
               //[self showUIAlertWithMessage:@"Failed to open/create the table" andTitle:@"Error"];
            }
        }
        
    }
    return self;
}

@end
