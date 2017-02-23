//
//  RootHomeViewController.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/7.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "RootHomeViewController.h"

#import "homeTableViewDataSource.h"
@interface RootHomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate>
{
    SDCycleScrollView *bannerView;
    NSArray *bannerArray;
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
    [self setTableView];
    [self setBanner];
   // [self setCollectView];
    

}

-(void)setTableView
{
    self.homeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    NSMutableArray *array = [NSMutableArray array];
    
    self.tableDataSource = [[homeTableViewDataSource alloc]initWithTableViwDataSource:@"cell" withArray:array andCallBack:^(id item, id cell) {
        
    }];
    self.tableDataSource.numberArray = 5;
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self.tableDataSource;
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
    bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kWidth, kWidth*0.60) delegate:self placeholderImage:nil];
    bannerView.imageURLStringsGroup = bannerArray;
    bannerView.showPageControl = YES;
    bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    bannerView.currentPageDotImage = [UIImage imageNamed:@""];
    self.homeTableView.tableHeaderView = bannerView;
    
}

#pragma mark -UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return kWidth *0.3;
    }else if (indexPath.row ==1){
          return kWidth *0.35 + 130;
    }else{
        return kWidth *0.35+160;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kWidth *0.35 +100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
