//
//  RNOLBaseRequest.h
//  RongNiuOnline
//
//  Created by apple on 2018/3/30.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RNOLBaseRequest ;

@protocol RNNetworkRequestDelegate <RNOLBaseProtocol>

- (void)GetRequestWithParameters:(NSDictionary<NSString*,id> *)parameters
                         callBack:(void(^)(id resultData,NSError *error))callBack;

- (void)PostRequestWithParameters:(NSDictionary<NSString*,id> *)parameters
                     callBack:(void(^)(id resultData,NSError *error))callBack;

- (void)UploadRequestParameters:(NSDictionary<NSString*,id> *)parameters
                       fileData:(NSData *)fileData
                       progress:(void(^)(NSString *progress))progressBlock
                       callBack:(void(^)(id resultData,NSError *error))callBack;
@end


@protocol RNNetworkServerHostDelegate <RNOLBaseProtocol>

- (NSString *)serverHost;
- (NSString *)webHost;

@end


@interface RNOLBaseRequest : NSObject<RNNetworkRequestDelegate,RNNetworkServerHostDelegate>

//是否允许重复相同的请求,默认YES 允许
@property (nonatomic,assign) BOOL allowRepeatSameRequestArgs;
//是否允许缓存当前网络请求,默认NO 不缓存
@property (nonatomic,assign) BOOL allowRequestCache;

/// 写一些共用的参数
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSString *methodName;
@property (nonatomic,copy) NSString *page;
@property (nonatomic,copy) NSString *pageSize;

@end








