//
//  ViewController.m
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "ViewController.h"
#import <PCFData/PCFData.h>

NSString *const token = @"eyJhbGciOiJSUzI1NiJ9.eyJqdGkiOiIyNTU4M2NlNi0zNTUwLTRmY2YtOTRhZi1iMWU2M2ViZDZhMTIiLCJzdWIiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJzY29wZSI6WyJwYXNzd29yZC53cml0ZSIsIm9wZW5pZCIsImNsb3VkX2NvbnRyb2xsZXIud3JpdGUiLCJjbG91ZF9jb250cm9sbGVyLnJlYWQiXSwiY2xpZW50X2lkIjoiY2YiLCJjaWQiOiJjZiIsInVzZXJfaWQiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJ1c2VyX25hbWUiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiZW1haWwiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiaWF0IjoxNDE4MTM4OTA4LCJleHAiOjE0MTgxODIxMDgsImlzcyI6Imh0dHBzOi8vdWFhLmtvbmEuY29mZmVlLmNmbXMtYXBwcy5jb20vb2F1dGgvdG9rZW4iLCJhdWQiOlsib3BlbmlkIiwiY2xvdWRfY29udHJvbGxlciIsInBhc3N3b3JkIl19.Ddqx5HeMvKJaC1qXnNFjdC_WSF7VhfzEpborxNCXYrXsJdkOdY-rD3oxvnONegLbu11BEc3jVIOSDqeyHQFPVnbqbD8YK0UOln4k5S0PlBt9j60lilkGx08ANdA8X_hY48V3DosLNCjt_TyEsN0yiErubX-UfgDcs97CWxSYhLrayXP_3Z5nG7DVXZncRhkqXa1p7bgWB9sN9JY8Nh1n1O7y7J_EYE6XszmtmEihhWZAejvbKe1CrsG5IYt5nDqh4_bz410qW-8W-yInA4ifNeCKsnTd3EDjGX8Mko1d1Aid7JVxKDKeMtF9Pa-NhgH99xL-_avacDVTzKHHPG0dgQ";

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
    
    [object getWithAccessToken:token completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)saveObject:(id)sender {
    PCFOfflineStore *dataStore = [[PCFOfflineStore alloc] initWithCollection:@"objects"];
    PCFDataObject *object = [[PCFDataObject alloc] initWithDataStore:dataStore key:@"key"];
    
    [object putWithAccessToken:token value:self.textField.text completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)deleteObject:(id)sender {
    PCFOfflineStore *dataStore = [[PCFOfflineStore alloc] initWithCollection:@"objects"];
    PCFDataObject *object = [[PCFDataObject alloc] initWithDataStore:dataStore key:@"key"];
    
    [object deleteWithAccessToken:token completionBlock:^(PCFResponse *response) {
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
