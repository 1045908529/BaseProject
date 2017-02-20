//
//  JHTextField.m
//  Lanxi
//
//  Created by admin on 16/7/4.
//  Copyright © 2016年 neasoft. All rights reserved.
//

#import "JHTextField.h"
#import "NSString+Extension.h"

@implementation JHTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.maxLength = -1;
    }
    return self;
}
- (void)setMaxLength:(NSInteger)maxLength {
    _maxLength = maxLength;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)textChange:(NSNotification *)noti {
    NSLog(@"%@", self.text);
    
    NSString *toBeString = [self.text stringByRemovingEmoji];
    UITextRange *selectedRange = [self markedTextRange];
    //获取高亮部分
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position) {
        if(self.maxLength >= 0){
            //设置了最大个数，并且超出范围
            if (toBeString.length > self.maxLength) {
                self.text = [toBeString substringToIndex:self.maxLength];
            }else {
                self.text = toBeString;
            }

        }else {
            self.text = toBeString;
        }
    }else {
    
    }
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
