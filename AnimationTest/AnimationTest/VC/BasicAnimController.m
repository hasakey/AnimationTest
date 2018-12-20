//
//  BasicAnimController.m
//  AnimationTest
//
//  Created by 喂！ on 2018/12/19.
//  Copyright © 2018年 well. All rights reserved.
//

#import "BasicAnimController.h"

@interface BasicAnimController ()

@end

@implementation BasicAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**------------------------旋转动画-------------------------------------*/
    /**-----------------------x轴-------------------------------------*/
    UIView  *rorationViewX = [UIView new];
    rorationViewX.frame = CGRectMake(20, 100, 70, 70);
    rorationViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:rorationViewX];
    
    CABasicAnimation *rotationAnimX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimX.beginTime = 0.0;
    rotationAnimX.toValue = @(M_PI * 2);
    rotationAnimX.duration = 1.5;
    rotationAnimX.repeatCount = LONG_MAX;
    [rorationViewX.layer addAnimation:rotationAnimX forKey:@"rotationAnimX"];
    
    /**-----------------------y轴-------------------------------------*/
    UIView  *rorationViewY = [UIView new];
    rorationViewY.frame = CGRectMake(150, 100, 70, 70);
    rorationViewY.backgroundColor = [UIColor redColor];
    [self.view addSubview:rorationViewY];
    CABasicAnimation *rotationAnimY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimY.beginTime = 0.0;
    rotationAnimY.toValue = @(M_PI * 2);
    rotationAnimY.duration = 1.5;
    rotationAnimY.repeatCount = LONG_MAX;
    [rorationViewY.layer addAnimation:rotationAnimY forKey:@"rotationAnimY"];
    
    /**-----------------------z轴-------------------------------------*/
    UIView  *rorationViewZ = [UIView new];
    rorationViewZ.frame = CGRectMake(280, 100, 70, 70);
    rorationViewZ.backgroundColor = [UIColor redColor];
    [self.view addSubview:rorationViewZ];
    CABasicAnimation *rotationAnimZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimZ.beginTime = 0.0;
    rotationAnimZ.toValue = @(M_PI * 2);
    rotationAnimZ.duration = 1.5;
    rotationAnimZ.repeatCount = LONG_MAX;
    [rorationViewZ.layer addAnimation:rotationAnimZ forKey:@"rotationAnimZ"];
    
    /**------------------------移动动画-------------------------------------*/
    UIView  *moveView = [UIView new];
    moveView.frame = CGRectMake(20, 240, 70, 70);
    moveView.center = CGPointMake(40, 200);
    moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:moveView];
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.beginTime = 0.0;
    moveAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(40, 240)];
    moveAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 240)];
    moveAnim.duration = 1;
    moveAnim.repeatCount = LONG_MAX;
    moveAnim.autoreverses = true;
    [moveView.layer addAnimation:moveAnim forKey:@"moveAnim"];
    // 以下两句 控制View动画结束后，停留在动画结束的位置
    //        moveAnim.isRemovedOnCompletion = false
    //        moveAnim.fillMode = kCAFillModeForwards
    
    /**------------------------背景颜色-------------------------------------*/
    UIView  *colorView = [UIView new];
    colorView.frame = CGRectMake(20, 310, 70, 70);
    colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:colorView];
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.beginTime = 0.0;
    colorAnim.fromValue = CFBridgingRelease([UIColor redColor].CGColor);
    colorAnim.toValue = CFBridgingRelease([UIColor greenColor].CGColor);
    colorAnim.duration = 1;
    colorAnim.repeatCount = LONG_MAX;
    colorAnim.autoreverses = true;
    [colorView.layer addAnimation:colorAnim forKey:@"colorAnim"];
    
    /**------------------------内容变化动画-------------------------------------*/
    UIImageView  *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake(150, 310, 70, 70);
    imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:imageView];
    CABasicAnimation *contentsAnim = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnim.beginTime = 0.0;
    contentsAnim.toValue = CFBridgingRelease([UIImage imageNamed:@"2"].CGImage);
    contentsAnim.duration = 1;
    contentsAnim.repeatCount = LONG_MAX;
    contentsAnim.autoreverses = true;
    [imageView.layer addAnimation:contentsAnim forKey:@"contentsAnim"];
    
    /**------------------------圆角变化动画-------------------------------------*/
    UIView  *cornerRadiusView = [UIView new];
    cornerRadiusView.backgroundColor = [UIColor redColor];
    cornerRadiusView.frame = CGRectMake(280, 310, 70, 70);
    [self.view addSubview:cornerRadiusView];
    CABasicAnimation *cornerRadiusAnim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAnim.beginTime = 0.0;
    cornerRadiusAnim.toValue = @35;
    cornerRadiusAnim.duration = 1;
    cornerRadiusAnim.repeatCount = LONG_MAX;
    cornerRadiusAnim.autoreverses = true;
    [cornerRadiusView.layer addAnimation:cornerRadiusAnim forKey:@"cornerRadiusAnim"];
    
    /**------------------------比例缩放动画-------------------------------------*/
    UIView  *scaleView = [UIView new];
    scaleView.frame = CGRectMake(20, 410, 70, 70);
    scaleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleView];
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.beginTime = 0.0;
    scaleAnim.fromValue = @0.3;
    scaleAnim.toValue = @1.3;
    scaleAnim.duration = 1;
    scaleAnim.repeatCount = LONG_MAX;
    scaleAnim.autoreverses = true;
    [scaleView.layer addAnimation:scaleAnim forKey:@"scaleAnim"];
    
    /**------------------------比例缩放动画X-------------------------------------*/
    UIView  *scaleViewX = [UIView new];
    scaleViewX.frame = CGRectMake(150, 410, 70, 70);
    scaleViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewX];
    CABasicAnimation *scaleAnimX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleAnimX.beginTime = 0.0;
    scaleAnimX.fromValue = @0.3;
    scaleAnimX.toValue = @1.3;
    scaleAnimX.duration = 1;
    scaleAnimX.repeatCount = LONG_MAX;
    scaleAnimX.autoreverses = true;
    [scaleViewX.layer addAnimation:scaleAnimX forKey:@"scaleAnimX"];
    
    /**------------------------比例缩放动画Y-------------------------------------*/
    UIView  *scaleViewY = [UIView new];
    scaleViewY.frame = CGRectMake(280, 410, 70, 70);
    scaleViewY.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewY];
    CABasicAnimation *scaleAnimY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleAnimY.beginTime = 0.0;
    scaleAnimY.fromValue = @0.3;
    scaleAnimY.toValue = @1.3;
    scaleAnimY.duration = 1;
    scaleAnimY.repeatCount = LONG_MAX;
    scaleAnimY.autoreverses = true;
    [scaleViewY.layer addAnimation:scaleAnimY forKey:@"scaleAnimY"];
    
    /**------------------------指定大小缩放-------------------------------------*/
    UIView  *boundsView = [UIView new];
    boundsView.frame = CGRectMake(40, 520, 70, 70);
    boundsView.backgroundColor = [UIColor redColor];
    [self.view addSubview:boundsView];
    CABasicAnimation *boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnim.beginTime = 0.0;
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(800, 500, 90, 30)];
    boundsAnim.duration = 1;
    boundsAnim.repeatCount = LONG_MAX;
    boundsAnim.autoreverses = true;
    [boundsView.layer addAnimation:boundsAnim forKey:@"boundsAnim"];
    
    /**------------------------透明动画-------------------------------------*/
    UIView  *alphaView = [UIView new];
    alphaView.frame = CGRectMake(150, 520, 70, 70);
    alphaView.backgroundColor = [UIColor redColor];
    [self.view addSubview:alphaView];
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.beginTime = 0.0;
    alphaAnim.fromValue = @0;
    alphaAnim.toValue = @1;
    alphaAnim.duration = 1;
    alphaAnim.repeatCount = LONG_MAX;
    alphaAnim.autoreverses = true;
    [alphaView.layer addAnimation:alphaAnim forKey:@"alphaAnim"];
    

    
}



@end
