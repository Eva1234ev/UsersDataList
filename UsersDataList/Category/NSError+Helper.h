//
//
//  Created by Eva on 31.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSError (Helper)

+ (NSError *)errorWithResponseParams:(NSDictionary *)responseParams;
+ (NSError *)unknownResponseError;
+ (NSError *)errorWithCode:(NSUInteger)code message:(NSString *)message;
@end
