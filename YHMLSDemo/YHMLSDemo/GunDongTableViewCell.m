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
@interface GunDongTableViewCell ()
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIImageView *titleImage;
@property(nonatomic, strong)UIScrollView *scrollView;
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
        
    }
    return self;
}

-(void)creatView
{
    self.titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
