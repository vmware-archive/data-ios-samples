//
//  ViewController.h
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCFDataObject;

@interface ViewController : UIViewController

@property PCFDataObject *object;

@property IBOutlet UITextView *errorLabel;
@property IBOutlet UITextField *textField;
@property IBOutlet UISwitch *etagSwitch;

@end

