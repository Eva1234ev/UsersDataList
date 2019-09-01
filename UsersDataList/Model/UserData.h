//
//  UserData.h
//  UsersDataList
//
//  Created by Eva on 28.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
@protocol UserData
@end
@interface UserData : JSONModel
@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *first_name;
@property (nonatomic) NSString *last_name;
@property (nonatomic) NSString *avatar;
@end

NS_ASSUME_NONNULL_END
