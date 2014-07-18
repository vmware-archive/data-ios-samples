//
//  ShowJSONViewController.m
//  DataSample
//
//  Created by Elliott Garcea on 2014-06-11.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "ShowJSONViewController.h"

@interface ShowJSONViewController ()

@property (weak, nonatomic) IBOutlet UITextView *showJSONTextView;

@end

@implementation ShowJSONViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.showJSONTextView setText:self.formattedJSON];
}

@end
