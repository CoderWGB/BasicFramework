//
//  MacroConstantsHeader.h
//  RongNiuOnline
//
//  Created by apple on 2018/3/30.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#ifndef MacroConstantsHeader_h
#define MacroConstantsHeader_h


/// 网关域名
#define kServerValue 1     // 1.正式服务器,2.测试服务器,3.后台人员固定主机，

#if kServerValue   == 1
#define kBaseURL            @"https://www.rongniu360.com/api"
#define kServerDomain @"https://www.rongniu360.com"

#elif kServerValue == 2
#define kBaseURL            @"http://39.108.128.90:81/api"
#define kServerDomain @"http://39.108.128.90:81"

#elif kServerValue == 3
#define kBaseURL            @"http://192.168.20.129:8096/abao/api"
#define kServerDomain @"http://192.168.20.129:8096"
#else
#define kBaseURL @"http://www.abao.com:80/api"
#endif


///MARK-: 一些便捷的宏

#ifdef DEBUG
//Debug 阶段打印
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#define WGBLog(...)  NSLog(__VA_ARGS__)
#else
//发布阶段 取消打印
#define NSLog(...)
#endif
/**  打印方法名  */
#define LogFunc  NSLog(@"%s",__func__);


/// 字符串简单拼接用法
//- (NSString *)responseStatusCode {
//    return _S(@"%zd",self.response.statusCode);
//}
#ifndef kWGB_STR
#define kWGB_STR(str,...) [NSString stringWithFormat:str,##__VA_ARGS__]
#endif


///MARK:- 系统弹出框一个按钮或者两个按钮的便利宏
#define kWGBAlertMessageTip(tipTitle,msg,cancelTitle,confirmTitle,cancelBlock,confirmBlock) \
UIAlertController *aletVC = [UIAlertController alertControllerWithTitle:tipTitle message:msg preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle: cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {\
!cancelBlock?:cancelBlock();\
}];\
UIAlertAction *okAction = [UIAlertAction actionWithTitle: confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {\
!confirmBlock? : confirmBlock();\
}];\
!cancelTitle.length?  : [aletVC addAction: cancelAction];\
!confirmTitle.length? : [aletVC addAction: okAction];\
[kRootVC presentViewController:aletVC animated:aletVC completion:^{\
\
}];\

///弹出一条信息 用于调试弹窗
#define kAlertShowMessage(msg) \
dispatch_block_t cancelBlock = ^{}; \
dispatch_block_t confirmBlock = ^{}; \
kWGBAlertMessageTip(@"温馨提示",(msg),@"确认",@"",cancelBlock,confirmBlock);\


///适配iOS 11 scrollView向下偏移
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


///判断字符串为空  YES 为空  NO不为空
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)

// 检测block是否可用
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

/// 防空值判断
#define VerifyValue(value)\
({id tmp;\
if ([value isKindOfClass:[NSNull class]])\
tmp = nil;\
else\
tmp = value;\
tmp;\
})\

//View圆角和加边框 对象,圆角大小,边框宽度,颜色
#define ViewBorderRadius(View,Radius,Width,Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View圆角 对象,圆角大小
#define ViewRadius(View,Radius)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


///MARK:- 获取实例或者参数------------------------

/// 拿到通知中心实例
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//本地存储UserDefault
#define kUserDefaults  [NSUserDefaults standardUserDefaults]

///AppDeleagte
#define kAppdelegate  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

///关键盘
#define kCloseKeyboard       [[UIApplication sharedApplication].keyWindow endEditing:YES]

///RootVC
#define kRootVC  [UIApplication sharedApplication].keyWindow.rootViewController

//当前window
#define kCurrentWindow [[UIApplication sharedApplication].windows firstObject]

//app名称
#define kAppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

//app版本
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


//获取当前系统版本
#define kCurrentSystemVersion  [ [ [UIDevice currentDevice]  systemVersion ] floatValue]

//加载比较大的图片 优化性能
#define kLoadImagae(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
//定义UIImage对象
#define kImageNamed(_pointer)  [UIImage imageNamed:(_pointer)］
//获取图片宽高
#define kImgWidth(img)        ((img).size.width)
#define kImgHeight(img)       ((img).size.height)

//获取一段时间间隔  起点  终点
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

//设置字体
#define kPingFang(F)  [UIFont fontWithName:@"PingFang SC" size:(F)]
#define KFontSize(A)  [UIFont systemFontOfSize:A]
#define kFont(a) [UIFont fontWithName:@"Avenir-Light" size:(a)]


///MARK:- 布局与适配相关------------------------

//获取view的frame
#define KGetFrame(view)   view.frame

//获取view的size
#define  KGetSize(view)     view.frame.size

//获取view的位置起始点
#define KGetOrigin(view)   view.frame.origin

// 物理屏幕宽度
#define KWIDTH  [[UIScreen mainScreen]bounds].size.width
// 物理屏幕高度
#define KHIGHT [[UIScreen mainScreen]bounds].size.height

// 以iphone6为基准 宽度比例
#define kIphone6ScaleWidth  (KWIDTH/375.0f)

// 高度比例
#define kIphone6ScaleHeight KHIGHT/667.0

// 根据ip6的屏幕来拉伸
#define kRateValue(with) ((with)*(KWIDTH/375.0f))


// View 坐标(x,y)和宽高(width,height)
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height

#define MinX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define MinY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define MidX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define MidY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define MaxX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度

//状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏+状态栏
#define kNavBarHeight   (44.0 + kStatusBarHeight)
//tabBar高度
#define kTabBarHeight  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define IS_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_Iphone_X  (IS_Iphone && KHIGHT == 812.0)
#define BottomHeight IS_Iphone_X? 34 : 0


#define IS_Iphone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone7p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone8p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)



///MARK:- 颜色相关------------------------
//RGB
#define RGB(R,G,B)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0f]
//颜色 RGBA
#define RGBA(R, G, B, A)   [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
//白色
#define KWhiteColor  [UIColor whiteColor]
//黑色
#define KBlackColor  [UIColor blackColor]
//红色
#define KRedColor  [UIColor redColor]
//橙色
#define KOrangeColor  [UIColor orangeColor]

//十六进制颜色设置 hex是整型
#define UIColorHex(hex)             [UIColor \
colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 \
green:((float)((hex & 0xFF00) >> 8))/255.0 \
blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

// 底部背景颜色
#define kBgColor    RGB(247,248,249)

//随机色
#define KRandomColor  [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f]



///MARK:- property属性快速声明
// 字符串属性
#define PropertyString(s) \
@property (nonatomic,copy) NSString *s;
// int
#define PropertyNSInteger(s) \
@property (nonatomic,assign) NSInteger s;
//float
#define PropertyFloat(s) \
@property (nonatomic,assign) float s;
//NSNumber
#define PropertyNSNumber(s) \
@property (nonatomic,strong) NSNumber *s;
//字典
#define PropertyNSDictionary(s) \
@property (nonatomic,strong) NSDictionary *s;
//可变字典
#define PropertyNSMutableDictionary(s) \
@property (nonatomic,strong) NSMutableDictionary *s;
//数组
#define PropertyNSArray(s) \
@property (nonatomic,strong) NSArray *s;
//可变数组
#define PropertyNSMutableArray(s) \
@property (nonatomic,strong) NSMutableArray *s;


///MARK:- 沙盒目录路径
//获取temp
#define kPathTempPath NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


/// MARK:- 判断真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif




#endif /* MacroConstantsHeader_h */
