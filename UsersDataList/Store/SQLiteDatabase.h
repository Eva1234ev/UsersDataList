//
//  SQLiteDatabase.h
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SQLiteDatabase

@end
@interface SQLiteDatabase : NSObject
@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *DB;
@end

NS_ASSUME_NONNULL_END
