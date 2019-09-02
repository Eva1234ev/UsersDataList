//
//  UserListViewModel.h
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UserListViewModel;
@class Pagination;
NS_ASSUME_NONNULL_BEGIN


@protocol UserListViewModelDelegate
-(void)updatePageData:(UserListViewModel*) userModelView;
@end


@interface UserListViewModel : NSObject

- (instancetype)initList;
- (void) updateUsersRequest;
@property (nonatomic, strong, readonly) Pagination *pagination;
@property (nonatomic,weak) id<UserListViewModelDelegate>delegate;

@end
NS_ASSUME_NONNULL_END
