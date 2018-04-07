//
//  RNOLBaseRequest.m
//  RongNiuOnline
//
//  Created by apple on 2018/3/30.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLBaseRequest.h"
#import "RNOLNetworkManager.h"

@interface RNOLBaseRequest()

@property (nonatomic,strong) NSDictionary *paramsDict;

@end

@implementation RNOLBaseRequest

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.allowRequestCache = NO;
		self.allowRepeatSameRequestArgs = YES;
	}
	return self;
}

- (void)GetRequestWithParameters:(NSDictionary<NSString*,id> *)parameters
                        callBack:(void(^)(id resultData,NSError *error))callBack{
    NSLog(@"*******接口:*******\n\n %@ \n\n*******请求参数:*******\n\n %@",[self serverHost],parameters);
		self.paramsDict = parameters;
	if(!self.allowRepeatSameRequestArgs && self.paramsDict == parameters) return;

    [[RNOLNetworkManager shareManager] GET:  [self serverHost]  parameters: parameters complationHandle:^(id responseObject, NSError *error) {
        NSLog(@"*******服务端返回数据:*******\n\n %@ \n\n*******错误信息:*******\n\n %@",responseObject,error);
        callBack(responseObject,error);
    }];
}

- (void)PostRequestWithParameters:(NSDictionary<NSString*,id> *)parameters
                     callBack:(void(^)(id resultData,NSError *error))callBack{
    NSLog(@"*******接口:********\n\n %@ \n\n********请求参数:*************\n\n %@",[self serverHost],parameters);
	self.paramsDict = parameters;
	if(!self.allowRepeatSameRequestArgs && self.paramsDict == parameters) return;
    [[RNOLNetworkManager shareManager] POST:  [self serverHost]  parameters: parameters complationHandle:^(id responseObject, NSError *error) {
        NSLog(@"服务端返回数据:\n\n %@ \n\n错误信息:\n\n %@",responseObject,error);
        callBack(responseObject,error);
    }];
}

- (void)UploadRequestParameters:(NSDictionary<NSString*,id> *)parameters
                       fileData:(NSData *)fileData
                       progress:(void(^)(NSString *progress))progressBlock
                       callBack:(void(^)(id resultData,NSError *error))callBack{
    NSLog(@"*******接口:*******\n %@ \n *******请求参数:*******\n %@",[self serverHost],parameters);
    [[RNOLNetworkManager shareManager] uploadFileWithURL: [self serverHost] parameters: parameters fileData: fileData progress:^(NSString *uploadProgress) {
        !progressBlock? : progressBlock(uploadProgress);
    } complationHandle:^(id responseObject, NSError *error) {
        !callBack? : callBack(responseObject,error);
    }];
}


- (NSString *)webHost{
    return [RNOLServerHostManager currentWebHost];
}

- (NSString *)serverHost{
    return kWGB_STR(@"%@/%@",[RNOLServerHostManager currentServerHost],self.methodName);
}


@end
