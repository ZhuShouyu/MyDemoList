//
//  CustomAlertViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 4/17/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CustomAlertViewController.h"
#import "AHAlertView.h"

@interface CustomAlertViewController ()

@end

@implementation CustomAlertViewController

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
}

- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"AHAlertView"];
            self.descriptionTitle = [NSString stringWithFormat:@"继承UIView，躲避IOS6之后的部分项目升级出现的闪屏的问题"];
        }
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"AHAlertView";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    AHAlertView *ahAhertView = MYDEMOLIST_AUTORELEASE([[AHAlertView alloc] initWithTitle:@"Hello" message:@"worldworldworldworldworldworldworldworldworldworldworldworldworldworldworldworldworldworldworldworldworld"]);
    [ahAhertView setCancelButtonTitle:@"Cancel" block:^{
        NSLog(@"cancel clicked");
    }];
    [ahAhertView addButtonWithTitle:@"first" block:^{
        NSLog(@"first clicked");
    }];
    [ahAhertView addButtonWithTitle:@"second" block:^{
        NSLog(@"second");
    }];
    [ahAhertView addButtonWithTitle:@"third" block:^{
        NSLog(@"third");
    }];
    [ahAhertView show];
}
@end
