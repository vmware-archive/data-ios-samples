//
//  PCFRequestCache.h
//  PCFData
//
//  Created by DX122-XL on 2014-11-21.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PCFPendingRequest, PCFOfflineStore;

@interface PCFRequestCache : NSObject

- (instancetype)initWithDefaults:(NSUserDefaults *)defaults;

+ (PCFRequestCache *)sharedInstance;

+ (PCFRequestCache *)sharedInstanceWithDefaults:(NSUserDefaults *)defaults;

- (void)queueGetWithToken:(NSString *)accessToken collection:(NSString *)collection key:(NSString *)key;

- (void)queuePutWithToken:(NSString *)accessToken collection:(NSString *)collection key:(NSString *)key value:(NSString *)value fallback:(NSString *)fallback;

- (void)queueDeleteWithToken:(NSString *)accessToken collection:(NSString *)collection key:(NSString *)key fallback:(NSString *)fallback;

- (void)queuePendingRequest:(PCFPendingRequest *)request;

- (void)retrieveAndExecutePendingRequestsWithToken:(NSString *)accessToken completionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

- (void)executePendingRequestsWithToken:(NSString *)accessToken requests:(NSMutableArray *)requests;

- (PCFOfflineStore *)createOfflineStoreWithCollection:(NSString *)collection;

@end


@interface PCFPendingRequest : NSObject

@property NSDictionary *values;

- (instancetype)initWithDictionary:(NSDictionary *)values;

- (instancetype)initWithMethod:(int)method accessToken:(NSString *)accessToken collection:(NSString *)collection key:(NSString *)key value:(NSString *)value fallback:(NSString *)fallback;

@end 