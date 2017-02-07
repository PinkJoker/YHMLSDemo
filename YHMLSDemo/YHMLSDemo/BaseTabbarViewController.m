//
//  BaseTabbarViewController.m
//  YHMLSDemo
//
//  Created by 我叫MT on 17/2/7.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "BaseTabbarViewController.h"
#import "BaseNavgationViewController.h"
static NSString *const OHA_ServiceVC = @"RootHomeViewController";
static NSString *const OHA_communityVC = @"RootCategoryViewController";
static NSString *const OHA_ShoppingCarViewVC = @"RootBuyCarViewController";
static NSString *const OHA_MineVC = @"RootMyViewController";

#define kClassKey @"rootVCClassString"
#define kTitleKey @"title"
#define kImageKey @"imageName"
#define kSelectimgKey @"selectedImageName"

static NSString *const OHA_Service = @"首页";
static NSString *const OHA_community = @"分类";
static NSString *const OHA_ShoppingCar = @"购物车";
static NSString *const OHA_Mine = @"我";
@interface BaseTabbarViewController ()

@end

@implementation BaseTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray = @[
                                 @{kClassKey:OHA_ServiceVC,
                                   kTitleKey:OHA_Service,
                                   kImageKey:@"tabbar_mainframe",
                                   kSelectimgKey:@"tabbar_mainframeHL"},
                                @{kClassKey:OHA_communityVC,
                                    kTitleKey:OHA_community,
                                    kImageKey:@"tabbar_contacts",
                                    kSelectimgKey:@"tabbar_contactsHL"
                                    },
                                 @{kClassKey:OHA_ShoppingCarViewVC,
                                   kTitleKey:OHA_ShoppingCar,
                                   kImageKey:@"tabbar_shopingcar",
                                   kSelectimgKey:@"tabbar_shopingcarHL"},
                                 @{kClassKey:OHA_MineVC,
                                   kTitleKey:OHA_Mine,
                                   kImageKey:@"tabbar_me",
                                   kSelectimgKey:@"tabbar_meHL"}
                                 
                                 ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString(obj[kClassKey])new];
        
        vc.title = obj[kTitleKey];
        BaseNavgationViewController *nav = [[BaseNavgationViewController alloc]initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = obj[kTitleKey];
        item.image = [UIImage imageNamed:obj[kImageKey]];
        item.selectedImage = [[UIImage imageNamed:obj[kSelectimgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor jk_colorWithHexString:@"ed3751"]} forState:UIControlStateSelected];
        if ([obj[kTitleKey] isEqualToString:OHA_ServiceVC]) {
            nav.navigationBar.translucent = YES;
        }
        [self addChildViewController:nav];
    }];
    self.selectedIndex = 0;
    self.delegate = self;
    
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //    if ([viewController.title isEqualToString:@"购物车"]) {
    //        //创建一个消息对象
    //        NSNotification * notice = [NSNotification notificationWithName:@"ReloadTableView" object:nil userInfo:@{@"1":@"addInToCarReload"}];
    //        //发送消息
    //        [[NSNotificationCenter defaultCenter]postNotification:notice];
    //    }
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
