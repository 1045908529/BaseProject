//
//  NSObject+Authorization.m
//  Standly
//
//  Created by admin on 16/2/27.
//  Copyright © 2016年 neasoft. All rights reserved.
//

#import "NSObject+Authorization.h"
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>

@implementation NSObject (Authorization)

- (BOOL)hasPhotoAuthorization
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted ||
        status == PHAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}
- (BOOL)hasCameraAuthorization
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied ||AVAuthorizationStatusNotDetermined ){
        return NO;
    }
    return YES;
}
@end
