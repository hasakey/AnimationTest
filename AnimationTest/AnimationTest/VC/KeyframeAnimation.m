//
//  KeyframeAnimation.m
//  AnimationTest
//
//  Created by 喂！ on 2018/12/19.
//  Copyright © 2018年 well. All rights reserved.
//

#import "KeyframeAnimation.h"

@interface KeyframeAnimation ()

@end

@implementation KeyframeAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //沿着轨迹运动
//    UIView *tempView = [UIView new];
//    tempView.frame = CGRectMake(50, 100, 250, 500);
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    //起始点
    [bezierPath moveToPoint:CGPointMake(50, 667/2)];
    //结束点、两个控制点
    [bezierPath addCurveToPoint:CGPointMake(330, 667/2) controlPoint1:CGPointMake(125, 200) controlPoint2:CGPointMake(185, 450)];
    
    UIView *animView = [UIView new];
    animView.frame = CGRectMake(50, 50, 70, 70);
    animView.backgroundColor = [UIColor redColor];
    [self.view addSubview:animView];
    
    CAKeyframeAnimation *orbitAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    orbitAnim.duration = 5;
    orbitAnim.path = bezierPath.CGPath;
    orbitAnim.calculationMode = kCAAnimationPaced;
    orbitAnim.fillMode = kCAFillModeForwards;
    orbitAnim.repeatCount = HUGE;
    orbitAnim.rotationMode = kCAAnimationRotateAutoReverse;
    [animView.layer addAnimation:orbitAnim forKey:@"orbitAnim"];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5f;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
}



@end
