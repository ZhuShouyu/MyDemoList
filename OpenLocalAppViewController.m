//
//  OpenLocalAppViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/26/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "OpenLocalAppViewController.h"

@interface OpenLocalAppViewController ()

@end

@implementation OpenLocalAppViewController

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"运行本地安装的应用"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"要求要开启的应用已经提供了接口，否则还是无法打开"];
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
- (void)rightBarButtonClick:(id)sender
{
    NSURL *appURL = [NSURL URLWithString:@"LNExperienceStorePro:"];
    if ([[UIApplication sharedApplication] canOpenURL:appURL])
    {
        [[UIApplication sharedApplication] openURL:appURL];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    textView.text = @"开启接口的方法是在info.plist文件中加入一个URL types类型的key，是一个数组，数组中的元素是字典，在字典中加入一个URL Schemes 的key，其是一个数组，数组的值就是要开放的接口，比如在此处开启的接口是HelloWorld，那使用的时候就是HelloWorld: 如果带参数的话，就是HelloWorld://......，这些都会在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 的launchOptions中获取，至于具体的key可以参照文档";
    textView.editable = NO;
    [self.view addSubview:textView];
    [textView release];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(rightBarButtonClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [rightButton release];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
