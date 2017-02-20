//
//  UIImage+Extension.h
//  luxury
//
//  Created by admin on 16/8/11.
//  Copyright © 2016年 mohekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

+ (UIImage *)gradientimageWithRect:(CGRect)rect
                            colors:(NSArray<UIColor*>*)colors
                         locations:(CGFloat[])locations;
@end
