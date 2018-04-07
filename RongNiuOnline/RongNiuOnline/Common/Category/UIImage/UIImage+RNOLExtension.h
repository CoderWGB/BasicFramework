//
//  UIImage+RNOLExtension.h
//  RongNiuOnline
//
//  Created by apple on 2018/4/3.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RNOLExtension)

///MARK:-生成纯色图片
+ (UIImage *)createImageWithColor:(UIColor *)color;

#pragma mark - 指定宽度按比例缩放
- (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth ;

//拉伸图片
- (UIImage *)stretchableImage;

- (UIImage*) imageBlackToTransparent:(UIImage*) image;

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;

+(UIImage *) reSizeImage:(UIImage *)image toSize:(CGSize)reSize;


@end
