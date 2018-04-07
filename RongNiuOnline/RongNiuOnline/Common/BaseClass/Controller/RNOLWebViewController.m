//
//  RNOLWebViewController.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLWebViewController.h"
#import <WebKit/WebKit.h>

@interface RNOLWebViewController ()

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) NSMutableURLRequest *request;
@property (nonatomic,copy) NSString *navTitle;
@property (nonatomic,copy) NSString *url;

@end

@implementation RNOLWebViewController

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , KHIGHT-kNavBarHeight)];
        adjustsScrollViewInsets_NO(_webView.scrollView, self);
        _webView.height -= BottomHeight;
        [self.view addSubview: _webView];
    }
    return _webView;
}

- (NSMutableURLRequest *)request{
    if (!_request) {
        _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString: self.url]];
    }
    return _request;
}

- (instancetype)initWithURLString:(NSString *)urlStr navgationBarTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.url = urlStr;
        self.navTitle = title;
        [self.webView loadRequest: self.request];
    }
    return self;
}

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
                             title:(NSString *)title {
    self = [super init];
    if (self) {
        self.navTitle = title;
        NSString *body = [parametersDict yy_modelToJSONString];
        if (requestType == RNOLWebRequestTypeGET) {
            self.url = [NSString stringWithFormat:@"%@?%@",url,body];
        }else{
            [self.request setHTTPMethod: @"POST"];
            [self.request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
        }
        [self.webView loadRequest: self.request];
     }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.navTitle;
    self.view.backgroundColor = [UIColor whiteColor];

}



@end
