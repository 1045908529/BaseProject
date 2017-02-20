//
//  NSObject+Authorization.h
//  Standly
//
//  Created by admin on 16/2/27.
//  Copyright © 2016年 neasoft. All rights reserved.
//  App权限

#import <Foundation/Foundation.h>

@interface NSObject (Authorization)
//相册访问权限
- (BOOL)hasPhotoAuthorization;
//相机访问权限
- (BOOL)hasCameraAuthorization;
@end
