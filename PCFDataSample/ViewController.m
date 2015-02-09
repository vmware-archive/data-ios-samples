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
#import <PCFAuth/PCFAuth.h>
#import "Config.h"

@implementation ViewController

static NSString* const PCFDataRequestCache = @"PCFData:RequestCache";

static NSString* const PCFCollection = @"objects";
static NSString* const PCFKey = @"key";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PCFData logLevel:PCFDataLogLevelDebug];
    [PCFAuth logLevel:PCFAuthLogLevelDebug];
    
    self.server.text = [Config serviceUrl];
    self.collection.text = [NSString stringWithFormat:@"Collection: %@, Key: %@", PCFCollection, PCFKey];
    
    self.object = [PCFKeyValueObject objectWithCollection:PCFCollection key:PCFKey];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults addObserver:self forKeyPath:PCFDataRequestCache options:NSKeyValueObservingOptionNew context:0];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObserver:self forKeyPath:PCFDataRequestCache];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass:[NSUserDefaults class]]) {
        if ([keyPath isEqualToString:PCFDataRequestCache]) {
            [self updateCachedContent:object];
        }
    }
}

- (void)updateCachedContent:(id)object {
    NSString *content = [object objectForKey:PCFDataRequestCache];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@ changed.", PCFDataRequestCache);
        
        self.cachedContent.text = content;
    });
}

- (IBAction)fetchObject:(id)sender {
    [self.object getWithCompletionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)saveObject:(id)sender {
    [self.object putWithValue:self.textField.text completionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)deleteObject:(id)sender {
    [self.object deleteWithCompletionBlock:^(PCFResponse *response) {
        [self handleResponse:response];
    }];
}

- (IBAction)logout:(id)sender {
    [PCFAuth invalidateToken];
}

- (BOOL)force {
    return !self.etagSwitch.isOn;
}

- (void)handleResponse:(PCFResponse *)response {

    PCFKeyValue *keyValue = (PCFKeyValue *)response.object;
    
    NSLog(@"PCFResponse value: %@", keyValue.value);
    
    self.textField.text = keyValue.value;
    
    [self parseError:response];
}

- (void)parseError:(PCFResponse *)response {

    if (response.error) {

        NSLog(@"PCFResponse error: %@", response.error);
        
        NSString *errorCode = [NSString stringWithFormat: @"%d", (int) response.error.code];
        
        if (errorCode == nil || [errorCode isEqual:@""]) {
            errorCode = @"none";
        }
        
        NSString *errorDescription = response.error.localizedDescription;
        
        if (errorDescription == nil) {
            errorDescription = @"";
        }
        
        NSString *title = [NSString stringWithFormat:@"Error Code %@", errorCode];
        NSString *message = [NSString stringWithFormat:@"Error Description %@", errorDescription];
        
        [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
