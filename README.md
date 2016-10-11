# Liszt-CALayerAnimation
###只是显示图片，这里用的是相对路径

<img src="https://github.com/LisztGitHub/Liszt-CALayerAnimation/blob/master/Liszt.gif?raw=true" />
# 
    //
    //  CALayer+Animation.h
    //  Liszt_Animation
    //
    //  Created by Lester on 16/10/11.
    //  Copyright © 2016年 Liszt高级研发群:98787555. All rights reserved.
    //

    #import <QuartzCore/QuartzCore.h>

    typedef enum : NSUInteger {
       /** 从左*/
       TransitionSubTypeFromLeft,
        /** 从右*/
        TransitionSubTypeFromRight,
        /** 从上*/
        TransitionSubTypeFromTop,
        /** 从下*/
        TransitionSubTypeFromBottom
    } AnimationSubType;

    typedef enum: NSUInteger{
        /** 立方体*/
        AnimationTypeCube,
        /** 吸收*/
        AnimationTypeSuckEffect,
        /** 上下翻转*/
        AnimationTypeOglFlip,
        /** 水波*/
        AnimationRippleEffect,
        /** 打开书本*/
        AnimationPageCurl,
        /** 关上书本*/
        AnimationPageUnCurl,
        /** 曲线*/
        AnimationFade,
        /** 推送*/
        AnimationPush,
        /** 揭开*/
        AnimationReveal,
        /** 移动*/
        AnimationMoveIn
    } AnimationType;

    typedef enum: NSUInteger{
       /** 默认*/
        MediaTimingFunctionDefault,
        /** 缓进*/
        MediaTimingFunctionEaseIn,
       /** 缓进缓出*/
        MediaTimingFunctionEaseInEaseOut,
        /** 缓出*/
        MediaTimingFunctionEaseOut,
        /** 线性*/
        MediaTimingFunctionLinear,
    }MediaTimingFunction;

    @interface CALayer (Animation)
    /**
    *  转场动画
    *
    *  @param animationType 转场动画类型
    *  @param subType  转动动画方向
    *  @param curve    转动动画曲线
    *  @param duration 转动动画时长
    *
    *  @return 转场动画实例
    */
    -(CATransition *)transitionWithAnimationType:(AnimationType)animationType subType:(AnimationSubType)subType curve:(MediaTimingFunction)curve duration:(CGFloat)duration;
    @end
