//
//  ViewController.h
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCFKeyValueObject;

@interface ViewController : UIViewController

@property PCFKeyValueObject *object;

@property IBOutlet UITextField *textField;
@property IBOutlet UISwitch *etagSwitch;
@property IBOutlet UITextView *errorLabel;
@property IBOutlet UITextView *cachedContent;

@end

