//
//  UIButton+RNOLExtension.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "UIButton+RNOLExtension.h"
#import <objc/runtime.h>

static const void *UIButtonBlockKey = &UIButtonBlockKey;


@implementation UIButton (RNOLExtension)

- (void)wgb_setImageWithUrlString:(NSString *)imageUrlStr placehoder:(NSString *)imageNameStr forState:(UIControlState )state{
    if (!imageUrlStr.length) {
        return;
    }
    NSURL *imageURL = [NSURL URLWithString: imageUrlStr];
    UIImage *placehorderImage = [UIImage imageNamed: imageNameStr];
    
    if (!imageNameStr.length) {
        placehorderImage = nil;
    }

    [self sd_setImageWithURL:imageURL forState: state placeholderImage: placehorderImage options:SDWebImageRefreshCached];
}


- (void)wgb_setBackgroundImageWithUrlString:(NSString *)imageUrlStr placehoder:(NSString *)imageNameStr forState:(UIControlState )state{
    if (!imageUrlStr.length) {
        return;
    }
    NSURL *imageURL = [NSURL URLWithString: imageUrlStr];
    UIImage *placehorderImage = [UIImage imageNamed: imageNameStr];
    
    if (!imageNameStr.length) {
        placehorderImage = nil;
    }
    
    [self sd_setBackgroundImageWithURL: imageURL forState: state placeholderImage: placehorderImage options:SDWebImageRefreshCached];
}


- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    UIImage *backgroundImage = [UIImage createImageWithColor: backgroundColor];
    [self setBackgroundImage: backgroundImage forState: state];
}


#pragma mark- 按钮点击Block
-(void)addButtonActionClickHandler:(buttonClickActionBlock)clickHandlerr{
    objc_setAssociatedObject(self, UIButtonBlockKey, clickHandlerr, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionClicked:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)actionClicked:(UIButton *)btn{
    buttonClickActionBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}


#pragma mark- 设置按钮额外点击区域
/**
 *  @brief  设置按钮额外点击区域
 */
- (UIEdgeInsets)touchAreaInsets
{
    return [objc_getAssociatedObject(self, @selector(touchAreaInsets)) UIEdgeInsetsValue];
}

- (void)setTouchAreaInsets:(UIEdgeInsets)touchAreaInsets
{
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets touchAreaInsets = self.touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}



#pragma mark  倒计时按钮
/**
 *  @brief  倒计时按钮
 *
 *  @param timeout 时间
 *  @param tittle           tittle
 *  @param waitTittle           waitTittle
 */
-(void)addStartTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);
    
}

- (void)dianZanAnimation{
    CAKeyframeAnimation *clickAnima = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    clickAnima.values = @[@(0.1),@(1.0),@(1.5)];
    clickAnima.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    clickAnima.calculationMode = kCAAnimationLinear;
    clickAnima.removedOnCompletion = YES;
    [self.layer addAnimation:clickAnima forKey:@"commendAnimation"];
}



@end
