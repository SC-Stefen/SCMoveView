//
//  ViewController.h
//  SCMoveViewDemo
//
//  Created by mac on 2017/4/1.
//  Copyright © 2017年 sc-ici. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMoveView.h"

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) SCMoveView *moveView;

@property(nonatomic, strong) UILabel *emailOrTelphoneLabel;
@property(nonatomic, strong) UILabel *userNameLabel;
@property(nonatomic, strong) UILabel *passwordLabel;
@property(nonatomic, strong) UILabel *confirempasswordLabel;
@property(nonatomic, strong) UITextField *emailOrTelphoneTextField;   //email或手机号
@property(nonatomic, strong) UITextField *userNameTextField;   //用户名
@property(nonatomic, strong) UITextField *passwordTextField;   //密码
@property(nonatomic, strong) UITextField *confiremPasswordTextField;   //确认密码

@property (nonatomic, strong) UITextField *atext;



@end

