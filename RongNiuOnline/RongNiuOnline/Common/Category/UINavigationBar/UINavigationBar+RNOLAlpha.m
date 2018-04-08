//
//  UINavigationBar+RNOLAlpha.m
//  RongNiuOnline
//
//  Created by 王贵彬 on 2018/4/8.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "UINavigationBar+RNOLAlpha.h"
#import <objc/runtime.h>
static char *AlphaV;

@implementation UINavigationBar (RNOLAlpha)

-(void)setAlphaView:(UIView *)alphaView{
	objc_setAssociatedObject(self, &AlphaV, alphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)alphaView{
	return objc_getAssociatedObject(self, &AlphaV);
}

-(void)changeNavAlphaWithColor:(UIColor *)color{
	if (!self.alphaView) {
			//设置图片
		[self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
			//创建AlphaView
		self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, KWIDTH, kNavBarHeight)];

			//插入到NavigationBar的上面
		[self insertSubview:self.alphaView atIndex:0];
	}
	[self.alphaView setBackgroundColor:color];
}


@end
