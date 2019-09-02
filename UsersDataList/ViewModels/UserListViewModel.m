//
//  UserListViewModel.m
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "UserListViewModel.h"
#import "WebServiceManager.h"
#import "Pagination.h"
#import "User.h"
#import "UserDAO.h"

#import "AppDelegate.h"
#import "AppStore.h"
#import "UserStore.h"


@interface UserListViewModel ()
{
    int page;
}
@property (strong,nonatomic)NSMutableArray* users;
@property (nonatomic, strong, readwrite) Pagination *pagination;
@end
@implementation UserListViewModel

- (instancetype) initList
{
    self = [super init];
    if (self) {
        page = 1;
        self.users = [[NSMutableArray alloc] init];
        [self updateUsersRequest];
       
    }
    return self;
}


# pragma mark - web service methods

-(void) updateUsersRequest {
    UserStore *store  = [self userStore];
    if(store.users.count > 0) {
        
        
         [self.delegate updatePageData:self];
    }
   
    [WebServiceManager getUsersListWithCompletion: [NSString stringWithFormat:@"%d", page] withCompletion:^(id result, NSError *error) {
        self->page++;
        self.pagination = [[Pagination alloc] initWithDictionary:result error:nil];
        [self.users addObjectsFromArray: self.pagination.data];
        [self.pagination.data removeAllObjects];
        [self.pagination.data addObjectsFromArray:self.users];
         UserStore *store  = [self userStore];
        if(store.users.count > 0 )
        {

          [store removeAllDatabase:self.pagination];
          [store addInDatabase:self.pagination];
            
        }
//        [self addInDatabase];
       //  [ UserStore *store  = [self userStore] remove:book]
        [self.delegate updatePageData:self];
        
    }];
    
  
}


//- (void)addInDatabase:(Pagination*)p {
//    for(int i = 0 ;i < p.data.count ; i++){
//
//        UserData *u = p.data[i];
//        User * user =[User userWithId:u.id email:u.email first:u.first_name last:u.last_name avatar:u.avatar];
//        UserStore *store  = [self userStore];
//        [store add:user];
//    }
//
//}
//- (void)removeAllDatabase:(Pagination*)p {
//    for(int i = 0 ; i < 29; i++){
//        UserStore *store  = [self userStore];
//        User *u = store.users[i];
//        User * user =[User userWithId:u.id email:u.email first:u.first_name last:u.last_name avatar:u.avatar];
//       [store remove:user];
////        UserData *u = p.data[i];
////        User * user =[User userWithId:u.id email:u.email first:u.first_name last:u.last_name avatar:u.avatar];
////        UserStore *store  = [self userStore];
////        [store remove:user];
//    }
//    UserStore *store  = [self userStore];
//
//}

//Get user by index
- (User *)userAtIndexPath:(NSIndexPath *)indexPath {
    UserStore *store  = [self userStore];
    NSString  *user = [store.users objectAtIndex:indexPath.section];
    NSArray   *users  = [store.usersDictionary objectForKey:user];
    
    return [users objectAtIndex:indexPath.row];
}

//Get the user store.
- (UserStore *)userStore {
    AppDelegate *app   = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return app.appStore.userStore;
}


@end
