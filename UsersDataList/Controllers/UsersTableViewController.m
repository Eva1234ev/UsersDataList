//
//  UsersTableViewController.m
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "UsersTableViewController.h"
#import "UserListViewModel.h"

#import "AppDelegate.h"
#import "UsersTableViewCell.h"

#import "UIViewController+MMDrawerController.h"
#import "WebServiceManager.h"
#import "Pagination.h"
#import <CCBottomRefreshControl/UIScrollView+BottomRefreshControl.h>
@interface UsersTableViewController ()
{
    Pagination * pagination;
    UIView * footerView;
    float heightCell;
}
@property (strong, nonatomic) IBOutlet UITableView *userTableView;
@property (nonatomic, strong) UserListViewModel *userViewModel;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    NSDictionary *params = @{@"name":@"Anie",
//                             @"job":@"Teacher",
//                             @"year": @(2001),
//                             @"email": @"eeeee.weaver@reqres.in",
//                             @"first_name": @"Jannet",
//                             @"last_name": @"Jackson",
//                             @"avatar": @"https://pbs.twimg.com/profile_images/1006266234181210117/oedmUmVc.jpg"
//                             };
//
//    [WebServiceManager createUserWithCompletion:params
//
//                   withCompletion:^(id response, NSError *error) {
//                      // NSLog(@"")
//                       if (!error) {
//
//                           }
//
//
//
//                   }];
//


    self.userViewModel = [[UserListViewModel alloc] initList];
    heightCell = self.userTableView.frame.size.height/self.userViewModel.pagination.per_page;
    [self initFooterViewActivity];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userListNotification:) name:UserListDidChangeNotification object:nil];
    
}

-(void)initFooterViewActivity
{
    footerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 40.0)];
    UIActivityIndicatorView * actInd = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    actInd.tag = 10;
    actInd.frame = CGRectMake((self.view.frame.size.width-20)/2, 5.0, 20.0, 20.0);
    actInd.hidesWhenStopped = YES;
    [footerView addSubview:actInd];
    actInd = nil;
}


-(void) userListNotification:(NSNotification*)notification{
    Pagination * pagination = [[Pagination alloc] initWithDictionary: [notification.userInfo objectForKey:@"UserListDidChangeInKey"] error:nil];
    self.userViewModel.pagination = pagination;
    [self.userTableView.refreshControl endRefreshing];
    [(UIActivityIndicatorView *)[footerView viewWithTag:10] stopAnimating];
    [self.userTableView reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow: ([self.tableView numberOfRowsInSection:([self.tableView numberOfSections]-1)]-1) inSection:([self.tableView numberOfSections]-1)];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    });
}

#pragma mark - scrolling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    BOOL endOfTable = (scrollView.contentOffset.y >= (( self.userViewModel.pagination.data.count * heightCell) - scrollView.frame.size.height));
        if(self.userViewModel.pagination.page != self.userViewModel.pagination.total_pages && endOfTable )
        {
                self.userTableView.tableFooterView = footerView;
                [(UIActivityIndicatorView *)[footerView viewWithTag:10] startAnimating];
        }

}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    BOOL endOfTable = (scrollView.contentOffset.y >= (( self.userViewModel.pagination.data.count * heightCell) - scrollView.frame.size.height));
    if(self.userViewModel.pagination.page != self.userViewModel.pagination.total_pages && endOfTable )
    {
         [self.userViewModel makeRequest];
        
    }
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return  self.userViewModel.pagination.data.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return heightCell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *usersTableViewCell = @"UsersTableViewCell";
    UsersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:usersTableViewCell];
    if (cell == nil) {
        cell = [[UsersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:usersTableViewCell];
    }
    [cell userData:[self.userViewModel.pagination.data objectAtIndex:indexPath.row]];

    return cell;
}

#pragma mark - open menu page

- (IBAction)menuButtonAction:(UIButton *)sender {
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
