//
//  RegistrationViewController.m
//  UsersDataList
//
//  Created by Eva on 02.09.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "RegistrationViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "ACFloatingTextField.h"
@interface RegistrationViewController ()<UITextFieldDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet ACFloatingTextField *emailTextField;
@property (weak, nonatomic) IBOutlet ACFloatingTextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet ACFloatingTextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet ACFloatingTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet ACFloatingTextField *confirmTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewJoin;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstNameTextField.lineColor = [UIColor whiteColor];
    self.firstNameTextField.selectedLineColor = [UIColor whiteColor];
    self.firstNameTextField.placeHolderColor = [UIColor whiteColor];
    self.firstNameTextField.selectedPlaceHolderColor = [UIColor whiteColor];
    
    self.lastNameTextField.lineColor = [UIColor whiteColor];
    self.lastNameTextField.selectedLineColor = [UIColor whiteColor];
    self.lastNameTextField.placeHolderColor = [UIColor whiteColor];
    self.lastNameTextField.selectedPlaceHolderColor = [UIColor whiteColor];
    
    self.emailTextField.lineColor = [UIColor whiteColor];
    self.emailTextField.selectedLineColor = [UIColor whiteColor];
    self.emailTextField.placeHolderColor = [UIColor whiteColor];
    self.emailTextField.selectedPlaceHolderColor = [UIColor whiteColor];
    
    self.passwordTextField.lineColor = [UIColor whiteColor];
    self.passwordTextField.selectedLineColor = [UIColor whiteColor];
    self.passwordTextField.placeHolderColor = [UIColor whiteColor];
    self.passwordTextField.selectedPlaceHolderColor = [UIColor whiteColor];
    
    self.confirmTextField.lineColor = [UIColor whiteColor];
    self.confirmTextField.selectedLineColor = [UIColor whiteColor];
    self.confirmTextField.placeHolderColor = [UIColor whiteColor];
    self.confirmTextField.selectedPlaceHolderColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
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
