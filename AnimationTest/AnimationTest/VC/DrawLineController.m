//
//  DrawLineController.m
//  AnimationTest
//
//  Created by 喂！ on 2018/12/19.
//  Copyright © 2018年 well. All rights reserved.
//

#import "DrawLineController.h"

@interface DrawLineController ()

@end

@implementation DrawLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    //起始点
//    [path moveToPoint:CGPointMake(50, 667/2)];
//    //结束点、两个控制点
//    [path addCurveToPoint:CGPointMake(330, 667/2) controlPoint1:CGPointMake(125, 200) controlPoint2:CGPointMake(185, 450)];
//
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.duration = 5;
//    animation.fromValue = @(0);
//    animation.toValue = @(1);
//    animation.repeatCount = 100;
//
//    CAShapeLayer *layer = [CAShapeLayer new];
//    layer.strokeColor = [UIColor blackColor].CGColor;
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.path = path.CGPath;
//    layer.lineWidth = 2.0;
//    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
//    [self.view.layer addSublayer:layer];
    

    //画线

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    //起始点
    [bezierPath moveToPoint:CGPointMake(50, 667/2)];
    //结束点、两个控制点
    [bezierPath addCurveToPoint:CGPointMake(330, 667/2) controlPoint1:CGPointMake(125, 200) controlPoint2:CGPointMake(185, 450)];

    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];


    CABasicAnimation *pathAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnim.beginTime = 0.0;
    pathAnim.fromValue = @0;
    pathAnim.toValue = @1;
    pathAnim.duration = 5;
    pathAnim.repeatCount = LONG_MAX;
    pathAnim.autoreverses = true;
    pathAnim.fillMode = kCAFillModeForwards;
    [shapeLayer addAnimation:pathAnim forKey:@"pathAnim"];
    
}



@end
