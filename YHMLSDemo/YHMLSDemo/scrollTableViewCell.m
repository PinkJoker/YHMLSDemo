//
//  scrollTableViewCell.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/13.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "scrollTableViewCell.h"

@interface scrollTableViewCell ()
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIImageView *bigImageView;
@property(nonatomic, strong)UIImageView *oneImageView;
@property(nonatomic, strong)UIImageView *twoImageView;
@property(nonatomic, strong)UIImageView *threeImageView;

@end
@implementation scrollTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) [self creatView];
    return self;
}
-(void)creatView
{
    self.titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLabel];
    self.bigImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.bigImageView];
    self.oneImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.oneImageView];
    self.twoImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.twoImageView];
    self.threeImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.threeImageView];
    weak(weakSelf);
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(10);
    }];
    [self.bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(10);
//        make.left.mas_equalTo(40);
//        make.right.mas_equalTo(-40);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(kWidth *0.35);
        make.width.mas_equalTo(weakSelf.bigImageView.mas_height).multipliedBy(2.2);
    }];
    [self.twoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bigImageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(60);
    }];
    [self.oneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.twoImageView);
        make.left.mas_equalTo(weakSelf.bigImageView.mas_left).offset(0);
        make.width.height.mas_equalTo(weakSelf.twoImageView);
        
    }];

    [self.threeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.twoImageView);
        make.right.mas_equalTo(weakSelf.bigImageView.mas_right).offset(0);
        make.width.height.mas_equalTo(weakSelf.twoImageView);
    }];
    
    [self setProperty];
}

-(void)setProperty
{
    self.titleLabel.text = @"美丽说";
    self.bigImageView.backgroundColor = [UIColor blueColor];
    self.oneImageView.backgroundColor = [UIColor greenColor];
    self.twoImageView.backgroundColor = [UIColor cyanColor];
    self.threeImageView.backgroundColor = [UIColor yellowColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
