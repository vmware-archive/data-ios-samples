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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PCFLogger sharedInstance].level = PCFLogLevelDebug;
    
    self.object = [[PCFDataObject alloc] initWithCollection:@"objects" key:@"key"];
}

- (IBAction)fetchObject:(id)sender {
    [self.object getWithAccessToken:kAccessToken completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)saveObject:(id)sender {
    [self.object putWithAccessToken:kAccessToken value:self.textField.text completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)deleteObject:(id)sender {
    [self.object deleteWithAccessToken:kAccessToken completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (void)handleResponse:(PCFResponse *)response {

    self.textField.text = response.value;
    
    if (response.error) {
        NSLog(@"PCFResponse error: %@", response.error);
        
        NSString *errorCode = [NSString stringWithFormat: @"%d", (int) response.error.code];
        
        if (errorCode == nil || [errorCode isEqual:@""]) {
            errorCode = @"none";
        }
        
        NSString *errorDescription = [[response error] localizedDescription];
        
        if (errorDescription == nil) {
            errorDescription = @"";
        }
        
        [self.errorLabel setText:[NSString stringWithFormat:@"Error Code: %@\n\nDescription: %@", errorCode, errorDescription]];
    } else {
        NSLog(@"PCFResponse value: %@", response.value);
        
        [self.errorLabel setText:@""];
    }
}

@end
