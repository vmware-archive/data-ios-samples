//
//  AppDelegate.m
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "AppDelegate.h"
#import <PCFData/PCFData.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSString *token = @"eyJhbGciOiJSUzI1NiJ9.eyJqdGkiOiIwZjVmNThhNy0zNjFmLTQ5Y2ItYjQ4ZS1mMmJhMDAzOTk5MzMiLCJzdWIiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJzY29wZSI6WyJwYXNzd29yZC53cml0ZSIsIm9wZW5pZCIsImNsb3VkX2NvbnRyb2xsZXIud3JpdGUiLCJjbG91ZF9jb250cm9sbGVyLnJlYWQiXSwiY2xpZW50X2lkIjoiY2YiLCJjaWQiOiJjZiIsInVzZXJfaWQiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJ1c2VyX25hbWUiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiZW1haWwiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiaWF0IjoxNDE3NTQ5NTUzLCJleHAiOjE0MTc1OTI3NTMsImlzcyI6Imh0dHBzOi8vdWFhLmtvbmEuY29mZmVlLmNmbXMtYXBwcy5jb20vb2F1dGgvdG9rZW4iLCJhdWQiOlsib3BlbmlkIiwiY2xvdWRfY29udHJvbGxlciIsInBhc3N3b3JkIl19.rDnLVIH1I1ICa_cph4wWAIsdoqqCsnYJ0Z8SrOYpv_DCOAwZIYCObpJ-AqXa_fXQir6tcTP3ukR79SZNQA188njYY4bMdURPt8rULSIdvxYQurcFrsXZELey74dgUeJbd-iOW2TB1rMaZeYpFtbFAZXVx3NoIftRJxihMBo5DNd6A_KnrjrmBcO0ddbWgjkaCqvvpqEmURb1KNeO1XdBBwlMFzFhEr-5hQ5tEz2O8WGv_lIpAVOByBIWyw_i-kZtFpwpdoADq8D3kijJpAg1NTJ_E3hdHC0UsNcZ74PcLOB686EsWsvJuxvIrk4A14F6pEf_BQ0RxxmlujuMD7JxVQ";
    [[PCFRequestCache sharedInstance] executePendingRequestsWithToken:token completionHandler:completionHandler];
}

@end
