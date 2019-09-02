//
//  MenuTableViewController.m
//  UsersDataList
//
//  Created by Eva on 29.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuSettingsTableViewCell.h"
#import "MenuRegistrSignInTableViewCell.h"
#import "RegistrationViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerController+Subclass.h"
#import "UIViewController+MMDrawerController.h"
@interface MenuTableViewController ()<MenuRegistrSignInTableViewCellDelegate>{
    NSArray *menuItems;
}
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    menuItems = @[
                  @{@"icon":@"iconHome", @"name":@"Users List"},
                  @{@"icon":@"iconResource", @"name":@"Resource"}
                  //                  @{@"icon":@"giftCardIcon", @"name":@"Gift Card"},
                  //                  @{@"icon":@"iconShops", @"name":@"Shops"},
                  //                  @{@"icon":@"iconSales", @"name":@"Sales & Promos"},
                  //                  @{@"icon":@"iconDine", @"name":@"Dine"},
                  //                  @{@"icon":@"iconEntertainment", @"name":@"Entertainment"},
                  //                  @{@"icon":@"iconCinema", @"name":@"KinoPark"},
                  //                  @{@"icon":@"iconClubCard", @"name":@"Club Card"},
                  //                  @{@"icon":@"iconMall", @"name":@"Me & My Mall"},
                  //                  @{@"icon":@"services", @"name":@"Services"},
                  //                  @{@"icon":@"iconRadio", @"name":@"Mall Radio"},
                  //                  @{@"icon":@"iconAlerts", @"name":@"Alerts"},
                  //                  @{@"icon":@"iconInfoWhite", @"name":@"The Mall"},
                  //                  @{@"icon":@"mapWhiteIcon", @"name":@"Map"},
                  //                  @{@"icon":@"iconFb", @"name":@"Facebook"},
                  //                  @{@"icon":@"utility", @"name":@"Utilities"},
                  //                  @{@"icon":@"feedback", @"name":@"Feedback"},
                  ];
}
- (void)registrationProfile{
    
    RegistrationViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBar.translucent = NO;
    [self.mm_drawerController setCenterViewController:navigationController withCloseAnimation:YES completion:nil];
}
#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *menuRegistrSignInTableViewCell = @"MenuRegistrSignInTableViewCell";
    static NSString *menuSettingsTableViewCell = @"MenuSettingsTableViewCell";
    
    if(indexPath.row == 0){
        
        MenuRegistrSignInTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:menuRegistrSignInTableViewCell];
        if (cell == nil) {
            cell = [[MenuRegistrSignInTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:menuRegistrSignInTableViewCell];
        }
         cell.delegate = self;
        return cell;
    }else {//if(self.bookOrInfo && self.carArray.count>0){
        MenuSettingsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:menuSettingsTableViewCell];
        if (cell == nil) {
            cell = [[MenuSettingsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:menuSettingsTableViewCell];
        }
        
        [cell setInfo:[menuItems objectAtIndex:indexPath.row - 1]];
        
        return cell;
        
    }
    
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        return 150;
        
    }else{
        
        return 50;
    }
    
    
}



@end
