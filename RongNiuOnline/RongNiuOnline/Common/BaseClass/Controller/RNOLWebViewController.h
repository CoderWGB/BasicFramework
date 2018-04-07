//
//  RNOLWebViewController.h
//  RongNiuOnline
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,RNOLWebRequestType) {
    RNOLWebRequestTypeGET,
    RNOLWebRequestTypePOST
};

@interface RNOLWebViewController : UIViewController

- (instancetype)initWithURLString:(NSString *)urlStr navgationBarTitle:(NSString *)tittle ;

/**
 统一网页接口
 @param requestType 请求的方法 GET或者POST
 @param parametersDict 参数字典
 @param url 网址
 @param title 标题
 @return 网页实例
 */
- (instancetype)initWithMethodType:(RNOLWebRequestType )requestType
                        parameters:(NSDictionary *)parametersDict
                               url:(NSString *)url
                             title:(NSString *)title ;

@end
