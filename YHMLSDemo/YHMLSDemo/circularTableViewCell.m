//
//  circularTableViewCell.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/9.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "circularTableViewCell.h"
#import "circularBeadScrollView.h"
@interface circularTableViewCell ()
{
        circularBeadScrollView *collectView;
}

@end
@implementation circularTableViewCell

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
    collectView = [[circularBeadScrollView alloc]init];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
