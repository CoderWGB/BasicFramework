//
//  UIViewController+RNOLExtension.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "UIViewController+RNOLExtension.h"

@implementation UIViewController (RNOLExtension)


///web
- (void)skipWebPageWithHtmlLink:(NSString *)url title:(NSString *)title{
    RNOLWebViewController *webVC = [[RNOLWebViewController alloc] initWithURLString: url navgationBarTitle: title];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)skipWebPageWithHtmlLink:(NSString *)url title:(NSString *)title methodType:(RNOLWebRequestType)type parmsDict:(NSDictionary *)paramsDict{
    RNOLWebViewController *webVC = [[RNOLWebViewController alloc] initWithMethodType: type parameters:paramsDict url:url title: title];
    [self.navigationController pushViewController:webVC animated:YES];
}


@end
