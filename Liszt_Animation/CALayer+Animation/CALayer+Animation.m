//
//  CALayer+Animation.m
//  Liszt_Animation
//
//  Created by Lester on 16/10/11.
//  Copyright © 2016年 Liszt高级研发群:98787555. All rights reserved.
//

#import "CALayer+Animation.h"

@implementation CALayer (Animation)
-(CATransition *)transitionWithAnimationType:(AnimationType)animationType subType:(AnimationSubType)subType curve:(MediaTimingFunction)curve duration:(CGFloat)duration{
    NSString *key = @"transition";
    if([self animationForKey:key]!=nil){
        [self removeAnimationForKey:key];
    }
    CATransition *transition=[CATransition animation];
    /** 动画时长*/
    transition.duration=duration;
    /** 动画类型*/
    transition.type=[self animaTypeWithTransitionType:animationType];
    /** 动画方向*/
    transition.subtype=[self animaSubtype:subType];
    /** 缓动函数*/
    transition.timingFunction=[CAMediaTimingFunction functionWithName:[self curve:curve]];
    /** 完成动画删除*/
    transition.removedOnCompletion = YES;
    [self addAnimation:transition forKey:key];
    return transition;
}

-(NSString *)curve:(MediaTimingFunction)curve{
    /** 曲线数组*/
    NSArray *funcNames=@[kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionLinear];
    return [self objFromArray:funcNames index:curve];
}

-(NSString *)animaSubtype:(AnimationSubType)subType{
    /** 设置转场动画的方向*/
    NSArray *subtypes=@[kCATransitionFromLeft,kCATransitionFromRight,kCATransitionFromTop,kCATransitionFromBottom];
    return [self objFromArray:subtypes index:subType];
}

-(NSString *)animaTypeWithTransitionType:(AnimationType)type{
    
    /** 设置转场动画的类型*/
    NSArray *animArray=@[@"cube",@"suckEffect",@"oglFlip",@"rippleEffect",@"pageCurl",@"pageUnCurl",kCATransitionFade,kCATransitionPush,kCATransitionReveal,kCATransitionMoveIn];
    return [self objFromArray:animArray index:type];
}

-(id)objFromArray:(NSArray *)array index:(NSUInteger)index{
    return array[index];
}
@end
