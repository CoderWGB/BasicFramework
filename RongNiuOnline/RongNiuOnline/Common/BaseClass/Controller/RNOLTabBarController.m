//
//  RNOLTabBarController.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLTabBarController.h"
#import "RNOLNavigationController.h"
#import "RNOLHomePageViewController.h"

@interface RNOLTabBarController ()

@end

@implementation RNOLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTabSubViewControllers];
    self.tabBar.tintColor = [UIColor orangeColor];
    [self.tabBar setBackgroundImage: [UIImage imageNamed:@"tabbar_bg"]];
    //去掉tabBar顶部线条
    [UITabBar appearance].clipsToBounds = YES;
}

- (void)createTabSubViewControllers{
    RNOLHomePageViewController *homeVC = [[RNOLHomePageViewController alloc] init];
    [self createNavgationViewControllerWithSubViewController: homeVC title: @"首页" image:@"tabHomeNormal" selectedImage:@"tabHomeSelected"];
    
    RNOLHomePageViewController *blogVC = [[RNOLHomePageViewController alloc] init];
    [self createNavgationViewControllerWithSubViewController: blogVC title: @"理财" image:@"tabFinancialManagementNormal" selectedImage:@"tabFinancialManagementSelected"];
    
    RNOLHomePageViewController *threeVC = [[RNOLHomePageViewController alloc] init];
    [self createNavgationViewControllerWithSubViewController: threeVC title: @"基金" image:@"tabMoreNormal" selectedImage:@"tabMoreSelected"];
    
    RNOLHomePageViewController *fourVC = [[RNOLHomePageViewController alloc] init];
    [self createNavgationViewControllerWithSubViewController: fourVC title: @"我的" image:@"tabPropertyNormal" selectedImage:@"tabPropertySelected"];

}

- (void )createNavgationViewControllerWithSubViewController:(UIViewController *)subVC
                                                      title:(NSString *)title
                                                      image:(NSString *)image
                                              selectedImage:(NSString *)selectedImage{
    RNOLNavigationController *wgbNavVC = [[RNOLNavigationController alloc] initWithRootViewController: subVC];
    subVC.navigationItem.title = title;
    subVC.tabBarItem.title = title;
    subVC.tabBarItem.image = [UIImage imageNamed: image];
    subVC.tabBarItem.selectedImage = [[UIImage imageNamed: selectedImage] imageWithTintColor: [UIColor blackColor]];
    [self addChildViewController: wgbNavVC];
}

@end
