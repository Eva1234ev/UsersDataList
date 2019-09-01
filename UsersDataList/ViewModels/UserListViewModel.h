//
//  UserListViewModel.h
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Pagination;
NS_ASSUME_NONNULL_BEGIN

extern NSString * const UserListDidChangeNotification;

@interface UserListViewModel : NSObject
- (instancetype)initList;
@property (nonatomic, strong) Pagination *pagination;
//@property (nonatomic, strong) NSMutableArray *users;
- (void) makeRequest;
@end
NS_ASSUME_NONNULL_END
