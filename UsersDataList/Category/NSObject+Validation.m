//
//  NSObject+Validation.m
//  CityQuest
//
//  Created by Hrachya Stepanyan on 3/21/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "NSObject+Validation.h"

@implementation NSObject (Validation)

- (BOOL)isValidObject {
    
    if (self && ![self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isValidString {
    
    if (self && [self isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isValidNumber {
    
    if (self && [self isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isValidArray {
    
    if (self && [self isKindOfClass:[NSArray class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isValidDictionary {
    
    if (self && [self isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isValidData {
    
    if (self && [self isKindOfClass:[NSData class]]) {
        return  YES;
    }
    
    return NO;
}

@end
