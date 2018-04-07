//
//  UIImageView+RNOLExtra.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "UIImageView+RNOLExtra.h"

@implementation UIImageView (RNOLExtra)

- (void)wgb_setImageWithUrlString:(NSString *)imageUrlStr placehoder:(NSString *)imageNameStr{
    if (!imageUrlStr.length) {
        return;
    }
    NSURL *imageURL = [NSURL URLWithString: imageUrlStr];
    UIImage *placehorderImage = [UIImage imageNamed: imageNameStr];
    
    if (!imageNameStr.length) {
        placehorderImage = nil;
    }
    [self sd_setImageWithURL:imageURL placeholderImage: placehorderImage options:SDWebImageRefreshCached];
}

@end
