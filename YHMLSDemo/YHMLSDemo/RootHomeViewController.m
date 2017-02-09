//
//  RootHomeViewController.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/7.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "RootHomeViewController.h"
#import "circularBeadScrollView.h"
#import "homeTableViewDataSource.h"
@interface RootHomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    SDCycleScrollView *bannerView;
    NSArray *bannerArray;
    circularBeadScrollView *collectView;
//    UIScrollView *
}
@property(nonatomic, strong)UITableView *homeTableView;
@property(nonatomic, strong)homeTableViewDataSource *tableDataSource;
@end

@implementation RootHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor yellowColor];
    [self setNavgationView];
    [self setBanner];
    [self setCollectView];
    
    self.homeTableView = [[UITableView alloc]init];
    [self.view addSubview:self.homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    NSMutableArray *array = [NSMutableArray array];
   
    self.tableDataSource = [[homeTableViewDataSource alloc]initWithTableViwDataSource:@"cell" withArray:array andCallBack:^(id item, id cell) {
        
    }];
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
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

-(void)setCollectView
{
    collectView = [[circularBeadScrollView alloc]init];
    [self.view addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bannerView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kWidth *0.3);
    }];
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

#pragma mark -UITableViewDelegate


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
