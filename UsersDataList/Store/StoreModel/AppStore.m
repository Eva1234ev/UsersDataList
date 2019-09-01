//
//  AppStore.m
//  UsersDataList
//
//  Created by Eva on 30.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "AppStore.h"
#import "UserStore.h"
#import "DAOFactory.h"

@interface AppStore ()

@property (nonatomic, readwrite) UserStore *userStore;
//Factory of a data access objects
@property (nonatomic) DAOFactory *daoFactory;

@end

@implementation AppStore

- (instancetype)init {
    self = [super init];
    if (self) {
        self.daoFactory = [[DAOFactory alloc] init];
        self.userStore = [[UserStore alloc] init:self.daoFactory];
    }
    
    return self;
}
@end
