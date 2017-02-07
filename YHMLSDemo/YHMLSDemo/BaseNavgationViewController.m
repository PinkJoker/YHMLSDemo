//
//  BaseNavgationViewController.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/7.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "BaseNavgationViewController.h"

@interface BaseNavgationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavgationViewController

+(void)initialize{
     //UINavigationBar * bar =[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
        UINavigationBar * bar =[UINavigationBar appearance];
        [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
        [bar setBackgroundColor:[UIColor whiteColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.enabled = NO;
}




- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}

/**
 *  拦截所有 push 进来的控制器
 *
 *
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, 30, 30);
//        backButton.frame.size = CGSizeMake(30, 30);
        backButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backButton];
    }
    [super pushViewController:viewController animated:animated];
}


-(void)back{
    [self popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
