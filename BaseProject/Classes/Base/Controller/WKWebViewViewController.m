//
//  WKWebViewViewController.m
//  Lanxi
//
//  Created by admin on 16/7/25.
//  Copyright © 2016年 neasoft. All rights reserved.
//

#import "WKWebViewViewController.h"
@interface WKWebViewViewController ()<WKNavigationDelegate>
@property (strong, nonatomic) UIProgressView *progressView;


@end

@implementation WKWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackItem:[UIImage imageNamed:@"good_icon_back"]];
    [self creatWebView];
    [self loadData];
}


- (void)creatWebView {
    
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 1, VIEWWIDTH, 2)];
    self.progressView.trackTintColor = [UIColor clearColor];
    self.progressView.progress = 0.0f;
    [self.view addSubview:self.progressView];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
}
- (void)loadData {
    if (self.url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
        return;
    }
    if (self.filePath) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:self.filePath]]];
        return;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        if (object == self.webView) {
            [self.progressView setAlpha:1.0f];
            [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
            
            if(self.webView.estimatedProgress >= 1.0f) {
                
                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [self.progressView setAlpha:0.0f];
                } completion:^(BOOL finished) {
                    [self.progressView setProgress:0.0f animated:NO];
                }];
                
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
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
