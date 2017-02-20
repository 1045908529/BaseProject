//
//  WKWebViewViewController.h
//  Lanxi
//
//  Created by admin on 16/7/25.
//  Copyright © 2016年 neasoft. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewViewController : BaseViewController
@property (strong, nonatomic) WKWebView *webView;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *filePath;

- (void)loadData;
@end
