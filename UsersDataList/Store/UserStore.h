//
//  UserStore.h
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DAOFactory,User;
NS_ASSUME_NONNULL_BEGIN

@interface UserStore : NSObject
//Collection of users
@property (nonatomic, readonly) NSArray *users;

// Dictionary of users 
@property (nonatomic, readonly) NSDictionary *usersDictionary;

- (instancetype)init:(DAOFactory *)daoFactory;
- (BOOL)add:(User *)user;
- (BOOL)remove:(User *)user;
- (BOOL)update:(User *)oldUser newUser:(User *)newUserk;
@end

NS_ASSUME_NONNULL_END
