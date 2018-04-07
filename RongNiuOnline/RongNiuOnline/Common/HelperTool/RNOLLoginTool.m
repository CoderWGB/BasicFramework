//
//  RNOLLoginTool.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLLoginTool.h"

static NSString *const kUserIDKey = @"kUserIDKey";
static NSString *const kUserTokenKey = @"kUserTokenKey";


@implementation RNOLLoginTool

+ (void)setUserID:(NSString *)user_id{
    [kUserDefaults setObject:user_id forKey:kUserIDKey];
    [kUserDefaults synchronize];
}
+ (NSString *)user_id {
    return  [kUserDefaults objectForKey: kUserIDKey];
}

+ (void)setToken:(NSString *)token{
    [kUserDefaults setObject: token forKey: kUserTokenKey];
    [kUserDefaults synchronize];
}
+ (NSString *)token{
    return [kUserDefaults objectForKey: kUserTokenKey];
}






@end
