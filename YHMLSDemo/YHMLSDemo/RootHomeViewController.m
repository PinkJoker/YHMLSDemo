//
//  RootHomeViewController.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/7.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "RootHomeViewController.h"
//#import ""
@interface RootHomeViewController ()<SDCycleScrollViewDelegate>
{
    SDCycleScrollView *bannerView;
    NSArray *bannerArray;
//    UIScrollView *
}
@end

@implementation RootHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor yellowColor];
    [self setNavgationView];
    [self setBanner];
 
    
}

-(void)setNavgationView
{
    UIButton *leftButton  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftButton.backgroundColor = [UIColor blueColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    rightButton.backgroundColor = [UIColor blueColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    UILabel *label = [[UILabel alloc]init];
    label.text = @"美丽说";
    label.frame  = CGRectMake(0, 0, 100, 44);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16 weight:0.05];
    self.navigationItem.titleView = label;
}





-(void)setBanner
{
    bannerArray = @[@"",@"",@"",@""];
    bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kWidth, kWidth*0.7) delegate:self placeholderImage:nil];
    bannerView.imageURLStringsGroup = bannerArray;
    bannerView.showPageControl = YES;
    bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    bannerView.currentPageDotImage = [UIImage imageNamed:@""];
    [self.view addSubview:bannerView];
    
}
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
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
