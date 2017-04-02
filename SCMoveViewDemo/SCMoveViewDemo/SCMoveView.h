//
//  SCMoveView.h
//  SCMoveViewDemo
//
//  Created by mac on 2017/4/1.
//  Copyright © 2017年 sc-ici. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCMoveView : UIView

@property (nonatomic, assign) float keyboardHeight;  //获取键盘的高度

@property (nonatomic, assign) float viewMovedHeight;  //view移动的的高度

- (void)addKeyboardWillShowNotification;

- (NSMutableArray*)theCoordinateYAndHeightOfTheSelectedTextField : (UITextField*)aTextField;  //获取要编辑的textField的Y轴坐标和textField的高度

- (void) moveTheViewUpForTheTextField : (UITextField*)aTextField onTheView : (UIView*)theView;  //开始编辑textField时上移整个View


- (void) moveTheViewDownForTheTextField : (UITextField*)aTextField onTheView : (UIView*)theView;  //结束编辑TextField时下移整个View


@end
