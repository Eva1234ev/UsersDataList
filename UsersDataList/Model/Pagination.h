//
//  Pagination.h
//  UsersDataList
//
//  Created by Eva on 28.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "UserData.h"
NS_ASSUME_NONNULL_BEGIN

@protocol Pagination

@end
@interface Pagination : JSONModel

@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger per_page;
@property (nonatomic) NSInteger total;
@property (nonatomic) NSInteger total_pages;
@property (nonatomic) NSMutableArray <UserData, Optional> *data;
@end

NS_ASSUME_NONNULL_END
