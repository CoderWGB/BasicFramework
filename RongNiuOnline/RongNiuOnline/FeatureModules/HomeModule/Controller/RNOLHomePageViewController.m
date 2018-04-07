//
//  RNOLHomePageViewController.m
//  RongNiuOnline
//
//  Created by apple on 2018/3/30.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLHomePageViewController.h"
#import "RNOLHomeRequest.h"


@interface RNOLHomePageViewController ()<TBActionSheetDelegate>



@end

@implementation RNOLHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KRandomColor;
//    RNOLHomeRequest * request =  [[RNOLHomeRequest alloc] init];
//    id params = [request yy_modelToJSONObject];
//    [request PostRequestWithParameters: params callBack:^(id resultData, NSError *error) {
//
//
//    }];
//
//    kAlertShowMessage([RNOLServerHostManager currentServerHostEnvironmentName]);
//    [self skipWebPageWithHtmlLink:@"https://www.baidu.com" title:@"百度一下"];


#ifdef DEBUG
    [self addDebugView];
#else
    NSLog(@"6666");
#endif

}


#pragma mark- 调试工具
- (void)addDebugView{
    WMDragView *debugView = [[WMDragView alloc] initWithFrame:CGRectMake(KWIDTH - 80 , KHIGHT - kTabBarHeight - 80 , 70, 70)];
    ViewBorderRadius(debugView, 35, 2, KWhiteColor);
    debugView.isKeepBounds = YES;
    debugView.button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [debugView.button setTitleColor:KWhiteColor forState:UIControlStateNormal];
    [debugView.button setTitle:@"Debug" forState:UIControlStateNormal];
    debugView.backgroundColor = [UIColor blackColor];
    [debugView setLayerShadow: KOrangeColor  offset: CGSizeMake(-1, 1)  radius: 5];
    [kRootVC.view addSubview: debugView];
    debugView.clickDragViewBlock = ^(WMDragView *dragView){
        TBActionSheet *sheet = [[TBActionSheet alloc] initWithTitle:@"切换环境" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"线上环境" otherButtonTitles:@"测试环境",@"dev环境", nil];
        [sheet show];
    };
}

- (void)actionSheet:(TBActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 3) {//取消
        return ;
    }
    // 0. 线上 1.测试 2.dev
    RNOLServerHostEnvironmentType serverType = (RNOLServerHostEnvironmentType)buttonIndex;
    [RNOLServerHostManager setAPIServerHostType: serverType];
    exit(0); //退出程序
}

@end
