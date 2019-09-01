//
//  AppDelegate.h
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class AppStore;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;
// Manager for the application database
@property (nonatomic, readonly) AppStore *appStore;

@end

