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
    self.imageArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",nil];
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
    [self.hFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(15);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(10);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
