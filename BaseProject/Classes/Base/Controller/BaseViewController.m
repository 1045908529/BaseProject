//
//  BaseViewController.m
//  luxury
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 mohekeji. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setNavbarClear {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}
/**
 *  设置导航栏右边按钮
 */
- (void)addNavRightItems:(NSArray *)items didSelectedBlock:(void (^)(NSUInteger))selectedBlock {
    if(items.count == 0){
        return;
    }
    self.navigationItem.rightBarButtonItems = [self items:items block:selectedBlock];
}

/**
 *  设置导航栏左边按钮
 */
- (void)addNavLeftItems:(NSArray *)items didSelectedBlock:(void(^)(NSUInteger idx))selectedBlock {
    if(items.count == 0){
        return;
    }
    self.navigationItem.leftBarButtonItems = [self items:items block:selectedBlock];
}

/**
 *  设置返回按钮
 */
- (void)setBackItem:(id)item {
    WeakSelf
    [self addNavLeftItems:@[item] didSelectedBlock:^(NSUInteger idx) {
        [weakSelf backAction];
    }];
}

/**
 *  返回上一级
 */
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSArray *)items:(NSArray *)items block:(void(^)(NSUInteger idx))block {
    NSMutableArray *navItems = [NSMutableArray array];
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[NSString class]]){
            UIBarButtonItem *item = [[UIBarButtonItem alloc]bk_initWithTitle:obj style:UIBarButtonItemStylePlain handler:^(id sender) {
                block(idx);
            }];
            [navItems addObject:item];
            
        }else if([obj isKindOfClass:[UIImage class]]){
            //使用不经过原型图
            UIImage *image = [obj imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIBarButtonItem *item = [[UIBarButtonItem alloc]bk_initWithImage:image style:UIBarButtonItemStylePlain handler:^(id sender) {
                block(idx);
            }];
            [navItems addObject:item];
            
        }
    }];
    return navItems;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
