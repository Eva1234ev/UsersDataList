//
//  User.m
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "User.h"


NSInteger const kUserIdNone = 0;
@interface User()

@property (nonatomic, readwrite)  NSInteger id;
@property (nonatomic, readwrite)  NSString *email;
@property (nonatomic, readwrite)  NSString *first_name;
@property (nonatomic, readwrite)  NSString *last_name;
@property (nonatomic, readwrite)  NSString *avatar;

@end
@implementation User

+ (instancetype)userWithId:(NSInteger)id email:(NSString *)email first:(NSString *)first_name last:(NSString *)last_name avatar:(NSString*) avatar{
    
    return [[User alloc] init:id email:email first:first_name last:last_name avatar:avatar];
}

- (instancetype)init:(NSInteger)userid email:(NSString *)email  first:(NSString *)first_name last:(NSString *)last_name avatar:(NSString *)avatar {
    self = [super init];
    if (self) {
        self.id  = userid;
        self.email = email;
        self.first_name = first_name;
        self.last_name = last_name;
        self.avatar = avatar;
    }
    
    return self;
}
@end
