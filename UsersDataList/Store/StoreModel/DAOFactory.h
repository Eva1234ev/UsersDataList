//
//  DAOFactory.h
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserDAO;

NS_ASSUME_NONNULL_BEGIN
//Factory of a data access objects

@interface DAOFactory : NSObject
- (instancetype)initWithDBFilePath:(NSString *)path;
- (UserDAO *)userDAO;

@end

NS_ASSUME_NONNULL_END
