//
//  UserDAO.h
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase, User;
NS_ASSUME_NONNULL_BEGIN

@interface UserDAO : NSObject

//Manager for the users data.
- (instancetype)init:(FMDatabase *)db;
- (BOOL)create;
- (User* )add:(NSString *)email first:(NSString *)first_name last:(NSString *)last_name avatar:(NSString *)avatar;
- (NSArray *)read;
- (BOOL)remove:(NSInteger)id;
- (BOOL)update:(User *)id;
@end

NS_ASSUME_NONNULL_END
