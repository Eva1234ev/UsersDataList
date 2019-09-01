//
//  AppStore.h
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class UserStore;

//Manager for the application database.
@interface AppStore : NSObject
//Manage for the users
@property (nonatomic, readonly) UserStore *userStore;
@end

NS_ASSUME_NONNULL_END
