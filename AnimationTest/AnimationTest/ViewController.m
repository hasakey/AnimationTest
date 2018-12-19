//
//  ViewController.m
//  AnimationTest
//
//  Created by 喂！ on 2018/12/19.
//  Copyright © 2018年 well. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTable];
    self.mainTable.frame = self.view.bounds;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *tempArray = self.titleArr[section];
    return tempArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionTitleArr.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitleArr[section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDictionary *dic = self.titleArr[indexPath.section][indexPath.row];
    cell.textLabel.text = [dic valueForKey:@"title"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.titleArr[indexPath.section][indexPath.row];
    NSString *classStr = [dic valueForKey:@"clsName"];
    Class GoVC = NSClassFromString(classStr);
    UIViewController *vc = [GoVC new];
    vc.title = [dic valueForKey:@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 懒加载
-(UITableView *)mainTable
{
    if (!_mainTable) {
        _mainTable = [UITableView new];
        _mainTable.rowHeight = 100;
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
    }
    return _mainTable;
}

-(NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[
                      @[
                          @{@"clsName":@"BasicAnimController",@"title":@"CABasicAnimation基础动画"},
                          @{@"clsName":@"KeyframeAnimation",@"title":@"CAKeyframeAnimation基础动画"},
                          @{@"clsName":@"DrawLineController",@"title":@"画线动画、线条递增、递减动画"},
                          @{@"clsName":@"TransitionViewController",@"title":@"CATransition转场动画"},
                          @{@"clsName":@"SpringAnimViewController",@"title":@"CASpringAnimation弹簧动画"},
                          @{@"clsName":@"DrawLineController",@"title":@"画线动画"}
                          ],
                      @[
                          @{@"clsName":@"WaterWaveController",@"title":@"水波纹效果"},
                          @{@"clsName":@"FireAnimController",@"title":@"粒子动画-火苗效果"}
                          ]
                      ];
    }
    return _titleArr;
}

-(NSArray *)sectionTitleArr
{
    if (!_sectionTitleArr) {
        _sectionTitleArr = @[@"动画基础示例",@"动画常见经典案例"];
    }
    return _sectionTitleArr;
}



@end
