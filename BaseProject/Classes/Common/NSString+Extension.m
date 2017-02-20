//
//  NSString+Extension.m
//  ShakeOrder
//
//  Created by admin on 15/8/6.
//  Copyright (c) 2015年 hjc. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

static NSCharacterSet* VariationSelectors = nil;

@implementation NSString (Extension)


- (NSString *)stringByMD5Encoding
{
    const char *chars = [self UTF8String];
    unsigned char digest[16];
    unsigned int charsLength = (unsigned int) strlen(chars);
    CC_MD5(chars, charsLength, digest); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}
-(BOOL)checkPhoneNumInput{
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSString * NET = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    NSPredicate *regextestphoneRegex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
     NSPredicate *regextestctnet= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NET];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        
        || ([regextestcm evaluateWithObject:self] == YES)
        
        || ([regextestct evaluateWithObject:self] == YES)
        
        || ([regextestcu evaluateWithObject:self] == YES)
        
        || ([regextestphoneRegex evaluateWithObject:self] == YES)
        
        || ([regextestctnet evaluateWithObject:self] == YES)
        
        )
        
    {
        
        return YES;
        
    }
    
    else
        
    {
        
        return NO;
        
    }
}
- (BOOL)checKPasswordInput
{
    BOOL result = NO;
    if ([self length] >= 6&&[self length]<=20){
        NSString *regex = @"^[a-zA-Z0-9[-`=\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?]*]{6,20}+$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:self];
    }
    return result;
}

- (BOOL)checkString
{
    BOOL result = NO;
    NSString * regex = @"^[A-Za-z0-9\u4E00-\u9FA5,，.。；;:：！!?？\'\"“”’‘、+-=@（）()%#$_-]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:self];
    return result;
}

- (BOOL)checkTelphone
{
    BOOL isTel = NO;
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    isTel = [regextestct evaluateWithObject:self];
    return isTel;
}

- (BOOL)checkEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

+ (void)load {
    VariationSelectors = [NSCharacterSet characterSetWithRange:NSMakeRange(0xFE00, 16)];
}

- (BOOL)isEmoji {
    if ([self rangeOfCharacterFromSet: VariationSelectors].location != NSNotFound) {
        return YES;
    }
    
    const unichar high = [self characterAtIndex: 0];
    
    // Surrogate pair (U+1D000-1F9FF)
    if (0xD800 <= high && high <= 0xDBFF) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
        
        return (0x1D000 <= codepoint && codepoint <= 0x1F9FF);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27BF);
    }
}

- (BOOL)isIncludingEmoji {
    BOOL __block result = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

- (instancetype)stringByRemovingEmoji {
    NSMutableString* __block buffer = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              [buffer appendString:([substring isEmoji])? @"": substring];
                          }];
    
    return buffer;
}

- (instancetype)removedEmojiString {
    return [self stringByRemovingEmoji];
}



@end
