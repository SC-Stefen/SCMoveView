//
//  ViewController.m
//  SCMoveViewDemo
//
//  Created by mac on 2017/4/1.
//  Copyright © 2017年 sc-ici. All rights reserved.
//

#import "ViewController.h"

#define deviceScreenWidth [[UIScreen mainScreen]bounds].size.width

#define deviceScreenHeight [[UIScreen mainScreen]bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _moveView = [[SCMoveView alloc]init];
    
    [_moveView addKeyboardWillShowNotification];   //先注册通知
    
    
    //设置一个全屏幕button，当点击背景时，隐藏键盘
    
    UIButton *backgroundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backgroundBtn setFrame:CGRectMake(0, 0, deviceScreenWidth, deviceScreenHeight)];
    
    [backgroundBtn setBackgroundColor:[UIColor blueColor]];
    
    [backgroundBtn setAlpha:0.15];
    
    [backgroundBtn addTarget:self action:@selector(backgroundBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backgroundBtn];
    
    
    
    //初始化_emailOrTelphoneTextField和_emailOrTelphoneLabel
    
    _emailOrTelphoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 130, deviceScreenWidth - 230, 40)];
    
    [_emailOrTelphoneLabel setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_emailOrTelphoneLabel setTextAlignment:NSTextAlignmentRight];
    
    [_emailOrTelphoneLabel setTextColor:[UIColor blackColor]];
    
    [_emailOrTelphoneLabel setText:@"手机号:"];
    
    //_emailOrTelphoneLabel.hidden = YES;
    
    [self.view addSubview:_emailOrTelphoneLabel];
    
    _emailOrTelphoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(deviceScreenWidth - 225, 130, 200, 40)];
    
    [_emailOrTelphoneTextField setTextAlignment:NSTextAlignmentLeft];
    
    [_emailOrTelphoneTextField setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_emailOrTelphoneTextField setTextColor:[UIColor blackColor]];
    
    [_emailOrTelphoneTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [_emailOrTelphoneTextField setPlaceholder:@"输入手机号"];
    
    //_emailOrTelphoneTextField.hidden = YES;
    
    _emailOrTelphoneTextField.delegate = self;
    
    [self.view addSubview:_emailOrTelphoneTextField];
    
    
    //初始化userNameTextField和_userNameLabel
    
    _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 190, deviceScreenWidth - 230, 40)];
    
    [_userNameLabel setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_userNameLabel setTextAlignment:NSTextAlignmentRight];
    
    [_userNameLabel setTextColor:[UIColor blackColor]];
    
    [_userNameLabel setText:@"用户名:"];
    
    [self.view addSubview:_userNameLabel];
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(deviceScreenWidth - 225, 190, 200, 40)];
    
    [_userNameTextField setTextAlignment:NSTextAlignmentLeft];
    
    [_userNameTextField setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_userNameTextField setTextColor:[UIColor blackColor]];
    
    [_userNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [_userNameTextField setPlaceholder:@"输入用户名"];
    
    [self.view addSubview:_userNameTextField];
    
    _userNameTextField.delegate = self;
    
    
    
    //初始化_passwordTextField和_passwordLabel
    
    _passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, deviceScreenWidth - 230, 40)];
    
    [_passwordLabel setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_passwordLabel setTextAlignment:NSTextAlignmentRight];
    
    [_passwordLabel setTextColor:[UIColor blackColor]];
    
    [_passwordLabel setText:@"密码:"];
    
    [self.view addSubview:_passwordLabel];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(deviceScreenWidth - 225, 250, 200, 40)];
    
    [_passwordTextField setTextAlignment:NSTextAlignmentLeft];
    
    [_passwordTextField setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_passwordTextField setTextColor:[UIColor blackColor]];
    
    [_passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [_passwordTextField setPlaceholder:@"输入密码"];
    
    [self.view addSubview:_passwordTextField];
    
    _passwordTextField.delegate = self;
    
    
    
    //初始化_confiremPasswordTextField和_confirempasswordLabel
    
    _confirempasswordLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 310, deviceScreenWidth - 230, 40)];
    
    [_confirempasswordLabel setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_confirempasswordLabel setTextAlignment:NSTextAlignmentRight];
    
    [_confirempasswordLabel setTextColor:[UIColor blackColor]];
    
    [_confirempasswordLabel setText:@"确认密码:"];
    
    [self.view addSubview:_confirempasswordLabel];
    
    _confiremPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(deviceScreenWidth - 225, 310, 200, 40)];
    
    [_confiremPasswordTextField setTextAlignment:NSTextAlignmentLeft];
    
    [_confiremPasswordTextField setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_confiremPasswordTextField setTextColor:[UIColor blackColor]];
    
    [_confiremPasswordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [_confiremPasswordTextField setPlaceholder:@"确认密码"];
    
    [self.view addSubview:_confiremPasswordTextField];
    
    _confiremPasswordTextField.delegate = self;
    
    
    
    _atext = [[UITextField alloc] initWithFrame:CGRectMake(deviceScreenWidth - 225, 370, 200, 40)];
    
    [_atext setTextAlignment:NSTextAlignmentLeft];
    
    [_atext setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    
    [_atext setTextColor:[UIColor blackColor]];
    
    [_atext setBorderStyle:UITextBorderStyleRoundedRect];
    
    [_atext setPlaceholder:@"确认密码"];
    
    [self.view addSubview:_atext];
    
    _atext.delegate = self;
    
}


- (void)backgroundBtnPressed : (UIButton*)sender {
    
    [_emailOrTelphoneTextField resignFirstResponder];
    
    [_userNameTextField resignFirstResponder];
    
    [_passwordTextField resignFirstResponder];
    
    [_confiremPasswordTextField resignFirstResponder];
    
    [_atext resignFirstResponder];
    
}

- (void)textFieldDidBeginEditing:(UITextField*)textField
{
    
    [_moveView moveTheViewUpForTheTextField:textField onTheView:self.view];
    
    
}

- (void)textFieldDidEndEditing:(UITextField*)textField
{
    
    [_moveView moveTheViewDownForTheTextField:textField onTheView:self.view];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
