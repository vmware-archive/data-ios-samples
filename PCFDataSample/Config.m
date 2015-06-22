//
//  Config.m
//  PCFDataSample
//
//  Created by DX122-XL on 2015-01-22.
//  Copyright (c) 2015 Pivotal. All rights reserved.
//

#import "Config.h"

@interface Config () {
    NSDictionary *_values;
}

@property (readonly) NSDictionary *values;
@property (readwrite) NSDictionary *collisionTypes;

@end


@implementation Config

static NSString* const PCFServiceUrl = @"pivotal.data.serviceUrl";
static NSString* const PCFStrategy = @"pivotal.data.collisionStrategy";


+ (Config *)sharedInstance {
    static Config *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Config alloc] init];
    });
    return sharedInstance;
}

+ (NSString *)serviceUrl {
    return [[Config sharedInstance] serviceUrl];
}

- (NSString *)serviceUrl {
    NSString *serviceUrl = [self.values objectForKey:PCFServiceUrl];
    return serviceUrl;
}

- (NSDictionary *)values {
    if (!_values) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Pivotal" ofType:@"plist"];
        _values = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return _values;
}
@end
