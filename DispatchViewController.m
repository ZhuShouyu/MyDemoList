//
//  DispatchViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 3/8/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "DispatchViewController.h"
//#define DISPATCH
#define INVOCATION

@interface DispatchViewController ()

@end

@implementation DispatchViewController

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"dispatch 一些方法的写法实例"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @""];
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

- (void)firstMethod
{
    NSLog(@"first method has completed");
    NSLog(@"first method current thread:%@", [NSThread currentThread]);
    NSLog(@"first method main thread:%@", [NSThread mainThread]);
    sleep(3.0f);
}

- (void)secondMethod
{
    NSLog(@"second method has completed");
    NSLog(@"second method current thread:%@", [NSThread currentThread]);
    NSLog(@"second method main thread:%@", [NSThread mainThread]);
    sleep(0.5f);
}

- (void)thirdMethod
{
    NSLog(@"third method has completed");
    NSLog(@"third method current thread:%@", [NSThread currentThread]);
    NSLog(@"third method main thread:%@", [NSThread mainThread]);
    sleep(1.0f);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *chinese = @"中国";
    NSLog(@"chinese:%s", [chinese UTF8String]);
#ifdef DISPATCH
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_group_async(group, mainQueue, ^{
        [self firstMethod];
    });
    dispatch_group_async(group, mainQueue, ^{
        [self secondMethod];
    });
    dispatch_group_async(group, mainQueue, ^{
        [self thirdMethod];
    });
    dispatch_group_notify(group, mainQueue, ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"All tasks had completed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    });
    dispatch_release(group);
#else
#ifdef INVOCATION
    NSInvocationOperation *first = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(firstMethod) object:nil];
    NSInvocationOperation *second = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(secondMethod) object:nil];
    NSInvocationOperation *third = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(thirdMethod) object:nil];
    [first addDependency:second];
    [first addDependency:third];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:first];
    [queue addOperation:second];
    [queue addOperation:third];
    NSLog(@"main thread is here:%@", [NSThread mainThread]);
#else
#endif
#endif
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
