//
//  ViewController.m
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <PCFData/PCFData.h>

#ifndef DEBUG
#define NSLog(...)
#endif

@interface ViewController ()

- (void)handleResponse:(PCFResponse *)response;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)fetchObject:(id)sender {
    PCFOfflineStore *dataStore = [[PCFOfflineStore alloc] initWithCollection:@"objects"];
    PCFDataObject *object = [[PCFDataObject alloc] initWithDataStore:dataStore key:@"key"];
    
    [object getWithAccessToken:kAccessToken completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)saveObject:(id)sender {
    PCFOfflineStore *dataStore = [[PCFOfflineStore alloc] initWithCollection:@"objects"];
    PCFDataObject *object = [[PCFDataObject alloc] initWithDataStore:dataStore key:@"key"];
    
    [object putWithAccessToken:kAccessToken value:self.textField.text completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)deleteObject:(id)sender {
    PCFOfflineStore *dataStore = [[PCFOfflineStore alloc] initWithCollection:@"objects"];
    PCFDataObject *object = [[PCFDataObject alloc] initWithDataStore:dataStore key:@"key"];
    
    [object deleteWithAccessToken:kAccessToken completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (void)handleResponse:(PCFResponse *)response {
    NSLog(@"%@", response);
    self.textField.text = response.value;
    
    if (response.error) {
        NSString *errorCode = [NSString stringWithFormat: @"%d", (int)response.error.code];
        
        if (errorCode == nil || [errorCode isEqual:@""]) {
            errorCode = @"none";
        }
        
        NSString *errorDescription = [[response error] localizedDescription];
        
        if (errorDescription == nil) {
            errorDescription = @"";
        }
        
        [self.errorLabel setText:[@"Error Code: " stringByAppendingString:[errorCode stringByAppendingString:[@"\nDescription: " stringByAppendingString:errorDescription]]]];
    } else {
        [self.errorLabel setText:@""];
    }
}

@end
