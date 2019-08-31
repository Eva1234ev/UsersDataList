//
//  NSError+Helper.m
//  CityQuest
//
//  Created by Hrachya Stepanyan on 3/23/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "NSError+Helper.h"


#define kErrorDomain      @"com.Realizit"
#define kUnknownErrorCode 10001


@implementation NSError (Helper)

+ (NSError *)errorWithResponseParams:(NSDictionary *)responseParams {
    
    NSInteger code = [responseParams[@"code"] integerValue];
    NSString* description = responseParams[@"message"] ? responseParams[@"message"] : @"";
    NSError* error = [[NSError alloc] initWithDomain:kErrorDomain
                                                code:code
                                            userInfo:@{ NSLocalizedDescriptionKey : description}];
    return error;
}

+ (NSError *)unknownResponseError {
    
    NSError *error = [[NSError alloc] initWithDomain:kErrorDomain
                                                code:kUnknownErrorCode
                                            userInfo:@{NSLocalizedDescriptionKey : @"unknown_response"}];
    return error;
}

+ (NSError *)errorWithCode:(NSUInteger)code message:(NSString *)message {
    
    NSError *error = [[NSError alloc] initWithDomain:kErrorDomain
                                                code:code
                                            userInfo:@{ NSLocalizedDescriptionKey : message } ];
    return error;
}

@end
