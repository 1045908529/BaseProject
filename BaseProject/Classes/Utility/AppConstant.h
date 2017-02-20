//
//  AppConstant.h
//  GoftApp
//
//  Created by admin on 15/8/17.
//  Copyright (c) 2015年 mohe. All rights reserved.
//

#ifndef GoftApp_AppConstant_h
#define GoftApp_AppConstant_h

#define VIEWWIDTH      [UIScreen mainScreen].bounds.size.width
#define VIEWHEIGHT     [UIScreen mainScreen].bounds.size.height
#define WeakSelf       __weak typeof(self) weakSelf = self;
#define kScale(x)       (x*VIEWWIDTH/750.0f)
#define kFontSize(x)       (x/96.0f)*72.0f

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//获取当前版本
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif

//------------------------单利宏定义--------------------------

#define IMPLEMENT_SINGLETON_HEADER(class)\
+ (instancetype)shared;

#define IMPLEMENT_SINGLETON(class)\
+ (instancetype)shared {\
static class* shared = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared = [[self alloc] init];\
});\
return shared;\
}



