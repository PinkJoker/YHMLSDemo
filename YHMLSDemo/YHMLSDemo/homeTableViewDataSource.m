//
//  homeTableViewDataSource.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/8.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "homeTableViewDataSource.h"
#import "circularTableViewCell.h"
@interface homeTableViewDataSource ()
@property(nonatomic, copy)NSString *identifier;
@property(nonatomic, copy)NSMutableArray *dataArray;
@property(nonatomic, copy)configureBlock cellBlock;

@end

@implementation homeTableViewDataSource
-(instancetype)initWithTableViwDataSource:(NSString *)identifier withArray:(NSMutableArray *)array andCallBack:(configureBlock)block
{
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.dataArray = array;
        self.cellBlock = block;
       
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    circularTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[circularTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.numberArray;
}



@end
