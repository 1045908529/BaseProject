//
//  NSString+Extension.h
//  ShakeOrder
//
//  Created by admin on 15/8/6.
//  Copyright (c) 2015年 hjc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (NSString *)stringByMD5Encoding;


//检查手机号
- (BOOL)checkPhoneNumInput;
//检查密码
- (BOOL)checKPasswordInput;
//检查固话
- (BOOL)checkTelphone;
//检查邮箱
- (BOOL)checkEmail;


- (BOOL)isIncludingEmoji;

- (instancetype)stringByRemovingEmoji;

- (instancetype)removedEmojiString __attribute__((deprecated));

@end
