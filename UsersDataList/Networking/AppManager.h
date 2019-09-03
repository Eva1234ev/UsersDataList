//
//  AppManager.h
//
//  Created by Eva on 29.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"


@interface AppManager : NSObject

+ (AppManager*)sharedManager;

@property (nonatomic, strong) NSString *token;
+ (void)showAlert:(NSString*)message viewController:(UIViewController*)vc;
+ (void)showAlert:(NSString*)message viewController:(UIViewController*)vc okAction:( void (^) (void))handler;
@end
