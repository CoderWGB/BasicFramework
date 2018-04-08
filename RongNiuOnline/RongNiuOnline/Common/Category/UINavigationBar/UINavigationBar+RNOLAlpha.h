//
//  UINavigationBar+RNOLAlpha.h
//  RongNiuOnline
//
//  Created by 王贵彬 on 2018/4/8.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (RNOLAlpha)

	// 分类的作用  可以添加方法 添加属性
@property (nonatomic , strong)UIView *alphaView;
	// 提供一个渐变透明的方法
- (void)changeNavAlphaWithColor:(UIColor *)color;

@end
