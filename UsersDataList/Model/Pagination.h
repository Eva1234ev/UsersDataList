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
#import "Page.h"
NS_ASSUME_NONNULL_BEGIN


@interface Pagination : Page

@property (nonatomic) NSMutableArray <UserData> *data;
@end

NS_ASSUME_NONNULL_END
