//
//  circularCollectionViewCell.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/8.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "circularCollectionViewCell.h"

@implementation circularCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.circularImageView.backgroundColor = [UIColor greenColor];
    self.circularImageView.layer.cornerRadius = (kWidth *0.22 - 20 )*0.5;
//    self.circularImageView.layer.cornerRadius = self.circularImageView.jk_height * 0.5;
    self.circularImageView.clipsToBounds = YES;
}

@end
