//
//  OuterGlowTextField.h
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/25/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OuterGlowTextField : UITextField
{
    CGFloat cornerRadius;
    CGFloat borderWidth;
    UIColor *borderColor;
    
    UIColor *lightColor;
    CGFloat lightWidth;
    UIColor *lightBorderColor;
}

/*
 *@param 初始化自定义的输入框
 *@[in]frame:输入框的框架
 *@[in]radius:圆角半径
 *@[in]tempBorderWidth:边框宽度
 *@[in]tempBorderColor:边框颜色，非编辑状态下
 *@[in]tempLightColor:编辑状态下，边框颜色
 *@[in]tempLightWidth:编辑状态下，边框宽度
 *@[in]tempLightBorderColor:编辑状态下，边框发光的颜色
 */
- (id)initWithFrame:(CGRect)frame
       cornerRadius:(CGFloat)radius
        borderWidth:(CGFloat)tempBorderWidth
        borderColor:(UIColor *)tempBorderColor
         lightColor:(UIColor *)tempLightColor
         lightWidth:(CGFloat)tempLightWidth
   lightBorderColor:(UIColor *)tempLightBorderColor;
@end
