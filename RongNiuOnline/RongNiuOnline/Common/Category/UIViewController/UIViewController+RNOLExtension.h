//
//  UIViewController+RNOLExtension.h
//  RongNiuOnline
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RNOLExtension)

///web 
- (void)skipWebPageWithHtmlLink:(NSString *)url title:(NSString *)title;
- (void)skipWebPageWithHtmlLink:(NSString *)url title:(NSString *)title methodType:(RNOLWebRequestType)type parmsDict:(NSDictionary *)paramsDict;

@end
