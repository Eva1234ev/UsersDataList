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
    if (user.userid == kUserIdNone) {
        return NO;
    }
    NSMutableArray *usersAll = [self.usersDictionary objectForKey:user.email];
    if (usersAll) {
        [usersAll addObject:user];
    } else {
        usersAll = [NSMutableArray array];
        [usersAll addObject:user];
        [self.usersDictionary setObject:usersAll forKey:user.email];
        [self.users addObject:user.email];
    }
    
    return YES;
}

//Remove the new user
- (BOOL)remove:(User *)user {
    NSMutableArray *usersAll = [self.usersDictionary objectForKey:user.email];
    if (!(usersAll)) {
        return NO;
    }
    
    BOOL succeeded = NO;
    for (NSInteger i = 0, max = [usersAll count]; i < max; ++i) {
        User *existUser = [usersAll objectAtIndex:i];
        if (existUser.userid == user.userid) {
            [usersAll removeObjectAtIndex:i];
            succeeded = YES;
            break;
        }
    }
    
    if (succeeded && [usersAll count] == 0) {
        succeeded = [self removeUsers:user.email];
    }
    
    return succeeded;
}

// Update the new user

- (BOOL)update:(User *)oldUser newUser:(User*)newUser {
    if ([oldUser.email compare:newUser.email] == NSOrderedSame) {
        return [self replaceUser:newUser];
    } else if ([self remove:oldUser]) {
        return [self add:newUser];
    }
    
    return NO;
}

#pragma mark - Private

// Remove the

- (BOOL)removeUsers:(NSString *)email {
    [self.usersDictionary removeObjectForKey:email];
    for (NSInteger i = 0, max = [self.users count]; i < max; ++i) {
        NSString *existEmail = [self.users objectAtIndex:i];
        if ([existEmail compare:email] == NSOrderedSame) {
            [self.users removeObjectAtIndex:i];
            return YES;
        }
    }
    
    return NO;
}

// Replace the user
- (BOOL)replaceUser:(User*)user {
    NSMutableArray *users = [self.usersDictionary objectForKey:user.email];
    if (!(users)) {
        return NO;
    }
    
    for (NSInteger i = 0, max = [users count]; i < max; ++i) {
        User *existUser = [users objectAtIndex:i];
        if (existUser.userid == user.userid) {
            [users replaceObjectAtIndex:i withObject:user];
            return YES;
        }
    }
    
    return NO;
}
@end
