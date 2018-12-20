//
//  SpringAnimViewController.m
//  AnimationTest
//
//  Created by 喂！ on 2018/12/19.
//  Copyright © 2018年 well. All rights reserved.
//

#import "SpringAnimViewController.h"

@interface SpringAnimViewController ()

@end

@implementation SpringAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(10, 200, 50, 50);
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    if (@available(iOS 9.0, *)) {
        CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"position.x"];
        spring.damping = 5;
        spring.stiffness = 100;
        spring.mass = 1;
        spring.initialVelocity = 0;
        spring.fromValue = @(label.layer.position.x);
        spring.toValue = @(label.layer.position.x + 100);
        spring.autoreverses = true;
        spring.repeatCount = HUGE;
//        spring.duration = spring.settlingDuration;
        spring.duration = 1;
        [label.layer addAnimation:spring forKey:@"spring"];
    } else {
        // Fallback on earlier versions
    }
}



@end
