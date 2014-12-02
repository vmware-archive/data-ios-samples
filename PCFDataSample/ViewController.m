//
//  ViewController.m
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "ViewController.h"

#import <PCFData/PCFData.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)fetchObject:(id)sender {
    NSString *token = @"eyJhbGciOiJSUzI1NiJ9.eyJqdGkiOiIwZjVmNThhNy0zNjFmLTQ5Y2ItYjQ4ZS1mMmJhMDAzOTk5MzMiLCJzdWIiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJzY29wZSI6WyJwYXNzd29yZC53cml0ZSIsIm9wZW5pZCIsImNsb3VkX2NvbnRyb2xsZXIud3JpdGUiLCJjbG91ZF9jb250cm9sbGVyLnJlYWQiXSwiY2xpZW50X2lkIjoiY2YiLCJjaWQiOiJjZiIsInVzZXJfaWQiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJ1c2VyX25hbWUiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiZW1haWwiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiaWF0IjoxNDE3NTQ5NTUzLCJleHAiOjE0MTc1OTI3NTMsImlzcyI6Imh0dHBzOi8vdWFhLmtvbmEuY29mZmVlLmNmbXMtYXBwcy5jb20vb2F1dGgvdG9rZW4iLCJhdWQiOlsib3BlbmlkIiwiY2xvdWRfY29udHJvbGxlciIsInBhc3N3b3JkIl19.rDnLVIH1I1ICa_cph4wWAIsdoqqCsnYJ0Z8SrOYpv_DCOAwZIYCObpJ-AqXa_fXQir6tcTP3ukR79SZNQA188njYY4bMdURPt8rULSIdvxYQurcFrsXZELey74dgUeJbd-iOW2TB1rMaZeYpFtbFAZXVx3NoIftRJxihMBo5DNd6A_KnrjrmBcO0ddbWgjkaCqvvpqEmURb1KNeO1XdBBwlMFzFhEr-5hQ5tEz2O8WGv_lIpAVOByBIWyw_i-kZtFpwpdoADq8D3kijJpAg1NTJ_E3hdHC0UsNcZ74PcLOB686EsWsvJuxvIrk4A14F6pEf_BQ0RxxmlujuMD7JxVQ";
    
    PCFOfflineStore *dataStore = [[PCFOfflineStore alloc] initWithCollection:@"objects"];
    PCFDataObject *object = [[PCFDataObject alloc] initWithDataStore:dataStore key:@"key"];
    
    [object getWithAccessToken:token completionBlock:^(PCFResponse *response) {
        NSLog(@"%@", response);
        self.textField.text = response.value;
    }];
}

- (IBAction)saveObject:(id)sender {
    NSString *token = @"eyJhbGciOiJSUzI1NiJ9.eyJqdGkiOiIwZjVmNThhNy0zNjFmLTQ5Y2ItYjQ4ZS1mMmJhMDAzOTk5MzMiLCJzdWIiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJzY29wZSI6WyJwYXNzd29yZC53cml0ZSIsIm9wZW5pZCIsImNsb3VkX2NvbnRyb2xsZXIud3JpdGUiLCJjbG91ZF9jb250cm9sbGVyLnJlYWQiXSwiY2xpZW50X2lkIjoiY2YiLCJjaWQiOiJjZiIsInVzZXJfaWQiOiJkOTI4YTAwYi1lYmZhLTQ3MGItOTc5MC0xYWVhYjI1YjI0ZmQiLCJ1c2VyX25hbWUiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiZW1haWwiOiJqd2ludGVyc0BwaXZvdGFsLmlvIiwiaWF0IjoxNDE3NTQ5NTUzLCJleHAiOjE0MTc1OTI3NTMsImlzcyI6Imh0dHBzOi8vdWFhLmtvbmEuY29mZmVlLmNmbXMtYXBwcy5jb20vb2F1dGgvdG9rZW4iLCJhdWQiOlsib3BlbmlkIiwiY2xvdWRfY29udHJvbGxlciIsInBhc3N3b3JkIl19.rDnLVIH1I1ICa_cph4wWAIsdoqqCsnYJ0Z8SrOYpv_DCOAwZIYCObpJ-AqXa_fXQir6tcTP3ukR79SZNQA188njYY4bMdURPt8rULSIdvxYQurcFrsXZELey74dgUeJbd-iOW2TB1rMaZeYpFtbFAZXVx3NoIftRJxihMBo5DNd6A_KnrjrmBcO0ddbWgjkaCqvvpqEmURb1KNeO1XdBBwlMFzFhEr-5hQ5tEz2O8WGv_lIpAVOByBIWyw_i-kZtFpwpdoADq8D3kijJpAg1NTJ_E3hdHC0UsNcZ74PcLOB686EsWsvJuxvIrk4A14F6pEf_BQ0RxxmlujuMD7JxVQ";
    
    PCFOfflineStore *dataStore = [[PCFOfflineStore alloc] initWithCollection:@"objects"];
    PCFDataObject *object = [[PCFDataObject alloc] initWithDataStore:dataStore key:@"key"];
    
    [object putWithAccessToken:token value:self.textField.text completionBlock:^(PCFResponse *response) {
        NSLog(@"%@", response);
        self.textField.text = response.value;
    }];
}

@end
