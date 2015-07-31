//
//  AppDelegate.m
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "AppDelegate.h"
#import <PCFData/PCFData.h>
#import <PCFAuth/PCFAuth.h>


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [PCFData registerTokenProviderBlock:^() {
        return [PCFAuth fetchToken].accessToken;
    }];
    
    [PCFData registerTokenInvalidatorBlock:^() {
        [PCFAuth invalidateToken];
    }];
    
    [PCFAuth registerLogoutObserverBlock:^() {
        [PCFData clearCachedData];
    }];
    
    [PCFAuth logLevel:PCFAuthLogLevelDebug];

    [PCFData logLevel:PCFDataLogLevelDebug];
        
   
    return YES;
}

@end
