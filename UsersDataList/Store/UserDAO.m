//
//  UserDAO.m
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "UserDAO.h"
#import "User.h"
#import <FMDatabase.h>
#import <FMResultSet.h>



// Query for the create table page
static NSString * const kSQLCreatePage = @""
"CREATE TABLE IF NOT EXISTS users ("
"page INTEGER PRIMARY KEY AUTOINCREMENT, "
"per_page INTEGER PRIMARY KEY AUTOINCREMENT, "
"totale INTEGER PRIMARY KEY AUTOINCREMENT, "
"total_pages INTEGER PRIMARY KEY AUTOINCREMENT, "
");";

// Query for the create table
static NSString * const kSQLCreate = @""
"CREATE TABLE IF NOT EXISTS users ("
"id INTEGER PRIMARY KEY AUTOINCREMENT, "
"email TEXT, "
"first_name TEXT, "
"last_name TEXT, "
"avatar TEXT"
");";

// Query for the select rows.
static NSString * const kSQLSelect = @""
"SELECT "
"id, email, first_name, last_name, avatar "
"FROM "
"users;"
"ORDER BY "
"author, title;";

//Query for the inssert row.
static NSString * const kSQLInsert = @""
"INSERT INTO "
"users (email, first_name, last_name, avatar) "
"VALUES "
"(?, ?, ?, ?);";

//Query for the update row.
static NSString * const kSQLUpdate = @""
"UPDATE "
"users "
"SET "
"email = ?, first_name = ?, last_name = ?, avatar = ? "
"WHERE "
"id = ?;";

//Query for the delete row.
static NSString * const kSQLDelete = @""
"DELETE FROM users WHERE id = ?;";

@interface UserDAO ()
//Instance of the database connection.
@property (nonatomic) FMDatabase *db;

@end


@implementation UserDAO

- (instancetype)init:(FMDatabase *)db {
    if (!(db)) { return nil; }
    
    self = [super init];
    if (db) {
        self.db = db;
    }
    
    return self;
}

// Deallocates the memory occupied by the receiver.
- (void)dealloc {
    [self.db close];
}

// Create the table.
- (BOOL)create {
    return [self.db executeUpdate:kSQLCreate];
}
// Create the table paging.
- (BOOL)createPage {
    return [self.db executeUpdate:kSQLCreatePage];
}
// Add user
- (User *)add:(NSString *)email first:(NSString *)first_name last:(NSString *)last_name avatar:(NSString *)avatar {
    User *user = nil;
    if ([self.db executeUpdate:kSQLInsert, email, first_name, last_name, avatar]) {
        NSInteger id = [self.db lastInsertRowId];
        user = [User userWithId:id email:email first:first_name last:last_name avatar: avatar];
    }
    
    return user;
}

// Read users
- (NSArray *)read {
    NSMutableArray * users= [NSMutableArray arrayWithCapacity:0];
    FMResultSet *results = [self.db executeQuery:kSQLSelect];
    
    while ([results next]) {
        [users addObject:[User userWithId:[results intForColumnIndex:0]
                                    email:[results stringForColumnIndex:1]
                                    first:[results stringForColumnIndex:2]
                                    last:[results dateForColumnIndex:3]
                                    avatar:[results dateForColumnIndex:4]]];
    }
    
    return users   ;
}

// Remove a user
- (BOOL)remove:(NSInteger)userid {
    return [self.db executeUpdate:kSQLDelete, [NSNumber numberWithInteger:userid]];
}

//Update a user.
- (BOOL)update:(User *)user {
    return [self.db executeUpdate:kSQLUpdate,
            user.email,
            user.first_name,
            user.last_name,
            user.avatar,
            [NSNumber numberWithInteger:user.id]];
}

@end
