//
//  UIView+HUD.h
//  luxury
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 mohekeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIView (HUD)

- (void)showHudMessage:(NSString *)message delay:(CGFloat)delay;
- (void)showHudMessage:(NSString *)message;

- (void)showHudWithActivity:(NSString *)message;
- (void)hideHubWithActivity;

@end
