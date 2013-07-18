//
//  CatchExceptionBeforeCrashViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/4/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CatchExceptionBeforeCrashViewController.h"

@interface CatchExceptionBeforeCrashViewController ()

@end

@implementation CatchExceptionBeforeCrashViewController
+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
}

- (void)dealloc
{
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    [super dealloc];
}

- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"程序崩溃前捕捉异常"];
            self.descriptionTitle = [NSString stringWithFormat:@"主要是通过两个捕捉异常的文件，在appdelegate里面注册一下就可以。"];
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
    
    self.title = [NSString stringWithFormat:@"请触摸屏幕任意地方，触发一个crash"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(NoMethod)];
}
@end
