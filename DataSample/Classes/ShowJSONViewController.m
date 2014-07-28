//
//  Copyright (C) 2014 Pivotal Software, Inc. All rights reserved.
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
