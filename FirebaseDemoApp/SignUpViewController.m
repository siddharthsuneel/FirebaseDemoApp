//
//  SignUpViewController.m
//  FirebaseDemoApp
//
//  Created by Siddharth Suneel on 11/11/16.
//  Copyright © 2016 SiddharthSuneel. All rights reserved.
//

#import "SignUpViewController.h"
#import "HomeViewController.h"
#import "UIAlertController+Window.h"

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView{
    _cancelButton.layer.cornerRadius = 15.0;
    _cancelButton.layer.borderColor = [UIColor blackColor].CGColor;
    _cancelButton.layer.borderWidth = 0.5;
    _cancelButton.clipsToBounds = YES;
    
    _signUpButton.layer.cornerRadius = 15.0;
    _signUpButton.layer.borderColor = [UIColor blackColor].CGColor;
    _signUpButton.layer.borderWidth = 0.5;
    _signUpButton.clipsToBounds = YES;
}

- (IBAction)didClickSignUp:(id)sender {
    if (_emailTextField.text.length > 0 && _passwordTextField.text.length > 0) {
        [[FIRAuth auth] createUserWithEmail:_emailTextField.text
                                   password:_passwordTextField.text
                                 completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                                     if (!error) {
//                                         UIAlertAction* alertAction = [UIAlertAction
//                                                                    actionWithTitle:@"Ok"
//                                                                    style:UIAlertActionStyleDefault
//                                                                    handler:^(UIAlertAction * action) {
//                                                                        HomeViewController *homeVC = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
//                                                                        homeVC.currentloggedInUser = user;
//                                                                        [self.navigationController pushViewController:homeVC animated:YES];
//                                                                    }];
                                         [self dismissCurrentViewController];
                                         [UIAlertController displayOkAlertWithTitle:@"New User Added Successfully" message:@"Start Now"];
                                     }
                                     else{
                                         [UIAlertController displayOkAlertWithTitle:@"Try Again" message:error.localizedDescription];
                                     }
                                 }];
    }
    else{
        [UIAlertController displayOkAlertWithTitle:@"Try Again" message:@"All Fields Are Mandatory."];
    }
}

- (void)dismissCurrentViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didClickCancelEvent:(id)sender {
    [self dismissCurrentViewController];
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
