//
//  GunDongTableViewCell.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/16.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "GunDongTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "PagedFlowView.h"
@interface GunDongTableViewCell ()<PagedFlowViewDelegate,PagedFlowViewDataSource>
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIImageView *titleImage;
@property(nonatomic, strong)NSMutableArray *imageArray;
@property (nonatomic, strong) PagedFlowView *hFlowView;
@property(nonatomic, strong)UILabel *subheadLabel;
@property(nonatomic, strong)UILabel *timeLabel;
@property(nonatomic, strong)UILabel *describeLabel;

@end
@implementation GunDongTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatView];
    }
    return self;
}

-(void)creatView
{
    self.titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLabel];
    self.titleImage = [[UIImageView alloc]init];
    [self.contentView addSubview:self.titleImage];
    self.hFlowView = [[PagedFlowView alloc]init];
    [self.contentView addSubview:self.hFlowView];
    self.imageArray = [NSMutableArray arrayWithObjects:@"0.tiff",@"1.tiff",@"2.tiff",@"3.tiff",@"4.tiff",nil];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-5);
        make.top.mas_equalTo(10);
    }];
    weak(weakSelf);
    [self.titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.titleLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(weakSelf.titleLabel.mas_centerY);
        make.width.height.mas_equalTo(15);
    }];
    self.hFlowView.frame = CGRectMake(0, 20, kWidth, kWidth *0.65);
    self.hFlowView.delegate = self;
    self.hFlowView.dataSource = self;
//    self.hFlowView.pageControl = hPageControl;
    self.hFlowView.minimumPageAlpha = 1;
    self.hFlowView.minimumPageScale = 0.9;
    
    self.titleLabel.text = @"美丽说";
    
    self.subheadLabel = [[UILabel  alloc]init];
    [self.contentView addSubview:self.subheadLabel];
    self.timeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.timeLabel];
    self.describeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.describeLabel];
    [self.subheadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(weakSelf.hFlowView.mas_bottom).offset(00);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.subheadLabel.mas_right).offset(0);
        make.centerY.mas_equalTo(weakSelf.subheadLabel.mas_centerY);
    }];
    
  self.subheadLabel.text = @"美丽说";
    self.titleLabel.text = @"美丽说标题";
    self.timeLabel.text = @"美丽说时间";
    
}

-(CGSize)sizeForPageInFlowView:(PagedFlowView *)flowView
{
    return CGSizeMake(kWidth-80, kWidth *0.55);
}
- (NSInteger)numberOfPagesInFlowView:(PagedFlowView *)flowView{
    return [self.imageArray count];
}
//返回给某列使用的View
- (UIView *)flowView:(PagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    UIImageView *imageView = (UIImageView *)[flowView dequeueReusableCell];
    if (!imageView) {
        imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 10;
        imageView.layer.masksToBounds = YES;
        imageView.backgroundColor = [UIColor yellowColor];
    }
    imageView.image = [UIImage imageNamed:[self.imageArray objectAtIndex:index]];
    return imageView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
