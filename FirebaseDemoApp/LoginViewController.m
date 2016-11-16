//
//  ViewController.m
//  FirebaseDemoApp
//
//  Created by Siddharth Suneel on 11/11/16.
//  Copyright © 2016 SiddharthSuneel. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "HomeViewController.h"
#import "UIAlertController+Window.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswdButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *fbButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *googleButton;
@property (weak, nonatomic) IBOutlet UIButton *githubButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Login";
//    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillLayoutSubviews{
    
    CGFloat buttonSize = 30.0;
    _loginButton = [self customiseButton:_loginButton cornerRadius:10.0];
    _fbButton = [self customiseButton:_fbButton cornerRadius:buttonSize/2];
    _googleButton = [self customiseButton:_googleButton cornerRadius:buttonSize/2];
    _twitterButton = [self customiseButton:_twitterButton cornerRadius:buttonSize/2];
    _githubButton = [self customiseButton:_githubButton cornerRadius:buttonSize/2];
}

- (UIButton *)customiseButton:(UIButton *)button cornerRadius:(CGFloat)aCornerRadius{
    button.layer.cornerRadius = aCornerRadius;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 0.5;
    button.clipsToBounds = YES;
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickLogin:(id)sender {
    if (_userNameTextField.text .length > 0 && _passwordTextField.text.length > 0) {
        [[FIRAuth auth] signInWithEmail:_userNameTextField.text
                               password:_passwordTextField.text
                             completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                                 if (!error) {
                                     HomeViewController *homeVC = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
                                     homeVC.currentloggedInUser = user;
                                     [self.navigationController pushViewController:homeVC animated:YES];
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

- (IBAction)didClickSignUp:(id)sender {

}

- (IBAction)didclickForgetPasswd:(id)sender {
    
}

- (IBAction)didClickFbLoggingButton:(id)sender {

}


@end
