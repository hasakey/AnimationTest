//
//  WaterWaveController.m
//  AnimationTest
//
//  Created by 喂！ on 2018/12/20.
//  Copyright © 2018年 well. All rights reserved.
//




#import "WaterWaveController.h"

static CGFloat waveA = 10;
static CGFloat waveW = 1/30.0;
static CGFloat offsetX = 0;
static CGFloat currentK = 0;
static CGFloat waveSpeed = 0;
static CGFloat waterWaveWidth = 0;

@interface WaterWaveController ()

@property(nonatomic,strong)UIView *waveView;

@property(nonatomic,strong)CADisplayLink *waveDisplaylink;

@property(nonatomic,strong)CAShapeLayer *firstWaveLayer;

@property(nonatomic,strong)CAShapeLayer *secondWaveLayer;

@property(nonatomic,strong)UIColor *firstWaveColor;



@end

@implementation WaterWaveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.waveView];
    [self setupUI];


}

-(void)dealloc
{
    [self.waveDisplaylink invalidate];
}


-(void)setupUI
{
    // 波浪宽
    waterWaveWidth = self.waveView.bounds.size.width;
    // 波浪颜色
    self.firstWaveColor = [UIColor greenColor];
    // 波浪速度
    waveSpeed = 0.4 / (M_PI);
    // 设置闭环的颜色
//    self.firstWaveLayer.fillColor = [UIColor clearColor].CGColor;
    self.firstWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:178/255.0].CGColor;
    // 设置边缘线的颜色
    //        firstWaveLayer.strokeColor = UIColor.blue.cgColor
//    self.firstWaveLayer.strokeColor = [UIColor blackColor].CGColor;
    self.firstWaveLayer.strokeStart = 0.0;
    self.firstWaveLayer.strokeEnd = 0.8;
    
    [self.waveView.layer addSublayer:self.firstWaveLayer];
    
    

    
    // 设置闭环的颜色
//    self.secondWaveLayer.fillColor = [UIColor clearColor].CGColor;
    self.secondWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:178/255.0].CGColor;
    // 设置边缘线的颜色
    //        secondWaveLayer.strokeColor = UIColor.blue.cgColor
//    self.secondWaveLayer.strokeColor = [UIColor blackColor].CGColor;
    self.secondWaveLayer.strokeStart = 0.0;
    self.secondWaveLayer.strokeEnd = 0.8;
    [self.waveView.layer addSublayer:self.secondWaveLayer];

    // 设置波浪流动速度
    waveSpeed = 0.05;
    // 设置振幅
    waveA = 8;
    // 设置周期
    waveW = 2 * M_PI / self.waveView.bounds.size.width;
    // 设置波浪纵向位置
    currentK = self.waveView.bounds.size.height / 2 ;//屏幕居中

    self.waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [self.waveDisplaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    

    
}


-(void)getCurrentWave
{
    // 实时位移
    offsetX += waveSpeed;
    [self setCurrentFirstWaveLayerPath];
 
}

-(void)setCurrentFirstWaveLayerPath
{
    // 创建一个路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat y = currentK;
    [path moveToPoint:CGPointMake(0, y)];
    for (int i = 0; i<waterWaveWidth; i++) {
        y = waveA * sin(waveW * i + offsetX) + currentK;
        [path addLineToPoint:CGPointMake(i, y)];
    }
    
    [path addLineToPoint:CGPointMake(waterWaveWidth, self.waveView. bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.waveView.bounds.size.height)];
    [path closePath];
    self.firstWaveLayer.path = path.CGPath;

    
    // 创建一个路径
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    CGFloat y2 = currentK;
    [path2 moveToPoint:CGPointMake(0, y2)];
    for (int i = 0; i<waterWaveWidth; i++) {
        y2 = waveA * sin(waveW * i + offsetX - waterWaveWidth/2) + currentK;
        [path2 addLineToPoint:CGPointMake(i, y2)];
    }

    [path2 addLineToPoint:CGPointMake(waterWaveWidth, self.waveView. bounds.size.height)];
    [path2 addLineToPoint:CGPointMake(0, self.waveView.bounds.size.height)];
    [path2 closePath];
    self.secondWaveLayer.path = path2.CGPath;
}




#pragma mark    懒加载
-(UIView *)waveView
{
    if (!_waveView) {
        _waveView = [UIView new];
        _waveView.frame = self.view.bounds;
        _waveView.backgroundColor = [UIColor clearColor];
        _waveView.layer.masksToBounds = YES;
    }
    return _waveView;
}

-(CADisplayLink *)waveDisplaylink
{
    if (!_waveDisplaylink) {
        _waveDisplaylink = [CADisplayLink new];
    }
    return _waveDisplaylink;
}

-(CAShapeLayer *)firstWaveLayer
{
    if (!_firstWaveLayer) {
        _firstWaveLayer = [CAShapeLayer new];
    }
    return _firstWaveLayer;
}

-(CAShapeLayer *)secondWaveLayer
{
    if (!_secondWaveLayer) {
        _secondWaveLayer = [CAShapeLayer new];
    }
    return _secondWaveLayer;
}

-(UIColor *)firstWaveColor
{
    if (!_firstWaveColor) {
        _firstWaveColor = [UIColor new];
    }
    return _firstWaveColor;
}

@end


