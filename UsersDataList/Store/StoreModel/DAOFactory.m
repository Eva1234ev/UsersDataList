//
//  DAOFactory.m
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "DAOFactory.h"
#import "UserDAO.h"
#import <FMDatabase.h>

// File name of the SQLite database
static NSString * const kDBFileName = @"app.db";

@interface DAOFactory ()
//Path of the SQLite database file.
@property (nonatomic) NSString *dbFilePath;

@end

@implementation DAOFactory

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dbFilePath = [self databaseFilePath];
        
        // For debug
        NSLog(@"%@", self.dbFilePath);
    }
    
    return  self;
}
- (instancetype)initWithDBFilePath:(NSString *)path {
    self = [super init];
    if (self) {
        self.dbFilePath = path;
        
        // For debug
        NSLog(@"%@", self.dbFilePath);
    }
    
    return self;
}

//Create the data access object of the users.
- (UserDAO *)userDAO {
    return [[UserDAO alloc] init:[self connection]];
}

#pragma mark - Private

// Get the database connection
- (FMDatabase *)connection {
    FMDatabase* db = [FMDatabase databaseWithPath:self.dbFilePath];
    return ([db open] ? db : nil);
}

//Get the path of database file
- (NSString *)databaseFilePath {
    NSArray*  paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString* dir   = [paths objectAtIndex:0];
    
    return [dir stringByAppendingPathComponent:kDBFileName];
}

@end
