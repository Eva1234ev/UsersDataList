//
//  PageProtocol.h
//  UsersDataList
//
//  Created by Eva on 02.09.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PageProtocol <NSObject>
@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger per_page;
@property (nonatomic) NSInteger total;
@property (nonatomic) NSInteger total_pages;
@end

NS_ASSUME_NONNULL_END
