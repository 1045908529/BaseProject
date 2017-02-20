//
//  BaseViewController.h
//  luxury
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 mohekeji. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "AppConstant.h"
#import <BlocksKit/BlocksKit+UIKit.h>

@interface BaseViewController : UIViewController

/**
 *  导航条透明
 */
- (void)setNavbarClear;

/**
 *  设置导航栏左边按钮
 *
 *  @param items         按钮显示的image或string
 *  @param selectedBlock 点击回调 
 *         idx 所点击的按钮的下标
 */
- (void)addNavLeftItems:(NSArray *)items didSelectedBlock:(void(^)(NSUInteger idx))selectedBlock;

/**
 *  设置导航栏右边按钮
 *
 *  @param items         按钮显示的image或string
 *  @param selectedBlock 点击回调
 *         idx 所点击的按钮的下标
 */
- (void)addNavRightItems:(NSArray *)items didSelectedBlock:(void(^)(NSUInteger idx))selectedBlock;

/**
 *  设置返回按钮
 *
 *  @param item 按钮显示的image或string
 */
- (void)setBackItem:(id)item;

/**
 *  返回上一级
 */
- (void)backAction;
@end
