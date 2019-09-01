//
//  UsersTableViewCell.h
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserData;
NS_ASSUME_NONNULL_BEGIN

@interface UsersTableViewCell : UITableViewCell
-(void)userData:(UserData *) user;
@end
NS_ASSUME_NONNULL_END
