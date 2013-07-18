//
//  ExitMyApplicationViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/11/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "ExitMyApplicationViewController.h"

@interface ExitMyApplicationViewController ()

- (void)exitMyApplication:(id)sender;

- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
@end

@implementation ExitMyApplicationViewController

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
            self.mainTitle = [NSString stringWithFormat:@"退出当前应用"];
            self.descriptionTitle = [NSString stringWithFormat:@"以动画的形式退出当前的应用程序，不会显得太过突兀"];
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
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(exitMyApplication:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method
- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID isEqualToString:@"exitMyApplication"])
    {
        exit(0);
    }
}
- (void)exitMyApplication:(id)sender
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [UIView animateWithDuration:0.5f animations:^{
        window.frame = CGRectZero;
    } completion:^(BOOL finished) {
        exit(0);
    }];
//    [UIView beginAnimations:@"exitMyApplication" context:nil];
//    [UIView setAnimationDuration:0.5f];
//    [UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:window cache:NO];
//    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
//    window.frame = CGRectZero;
//    [UIView commitAnimations];
}
@end
