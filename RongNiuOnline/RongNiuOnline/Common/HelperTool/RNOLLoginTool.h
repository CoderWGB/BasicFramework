//
//  RNOLLoginTool.h
//  RongNiuOnline
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RNOLLoginTool : NSObject

+ (void)setUserID:(NSString *)user_id;
+ (NSString *)user_id ;

+ (void)setToken:(NSString *)token;
+ (NSString *)token;


@end
