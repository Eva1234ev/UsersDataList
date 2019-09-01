//
//
//  Created by Eva on 31.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSObject (Validation)

- (BOOL)isValidObject;
- (BOOL)isValidString;
- (BOOL)isValidNumber;
- (BOOL)isValidArray;
- (BOOL)isValidDictionary;
- (BOOL)isValidData;

@end
