//
//  UIView+HUD.m
//  luxury
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 mohekeji. All rights reserved.
//

#import "UIView+HUD.h"

#define hubViewTag 4343523

@implementation UIView (HUD)
- (void)showHudMessage:(NSString *)message delay:(CGFloat)delay {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        MBProgressHUD *hud = (MBProgressHUD *)[self viewWithTag:hubViewTag];
        if (!hud) {
            hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        }
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        
        //CGSize textSize = [message sizeWithFont:[UIFont systemFontOfSize:16] ];
        hud.detailsLabel.font = [UIFont systemFontOfSize:16];
        
        hud.detailsLabel.text = message;
        
        
        
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:delay];
    });
}

- (void)showHudMessage:(NSString *)message {
    [self showHudMessage:message delay:1.5];
}

- (void)showHudWithActivity:(NSString *)message {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        MBProgressHUD *hud = (MBProgressHUD *)[self viewWithTag:hubViewTag];
        if (hud) {
            hud.label.text = message;
            return ;
        }
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.tag = hubViewTag;
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = message;
    });
}

- (void)hideHubWithActivity {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        MBProgressHUD *hud = (MBProgressHUD *)[self viewWithTag:hubViewTag];
        if (!hud) {
            return;
        }else
        {
            hud.removeFromSuperViewOnHide = YES;
            [hud hideAnimated:YES afterDelay:0];
        }
    });
}


@end
