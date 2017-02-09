//
//  homeTableViewDataSource.h
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/8.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^configureBlock)(id item ,id cell);
@interface homeTableViewDataSource : NSObject <UITableViewDataSource>
@property(nonatomic, assign)NSInteger numberArray;
-(instancetype)initWithTableViwDataSource:(NSString *)identifier withArray:(NSMutableArray *)array andCallBack:(configureBlock)block;

@end
