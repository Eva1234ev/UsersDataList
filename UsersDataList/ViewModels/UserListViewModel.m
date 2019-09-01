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


NSString* const UserListDidChangeNotification = @"UserListDidChangeNotification";
NSString* const UserListDidChangeInKey = @"UserListDidChangeInKey";


@interface UserListViewModel ()
{
    int page;
}
@property (strong,nonatomic)NSMutableArray* users;
@end
@implementation UserListViewModel

- (instancetype) initList
{
    self = [super init];
    if (self) {
        page = 1;
        self.users = [[NSMutableArray alloc] init];
        [self makeRequest];
       
    }
    return self;
}

# pragma mark - web service methods

-(void) makeRequest {
    
   // NSString *strUrl = [ @"https://reqres.in/api/users?page=" stringByAppendingString: [NSString stringWithFormat:@"%d",page]];
    [WebServiceManager getUsersListWithCompletion: [NSString stringWithFormat:@"%d", page] withCompletion:^(id result, NSError *error) {
        self->page++;
        NSDictionary * d = result;
        self.pagination = [[Pagination alloc] initWithDictionary:d error:nil];
        [self.users addObjectsFromArray: self.pagination.data];
        [self.pagination.data removeAllObjects];
        [self.pagination.data addObjectsFromArray:self.users];
        
        //  [self addInDatabase];
        
        NSDictionary * dkey = [NSDictionary dictionaryWithObject:[WebServiceManager getDataFrom:strUrl] forKey:UserListDidChangeInKey] ;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserListDidChangeNotification" object:nil userInfo:dkey];
    }];

}

//
//- (void)addInDatabase {
//    for(int i=0 ;i< [self.pagination.data count];i++){
//   User *  u =    [User userWithId:[[self.pagination.data objectAtIndex:i] valueForKey:@"id"]
//                  email:[[self.pagination.data objectAtIndex:i]valueForKey:@"email"]
//                  first:[[self.pagination.data objectAtIndex:i]valueForKey:@"first_name"]
//                   last:[[self.pagination.data objectAtIndex:i]valueForKey:@"last_name"]
//                 avatar:[[self.pagination.data objectAtIndex:i]valueForKey:@"avatar"]];
//        UserStore *store    = [self userStore];
//        BOOL  succeeded = NO;
//        
//        //if (u.userid == kUserIdNone) {
//            succeeded = [store add:u];
//
//        
//    }
//     UserStore *store  = [self userStore];
//    
//    
//}
//
////Get user by index
//- (User *)userAtIndexPath:(NSIndexPath *)indexPath {
//    UserStore *store  = [self userStore];
//    NSString  *user = [store.users objectAtIndex:indexPath.section];
//    NSArray   *users  = [store.usersDictionary objectForKey:user];
//    
//    return [users objectAtIndex:indexPath.row];
//}
//
////Get the user store.
//- (UserStore *)userStore {
//    AppDelegate *app   = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    return app.appStore.userStore;
//}



//
//- (NSUInteger)numberOfUsersInSection {
//    return self.users.count;
//}
//
//- (NSString *)emailUserAtIndexPath:(NSIndexPath *)indexPath{
//    return [[self.users objectAtIndex:indexPath.row] valueForKey:@"email"];
//}
//
//- (NSString *)fullNameAtIndexPath:(NSIndexPath *)indexPath {
//    return [NSString stringWithFormat:@"%@ %@",[[self.users objectAtIndex:indexPath.row] valueForKey:@"first_name"],[[self.users objectAtIndex:indexPath.row] valueForKey:@"last_name"]];
//}

@end
