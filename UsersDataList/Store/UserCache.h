//
//  UserCache.h
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  User;
NS_ASSUME_NONNULL_BEGIN

@interface UserCache : NSObject
//Collection of author names.
@property (nonatomic, readonly) NSMutableArray *users;

//Dictionary of user
@property (nonatomic, readonly) NSMutableDictionary *usersDictionary;

- (instancetype)initWithUsers:(NSArray *)usersAll;
- (BOOL)add:(User *)user;
- (BOOL)remove:(User *)user;
- (BOOL)update:(User *)oldUser newUser:(User *)newUser;
@end

NS_ASSUME_NONNULL_END
