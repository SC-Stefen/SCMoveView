//
//  SCMoveView.m
//  SCMoveViewDemo
//
//  Created by mac on 2017/4/1.
//  Copyright © 2017年 sc-ici. All rights reserved.
//

#import "SCMoveView.h"

#define deviceScreenWidth [[UIScreen mainScreen]bounds].size.width

#define deviceScreenHeight [[UIScreen mainScreen]bounds].size.height


@implementation SCMoveView

int moveTag = 0;


- (void)addKeyboardWillShowNotification {
    
    //增加监听，当键盘出现时获取消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
}


- (NSMutableArray*)theCoordinateYAndHeightOfTheSelectedTextField : (UITextField*)aTextField {
    
    //获取要编辑的textField的Y轴坐标和textField的高度
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:5];
    
    float textFieldCoordinateY = aTextField.frame.origin.y;
    
    float textFieldHeight = aTextField.frame.size.height;
    
    [array addObject:[NSString stringWithFormat:@"%f", textFieldCoordinateY]];
    
    [array addObject:[NSString stringWithFormat:@"%f", textFieldHeight]];
    
    return array;
    
    
}

- (void) moveTheViewUpForTheTextField : (UITextField*)aTextField onTheView : (UIView*)theView {  //开始编辑textField时上移整个View
    
    NSLog(@"y 坐标：%f", aTextField.frame.origin.y + aTextField.frame.size.height);
    
    NSLog(@"键盘：%f", deviceScreenHeight - _keyboardHeight);
    
    if(aTextField.frame.origin.y + aTextField.frame.size.height >= deviceScreenHeight - _keyboardHeight) {
        
        //设置动画的名字
        [UIView beginAnimations:@"Animation" context:nil];
        //设置动画的间隔时间
        [UIView setAnimationDuration:0.20];
        //??使用当前正在运行的状态开始下一段动画
        [UIView setAnimationBeginsFromCurrentState: YES];
        
        //获取View要移动的高度
        
        _viewMovedHeight = aTextField.frame.origin.y + aTextField.frame.size.height - _keyboardHeight + 30;
        
        //设置视图移动的位移
        theView.frame = CGRectMake(theView.frame.origin.x, theView.frame.origin.y - _viewMovedHeight, theView.frame.size.width, theView.frame.size.height);
        
        
        //设置动画结束
        [UIView commitAnimations];
        
        moveTag = 1;
        
    }
    
    
    
}



- (void) moveTheViewDownForTheTextField : (UITextField*)aTextField onTheView : (UIView*)theView {  //结束编辑TextField时下移整个View
    
    
    
    if(moveTag == 1) {
        
        //设置动画的名字
        [UIView beginAnimations:@"Animation" context:nil];
        //设置动画的间隔时间
        [UIView setAnimationDuration:0.20];
        //??使用当前正在运行的状态开始下一段动画
        [UIView setAnimationBeginsFromCurrentState: YES];
        //设置视图移动的位移
        theView.frame = CGRectMake(theView.frame.origin.x, theView.frame.origin.y + _viewMovedHeight, theView.frame.size.width, theView.frame.size.height);
        //设置动画结束
        [UIView commitAnimations];
        
        moveTag = 0;
    }
    
    
}


- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    
    _keyboardHeight = keyboardRect.size.height;  //获取出现的键盘的高度
    
    NSLog(@"键盘高度是  %f",_keyboardHeight);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
