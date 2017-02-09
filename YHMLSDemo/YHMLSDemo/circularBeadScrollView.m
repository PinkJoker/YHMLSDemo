//
//  circularBeadScrollView.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/7.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "circularBeadScrollView.h"
#import "circularCollectionViewCell.h"
@interface circularBeadScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView *collectionView;

@end
@implementation circularBeadScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self creatView];
    }
    return self;
}

-(void)creatView
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kWidth *0.22, kWidth *0.3);
    layout.minimumLineSpacing = 0;
//    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, self.jk_height) collectionViewLayout:layout];
    [self addSubview:self.collectionView];
    __weak __typeof(self)weakSelf = self;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(weakSelf.mas_height);
    }];
    self.collectionView.backgroundColor = [UIColor jk_randomColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = YES;
    //self.collectionView.contentSize = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([circularCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    circularCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
