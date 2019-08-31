//
//  NSObject+Validation.h
//  CityQuest
//
//  Created by Hrachya Stepanyan on 3/21/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
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
