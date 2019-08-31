//
//  WebServiceManage.h
//  UsersDataList
//
//  Created by Eva on 31.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//



#import <Foundation/Foundation.h>


@interface WebServiceManager : NSObject

+ ( NSDictionary *) getDataFrom:(NSString *)url;
+ (void)getUsersListWithCompletion:(NSString*)page withCompletion:( void (^) (id response, NSError *error))handler;
+ (void)createUserWithCompletion:(NSDictionary *)params withCompletion:( void (^) (id response, NSError *error))handler;



@end
