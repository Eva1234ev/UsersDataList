//
//  LogInViewController.m
//  P2P Car Rent
//
//  Created by Artashes Ghazaryan on 10/5/17.
//  Copyright © 2017 Artashes Ghazaryan. All rights reserved.
//

#import "NSDictionary+UrlEncoding.h"

static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

static NSString *urlEncode(id object) {
    NSString *string = toString(object);
    
    NSString *escapedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                                    NULL,
                                                                                                    (__bridge CFStringRef) string,
                                                                                                    NULL,
                                                                                                    CFSTR("!*'();:&=+$/?%#[]\" "),
                                                                                                    kCFStringEncodingUTF8));
   
    
    
    
   
    
    return escapedString;
}


@implementation NSDictionary (UrlEncoding)

-(NSString*) urlEncodedString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

-(NSString*) urlString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", key, value];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

@end
