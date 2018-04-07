//
//  RNOLProgressHUD.h
//  RongNiuOnline
//
//  Created by 王贵彬 on 2018/4/7.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MBProgressHUD;
@interface RNOLProgressHUD : NSObject

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showAlert:(NSString *)alert;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
