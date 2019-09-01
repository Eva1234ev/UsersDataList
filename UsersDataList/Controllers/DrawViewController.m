//
//  DrawViewController.m
//  UsersDataList
//
//  Created by Eva on 29.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//
#import "DrawViewController.h"

@implementation DrawViewController


-(UIStatusBarStyle)preferredStatusBarStyle
{
    
    if ([self.centerViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *) self.centerViewController;
        
        return [[navigationController.viewControllers lastObject] preferredStatusBarStyle];
    }
    
    return UIStatusBarStyleDefault;
}



-(BOOL)prefersStatusBarHidden
{
    
    if ([self.centerViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *) self.centerViewController;
        
        return [[navigationController.viewControllers lastObject] preferredStatusBarStyle];
    }
    
    return NO;
}

#pragma mark Rotation

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
}

- (BOOL) shouldAutorotate {
    return [self.centerViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    if ([self.centerViewController isKindOfClass:[UINavigationController class]] && [NSStringFromClass([((UINavigationController*)self.centerViewController).topViewController class]) isEqualToString:@"PanoramaViewController"]) {
        return UIInterfaceOrientationMaskAll;
    }
    
    return UIInterfaceOrientationMaskPortrait;
}

@end
