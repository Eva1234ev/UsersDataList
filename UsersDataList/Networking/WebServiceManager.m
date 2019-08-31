//
//  WebServiceManage.m
//  UsersDataList
//
//  Created by Eva on 31.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "WebServiceManage.h"
#import "NSDictionary+UrlEncoding.h"
#import "JSON.h"
#import "AppManager.h"



static NSString *apiUrl = @"https://reqres.in/api/";
#define timeStamp [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000]

@implementation WebServiceManager


+ ( NSDictionary *) getDataFrom:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        return nil;
    }
    NSString *responseString = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    NSError *e = nil;
    NSData *jsonData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error: &e];
    
    
    return JSON;
}

+ (void)createUserWithCompletion:(NSDictionary *)params withCompletion:( void (^) (id response, NSError *error))handler {
    
    
    NSString *method = @"users";
    
    NSMutableURLRequest *request = [self requestForPostMethod:method withParams:[params JSONString]];
    
    // [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //[request setValue:[AppManager sharedManager].token forHTTPHeaderField:@"authorization"];
    
    [self executeRequest:request withCompletion:handler];
    
}

+ (NSMutableURLRequest *)requestForPostMethod:(NSString *)method withParams:(NSString *)params {
    
    
    
    NSString* url = [NSString stringWithFormat:@"%@%@", apiUrl, method];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    
    [request setHTTPMethod:@"POST"];
    
    //    [request setValue:[AppManager sharedManager].language forHTTPHeaderField:@"lang"];
    
    
    
    if (params) {
        
        NSData *postData = [params dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPBody:postData];
        
        
        
    }
    
    
    
    return request;
    
}



+ (void)getUsersListWithCompletion:(NSString*)page withCompletion:( void (^) (id response, NSError *error))handler {
    
    
    NSString *method = [NSString stringWithFormat:@"users?page=%@", page];
    
    
    
    
    NSMutableURLRequest *request = [self requestForGetMethod:method withParams:nil];
    
    // [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //  [request setValue:[AppManager sharedManager].token forHTTPHeaderField:@"authorization"];
    
    [self executeRequest:request withCompletion:handler];
    
}
+ (NSMutableURLRequest *) requestForGetMethod:(NSString *)method withParams:(NSString *)params {
    
    
    
    NSString* url = [NSString stringWithFormat:@"%@%@", apiUrl, method];
    
    if (params.length > 0) {
        
        url = [NSString stringWithFormat:@"%@%@?%@", apiUrl, method, params];
        
    }
    
    //        url =[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    
    [request setHTTPMethod:@"GET"];
    
    //    [request setValue:[AppManager sharedManager].language forHTTPHeaderField:@"lang"];
    
    
    
    return request;
    
}

+ (void)executeRequest:(NSURLRequest*)request withCompletion:( void (^) (id response, NSError *error))handler  {
    
    
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", dataString);
        
        if(response != nil){
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            
            NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
            
            if([httpResponse statusCode]!=200){
                
                error = @YES;
                
            }
            
            if([httpResponse statusCode]==401){
                
                //  [AppManager sharedManager].token = nil;
                
                
                
            }
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            
            handler([data objectFromJSONData], error);
            
        });
        
    }] resume];
    
}




@end
