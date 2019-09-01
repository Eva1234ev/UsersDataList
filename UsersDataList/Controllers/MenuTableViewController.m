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
@interface MenuTableViewController (){
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
        
        
       // cell.carImageView.layer.cornerRadius = 10.0f;
       
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


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
