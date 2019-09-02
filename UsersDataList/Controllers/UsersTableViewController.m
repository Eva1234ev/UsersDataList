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


@interface UsersTableViewController ()<UserListViewModelDelegate>
{
    UIView * footerView;
    float heightCell;
}
@property (strong, nonatomic) IBOutlet UITableView *userTableView;
@property (nonatomic, strong) UserListViewModel *userViewModel;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userViewModel = [[UserListViewModel alloc] initList];
    self.userViewModel.delegate= self;
    [self initFooterViewActivity];


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

-(void)updatePageData:(UserListViewModel *)userModelView{
    self.userViewModel = userModelView;
    heightCell = self.userTableView.frame.size.height/self.userViewModel.pagination.per_page;
    [(UIActivityIndicatorView *)[footerView viewWithTag:10] stopAnimating];
    [self.userTableView reloadData];
    //    //    dispatch_async(dispatch_get_main_queue(), ^{
    //    //        NSIndexPath* indexPath = [NSIndexPath indexPathForRow: ([self.tableView numberOfRowsInSection:([self.tableView numberOfSections]-1)]-1) inSection:([self.tableView numberOfSections]-1)];
    //    //        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPositio
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
         [self.userViewModel updateUsersRequest];
        
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





@end
