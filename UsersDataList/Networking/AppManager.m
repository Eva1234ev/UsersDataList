//
//  AppManager.m
//  Arajark
//
//  Created by Suren Poghosyan on 12/28/17.
//  Copyright © 2017 Realizeit LLC. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager
+ (AppManager*)sharedManager {
    static AppManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[AppManager alloc] init];
    });
    
    return sharedManager;
}


- (instancetype)init
{
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self = [super init];
    if (self) {
        self.token = [defaults objectForKey:@"token"];
    }
    return self;
}


- (void)save {
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     [defaults setObject:self.token forKey:@"token"];

 }


#pragma mark Helpers

+ (void)showAlert:(NSString*)message viewController:(UIViewController*)vc {
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Something went wromg"
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:okAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
}

+ (void)showAlert:(NSString*)message viewController:(UIViewController*)vc okAction:( void (^) (void))handler {
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Something went wromg"
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
        handler();
    }];
    
    [alertController addAction:okAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
}
@end
