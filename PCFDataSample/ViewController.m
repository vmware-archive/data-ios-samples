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
static NSString* const PCFRequestCacheKey = @"RequestCache";

static NSString* const PCFCollection = @"objects";
static NSString* const PCFKey = @"key";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PCFData logLevel:PCFDataLogLevelDebug];
    [PCFAuth logLevel:PCFAuthLogLevelDebug];
    
    self.server.text = [Config serviceUrl];
    self.collection.text = [NSString stringWithFormat:@"Collection: %@, Key: %@", PCFCollection, PCFKey];
    
    self.object = [PCFKeyValueObject objectWithCollection:PCFCollection key:PCFKey];
    
    [self.etagSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults addObserver:self forKeyPath:PCFRequestCacheKey options:NSKeyValueObservingOptionNew context:0];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObserver:self forKeyPath:PCFRequestCacheKey];
}

- (void)valueChanged:(id)sender {
    self.object.force = [self force];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass:[NSUserDefaults class]]) {
        if ([keyPath isEqualToString:PCFRequestCacheKey]) {
            [self updateCachedContent:object];
        }
    }
}

- (void)updateCachedContent:(id)object {
    NSString *content = [[object persistentDomainForName:PCFDataRequestCache] objectForKey:PCFRequestCacheKey];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@ changed.", PCFRequestCacheKey);
        
        self.cachedContent.text = content;
    });
}

- (IBAction)fetchObject:(id)sender {
    [self.object getWithCompletionBlock:^(PCFDataResponse *response) {
        [self handleResponse:response];
    }];
    
    [self.view endEditing:YES];
}

- (IBAction)saveObject:(id)sender {
    [self.object putWithValue:self.textField.text completionBlock:^(PCFDataResponse *response) {
        [self handleResponse:response];
    }];
    
    [self.view endEditing:YES];
}

- (IBAction)deleteObject:(id)sender {
    [self.object deleteWithCompletionBlock:^(PCFDataResponse *response) {
        [self handleResponse:response];
    }];
    
    [self.view endEditing:YES];
}

- (IBAction)logout:(id)sender {
    [PCFAuth logout];
}

- (BOOL)force {
    return !self.etagSwitch.isOn;
}

- (void)handleResponse:(PCFDataResponse *)response {

    PCFKeyValue *keyValue = (PCFKeyValue *)response.object;
    
    NSLog(@"PCFResponse value: %@", keyValue.value);
    
    self.textField.text = keyValue.value;
    
    [self parseError:response];
}

- (void)parseError:(PCFDataResponse *)response {

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
