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
    
    [PCFData logLevel:PCFLogLevelDebug];
    
    self.object = [[PCFDataObject alloc] initWithCollection:@"objects" key:@"key"];
}

- (IBAction)fetchObject:(id)sender {
    [self.object getWithAccessToken:kAccessToken force:self.force completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)saveObject:(id)sender {
    [self.object putWithAccessToken:kAccessToken value:self.textField.text force:self.force completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)deleteObject:(id)sender {
    [self.object deleteWithAccessToken:kAccessToken force:self.force completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (BOOL)force {
    return !self.etagSwitch.isOn;
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

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

@end
