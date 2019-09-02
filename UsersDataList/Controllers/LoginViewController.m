//
//  LoginViewController.m
//  UsersDataList
//
//  Created by Eva on 02.09.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "LoginViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "ACFloatingTextField.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet ACFloatingTextField *mailTextField;
@property (weak, nonatomic) IBOutlet ACFloatingTextField *passwordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mailTextField.lineColor = [UIColor whiteColor];
    self.mailTextField.selectedLineColor = [UIColor whiteColor];
    self.mailTextField.placeHolderColor = [UIColor whiteColor];
    self.mailTextField.selectedPlaceHolderColor = [UIColor whiteColor];
    
    self.passwordTextField.lineColor = [UIColor whiteColor];
    self.passwordTextField.selectedLineColor = [UIColor whiteColor];
    self.passwordTextField.placeHolderColor = [UIColor whiteColor];
    self.passwordTextField.selectedPlaceHolderColor = [UIColor whiteColor];
    

}
- (IBAction)registartionButtonAction:(id)sender {
}
- (IBAction)loginButtonAction:(id)sender {
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
