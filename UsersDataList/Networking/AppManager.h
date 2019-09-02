//
//  AppManager.h
//  Arajark
//
//  Created by Suren Poghosyan on 12/28/17.
//  Copyright © 2017 Realizeit LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"


@interface AppManager : NSObject

+ (AppManager*)sharedManager;

@property (nonatomic, strong) NSString *token;
+ (void)showAlert:(NSString*)message viewController:(UIViewController*)vc;
+ (void)showAlert:(NSString*)message viewController:(UIViewController*)vc okAction:( void (^) (void))handler;
@end
