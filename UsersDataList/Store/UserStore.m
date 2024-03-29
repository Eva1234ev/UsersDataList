//
//  UserStore.m
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "UserStore.h"
#import "DAOFactory.h"
#import "User.h"
#import "UserCache.h"
#import "UserDAO.h"
#import "Pagination.h"

@interface UserStore ()

//Factory of a data access objects
@property (nonatomic) DAOFactory *daoFactory;
//Manager for the user data
@property (nonatomic) UserCache *userCache;

@end
@implementation UserStore
- (instancetype)init:(DAOFactory *)daoFactory {
    self = [super init];
    if (self && daoFactory) {
        self.daoFactory = daoFactory;
        
        UserDAO *dao = [self.daoFactory userDAO];
        [dao create];
        self.userCache = [[UserCache alloc] initWithUsers:[dao read]];
    }
    
    return self;
}

//A collection of users name.
- (NSArray *)users {
    return self.userCache.users;
}

//Dictionary of user
- (NSDictionary *)usersDictionary {
    return self.userCache.usersDictionary;
}


- (void)addInDatabase:(Pagination*)p {
    for(int i = 0 ;i < p.data.count ; i++){
        
        UserData *u = p.data[i];
        User * user =[User userWithId:u.id email:u.email first:u.first_name last:u.last_name avatar:u.avatar];
        [self add:user];
    }
    
}
- (void)removeAllDatabase:(Pagination*)p {
    for(int i = 0 ; i < [self users].count; i++){
        User *u = [self users][i];
        User * user =[User userWithId:u.id email:u.email first:u.first_name last:u.last_name avatar:u.avatar];
        [self remove:user];
    }

}

- (BOOL)add:(User *)user {
    UserDAO *dao   = [self.daoFactory userDAO];
    
    User *newUser = [dao add:user.email first:user.first_name last:(NSString *)user.last_name avatar:(NSString *)user.avatar];
    if (newUser) {
        return [self.userCache add:newUser];
    }
    
    return NO;
}


// Remove the new user
- (BOOL)remove:(User *)user {
    UserDAO *dao = [self.daoFactory userDAO];
    if ([dao remove:user.id]) {
        return [self.userCache remove:user];
    }
    
    return NO;
}

//Update the new user.

- (BOOL)update:(User *)oldUser newUser:(User *)newUser {
    UserDAO *dao = [self.daoFactory userDAO];
    if ([dao update:newUser]) {
        return [self.userCache update:oldUser newUser:newUser];
    }
    
    return NO;
}

@end
