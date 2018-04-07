//
//  RNOLProgressHUD.m
//  RongNiuOnline
//
//  Created by 王贵彬 on 2018/4/7.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLProgressHUD.h"
#import "MBProgressHUD+MJ.h"

@implementation RNOLProgressHUD

+ (void)showSuccess:(NSString *)success toView:(UIView *)view{
	[MBProgressHUD showSuccess:success toView: view];
}
+ (void)showError:(NSString *)error toView:(UIView *)view{
	[MBProgressHUD showError: error toView: view];
}

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view{
	 return 	[MBProgressHUD showMessage: message toView: view];
}

+ (void)showSuccess:(NSString *)success{
	[MBProgressHUD showSuccess: success];
}
+ (void)showError:(NSString *)error{
	[MBProgressHUD showError: error];
}
+ (void)showAlert:(NSString *)alert{
	[MBProgressHUD showAlert: alert];
}

+ (MBProgressHUD *)showMessage:(NSString *)message{
  return 	[MBProgressHUD showMessage:message];
}
+ (void)hideHUDForView:(UIView *)view{
	[MBProgressHUD hideHUDForView: view];
}

+ (void)hideHUD{
	[MBProgressHUD hideHUD];
}

@end
