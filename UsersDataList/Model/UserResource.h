//
//  UserResource.h
//  UsersDataList
//
//  Created by Eva on 28.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface UserResource : JSONModel


@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *year;
@property (nonatomic) NSString *color;
@property (nonatomic) NSString *pantone_value;
@end

NS_ASSUME_NONNULL_END
