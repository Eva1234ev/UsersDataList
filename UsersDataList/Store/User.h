//
//  User.h
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "UserData.h"
NS_ASSUME_NONNULL_BEGIN

// Invalid user identifier
extern NSInteger const kUserIdNone;

@interface User : NSObject
@property (nonatomic, readonly) NSInteger userid;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *first_name;
@property (nonatomic, readonly) NSString *last_name;
@property (nonatomic, readonly) NSString *avatar;

+ (instancetype)userWithId:(NSInteger)userid email:(NSString *)email first:(NSString *)first_name last:(NSString *)last_name avatar:(NSString*) avatar;
@end

NS_ASSUME_NONNULL_END
