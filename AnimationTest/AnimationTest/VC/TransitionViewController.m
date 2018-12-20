//
//  TransitionViewController.m
//  AnimationTest
//
//  Created by 喂！ on 2018/12/19.
//  Copyright © 2018年 well. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()<CAAnimationDelegate>

@property(nonatomic,strong)UILabel *transitionLab;

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,strong)NSArray *animArr;


@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.transitionLab.frame = CGRectMake(0, 0, 200, 300);
    self.transitionLab.center = CGPointMake(375/2, 667/2);
    self.transitionLab.backgroundColor = [UIColor redColor];
    self.transitionLab.font = [UIFont systemFontOfSize:20];
    self.transitionLab.numberOfLines = 0;
    self.transitionLab.textColor = [UIColor blueColor];
    self.transitionLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.transitionLab];
    
    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor blueColor];
    btn.frame = CGRectMake(0, 0, 50, 40);
    btn.center = CGPointMake(375/2, 640);
    [btn setTitle:@"动画" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:btn];



}

-(void)btnAction
{
    CATransition *pageCurlAnim = [CATransition new];
    pageCurlAnim.delegate = self;
    pageCurlAnim.duration = 1.0;
    pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pageCurlAnim.type = self.animArr[self.index];
    pageCurlAnim.subtype = kCATransitionFromLeft;
    pageCurlAnim.repeatCount = 1;
    [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
    [self.transitionLab.layer addAnimation:pageCurlAnim forKey:@"transition"];
    self.transitionLab.text = [NSString stringWithFormat:@"动画效果：%@",self.animArr[self.index]];
}



-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.index = (self.index < self.animArr.count - 1)?self.index+1:0;
    if (flag) {
        [self btnAction];
    }

}

#pragma mark    懒加载
-(UILabel *)transitionLab
{
    if (!_transitionLab) {
        _transitionLab = [UILabel new];
        
    }
    return _transitionLab;
}

-(NSArray *)animArr
{
    if (!_animArr) {
        _animArr = @[@"cube",
                     @"suckEffect",
                     @"rippleEffect",
                     @"pageCurl",
                     @"pageUnCurl",
                     @"oglFlip",
//                     @"cameraIrisHollowOpen",
//                     @"cameraIrisHollowClose",
                     @"spewEffect",
                     @"genieEffect",
                     @"unGenieEffect",
                     @"twist",
                     @"tubey",
                     @"swirl",
                     @"charminUltra",
                     @"zoomyIn",
                     @"zoomyOut",
                     @"oglApplicationSuspend"];
    }
    return _animArr;
}


@end
