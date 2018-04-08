//
//  RNOLHomePageViewController.m
//  RongNiuOnline
//
//  Created by apple on 2018/3/30.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLHomePageViewController.h"
#import "RNOLHomeRequest.h"


@interface RNOLHomePageViewController ()<TBActionSheetDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *bgScrollView;
@property (nonatomic,strong) UIButton *back ;
@property (nonatomic,strong) 	UILabel *lab  ;
@end

@implementation RNOLHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KRandomColor;
	UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -kNavBarHeight, KWIDTH , KHIGHT+kNavBarHeight)];
	sv.contentSize = CGSizeMake(KWIDTH, KHIGHT*2);
	 sv.delegate = self;
	[self.view addSubview: sv];
	self.bgScrollView = sv;
	[self setupNavgationBar];

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

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
		//去掉导航栏与self.view中间的那根线
	[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
	UINavigationBar * navigationBar = [UINavigationBar appearance];
	navigationBar.backgroundColor = [UIColor clearColor];
	navigationBar.barTintColor = [UIColor clearColor];
}

- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	UINavigationBar * navigationBar = [UINavigationBar appearance];
	navigationBar.barTintColor = [UIColor orangeColor];
	navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize: 15]};
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


- (void)setupNavgationBar{
		// 返回按钮
	UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
	[back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];;
	[back setTitle:@"<" forState:UIControlStateNormal];
//	[back addTarget:self action:@selector(backPreviousVC) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
	self.navigationItem.leftBarButtonItem = backItem;
	self.back = back;

		// 标题
	UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
	lab.text =  @"凤舞九天";
	lab.font = [UIFont boldSystemFontOfSize:18];
	lab.textColor = [UIColor whiteColor];
	lab.textAlignment = NSTextAlignmentCenter;
	self.navigationItem.titleView = lab;
	self.lab = lab;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	CGFloat offsetY = scrollView.contentOffset.y;
	UIColor *color = [UIColor blueColor];
	if (offsetY > kNavBarHeight) {
		if (offsetY > kNavBarHeight*2) {
			offsetY = kNavBarHeight*2;
		}
		CGFloat alpha = (offsetY - kNavBarHeight)/kNavBarHeight;
		[self.navigationController.navigationBar changeNavAlphaWithColor:[color colorWithAlphaComponent:alpha]];
		self.back.titleLabel.alpha = alpha;
		self.navigationItem.titleView.alpha = alpha;
	}else{
		[self.navigationController.navigationBar changeNavAlphaWithColor:[color colorWithAlphaComponent:0.0]];
		self.back.titleLabel.alpha = 0.0;
		self.navigationItem.titleView.alpha = 0.0;
	}
}

@end
