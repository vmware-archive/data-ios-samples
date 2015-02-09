//
//  PCFAuth.h
//  PCFAuth
//
//  Created by DX122-XL on 2014-12-17.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCFAuthResponse.h"
#import "PCFLoginViewController.h"

typedef void(^AuthResponseBlock)(PCFAuthResponse*);

typedef NS_ENUM(NSInteger, PCFAuthLogLevel) {
    PCFAuthLogLevelDebug = 0,
    PCFAuthLogLevelInfo,
    PCFAuthLogLevelWarning,
    PCFAuthLogLevelError,
    PCFAuthLogLevelCritical,
    PCFAuthLogLevelNone
};

@interface PCFAuth : NSObject

+ (PCFAuthResponse *)fetchToken;

+ (PCFAuthResponse *)fetchTokenWithUserPrompt;

+ (void)fetchTokenWithBlock:(AuthResponseBlock)block;

+ (void)fetchTokenWithUserPromptBlock:(AuthResponseBlock)block;

+ (void)invalidateToken;

+ (void)logLevel:(PCFAuthLogLevel)level;

@end
