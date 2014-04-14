//
//  CheckCodeViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 4/14/14.
//  Copyright (c) 2014 zhu shouyu. All rights reserved.
//

#import "CheckCodeViewController.h"
#import "CheckCondeView.h"

@implementation CheckCodeViewController

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
            self.mainTitle = @"动态生成验证码";
            self.descriptionTitle = @"触摸可以生成新的验证码";
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CheckCondeView *view = [[CheckCondeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    [view release];
}

@end
