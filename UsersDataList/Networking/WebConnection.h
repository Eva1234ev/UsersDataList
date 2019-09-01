//
//  WebConnection.h
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@protocol WebRequestResult1
-(void) webResponse:(NSDictionary*)responseDictionary;
@end

@interface WebConnection : NSObject
{
    
    __weak id<WebRequestResult1> delegate;
    
    NSMutableData *webData;
    NSString *xmlData;
    AppDelegate *appDelegate;
}

@property(weak,nonatomic)    id<WebRequestResult1> delegate;
@property(strong,nonatomic) NSDictionary *responseDictionary;
-(void) makeConnection :(NSMutableURLRequest*)req;

@end

