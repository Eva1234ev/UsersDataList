//
//  UserCache.m
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "UserCache.h"
#import "User.h"


@interface UserCache ()

@property (nonatomic, readwrite) NSMutableArray *users;

@property (nonatomic, readwrite) NSMutableDictionary *usersDictionary;

@end
@implementation UserCache

- (instancetype)init {
    self = [super init];
    if (self) {
        self.users   = [NSMutableArray array];
        self.usersDictionary = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (instancetype)initWithUsers:(NSArray *)usersAll {
    self = [self init];
    if (self) {
        for (NSInteger i = 0, max = [usersAll count]; i < max; ++i) {
            [self add:[usersAll objectAtIndex:i]];
        }
    }
    
    return self;
}

//Add the new user
- (BOOL)add:(User *)user {
    if (user.id == kUserIdNone) {
        return NO;
    }
    NSMutableArray *usersAll = [self.usersDictionary objectForKey:@(user.id)];
    if (usersAll) {
        [usersAll addObject:user];
    } else {
        usersAll = [NSMutableArray array];
        [usersAll addObject:user];
        [self.usersDictionary setObject:usersAll forKey:@(user.id)];
        [self.users addObject:user];
    }
    
    return YES;
}

//Remove the new user
- (BOOL)remove:(User *)user {
    NSMutableArray *usersAll = self.users;//[self.usersDictionary objectForKey:@(user.id)];
//    if (!(usersAll)) {
//        return NO;
//    }
    
    BOOL succeeded = NO;
    for (NSInteger i = 0, max = [usersAll count]; i < max; ++i) {
        User *existUser = [usersAll objectAtIndex:i];
        if (existUser.id == user.id) {
            [usersAll removeObjectAtIndex:i];
            succeeded = YES;
            break;
        }
    }
    
    if (succeeded && [usersAll count] == 0) {
        succeeded = [self removeUsers:user.id];
    }
    
    return succeeded;
}

// Update the new user

- (BOOL)update:(User *)oldUser newUser:(User*)newUser {
//    if ([oldUser.email compare:newUser.email] == NSOrderedSame) {
//        return [self replaceUser:newUser];
//    } else if ([self remove:oldUser]) {
//        return [self add:newUser];
//    }
          if (oldUser.id == newUser.id) {
            return [self replaceUser:newUser];
        } else if ([self remove:oldUser]) {
            return [self add:newUser];
        }
    return NO;
}

#pragma mark - Private

// Remove the

- (BOOL)removeUsers:(NSInteger)id {
    [self.usersDictionary removeObjectForKey:@(id)];
    for (NSInteger i = 0, max = [self.users count]; i < max; ++i) {
         User* u = [self.users objectAtIndex:i];
        if (u.id == id) {
            [self.users removeObjectAtIndex:i];
            return YES;
        }
    }
    
    return NO;
}

// Replace the user
- (BOOL)replaceUser:(User*)user {
    NSMutableArray *users = [self.usersDictionary objectForKey:@(user.id)];
    if (!(users)) {
        return NO;
    }
    
    for (NSInteger i = 0, max = [users count]; i < max; ++i) {
        User *existUser = [users objectAtIndex:i];
        if (existUser.id == user.id) {
            [users replaceObjectAtIndex:i withObject:user];
            return YES;
        }
    }
    
    return NO;
}
@end
