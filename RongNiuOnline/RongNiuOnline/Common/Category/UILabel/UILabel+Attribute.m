//
//  UILabel+Attribute.m
//  DDYS
//
//  Created by 李树文 on 15/12/29.
//  Copyright © 2015年 lysw. All rights reserved.
//

#import "UILabel+Attribute.h"

@implementation UILabel (Attribute)

- (void)moreColorWithAttributeString:(NSString *)str color:(UIColor *)color{
    NSString *initialStr = self.text;
    NSMutableAttributedString * attributeStr=[[NSMutableAttributedString alloc]initWithString:initialStr];
    NSRange range=[initialStr rangeOfString:str];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attributeStr;
}

- (void)moreColorFromIndex:(NSInteger)from color:(UIColor *)color{
    /**  初始字符串  */
    NSString *initialStr = self.text;
    /**  创建富文本对象  */
    NSMutableAttributedString * attributeStr=[[NSMutableAttributedString alloc]initWithString:initialStr];
    /**  计算文本范围  */
    NSRange range = NSMakeRange(from, initialStr.length - from);
    /**  设置文本范围和颜色  */
    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attributeStr;
}



- (UILabel *)cloneLabWithFrame:(CGRect)frame
                 textAlignment:(NSTextAlignment)alignment
                          font:(UIFont *)font
                     textColor:(UIColor *)textColor
                          text:(NSString *)text
               backgroundColor:(UIColor *)bgColor{
    UILabel *cloneLab = [[UILabel alloc] init];
    cloneLab.frame = frame;
    cloneLab.textAlignment = alignment;
    cloneLab.font = font;
    cloneLab.textColor = textColor;
    cloneLab.text = text;
    cloneLab.backgroundColor = bgColor;
    return cloneLab;
}






@end
