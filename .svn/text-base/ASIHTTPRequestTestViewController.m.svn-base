//
//  ASIHTTPRequestTestViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/28/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "ASIHTTPRequestTestViewController.h"
#import "SynchronousViewController.h"
#import "AuthenticationViewController.h"
#import "QueueViewController.h"
#import "UploadViewController.h"
#import "WebPageViewController.h"

@interface ASIHTTPRequestTestViewController ()
@property (nonatomic, retain) UITextView *textView;

@end

@implementation ASIHTTPRequestTestViewController
@synthesize textView = _textView;

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"ASIHTTPRequest"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"各种类型的操作示例"];
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

- (UITextView *)textView
{
    if (_textView == nil)
    {
        _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
        _textView.editable = NO;
        _textView.alpha = 0.0f;
        [self.view addSubview:_textView];
        _textView.text = @"需要导入MobileCoreServices,SystemConfiguration,CFNetWork,libxml2.dylib文件，同时修改search path headers:${SDK_DIR}/usr/include/libxml2";
    }
    return _textView;
}

- (void)showHelpMessage:(id)sender
{
    [UIView animateWithDuration:1.0f animations:^{
        self.textView.alpha = self.textView.alpha > 0.5f ? 0.0f : 1.0f;
    }];
}
//- (void)
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    UIBarButtonItem *bookmark = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(showHelpMessage:)];
    self.navigationItem.rightBarButtonItem = bookmark;
    [bookmark release];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    SynchronousViewController *firstViewController = [[SynchronousViewController alloc] init];
    [firstViewController.view setBackgroundColor:[UIColor blackColor]];
    firstViewController.tabBarItem.title = @"synchronous";
    [firstViewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -25)];
    
    AuthenticationViewController *authentication = [[AuthenticationViewController alloc] init];
    [authentication.view setBackgroundColor:[UIColor redColor]];
    [authentication.tabBarItem setTitle:@"authentication"];
    [authentication.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -25)];

    QueueViewController *queue = [[QueueViewController alloc] init];
    [queue.view setBackgroundColor:[UIColor redColor]];
    [queue.tabBarItem setTitle:@"queue"];
    [queue.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -25)];
    
    UploadViewController *upload = [[UploadViewController alloc] init];
    [upload.view setBackgroundColor:[UIColor redColor]];
    [upload.tabBarItem setTitle:@"upload"];
    [upload.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -25)];
    
    WebPageViewController *webPage = [[WebPageViewController alloc] init];
    [webPage.view setBackgroundColor:[UIColor redColor]];
    [webPage.tabBarItem setTitle:@"webPage"];
    [webPage.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -25)];
    
    NSArray *items = [NSArray arrayWithObjects:firstViewController, authentication,queue, upload, webPage, nil];
    [firstViewController release];
    [authentication release];
    [queue release];
    [upload release];
    [webPage release];
    
    [tabBarController setViewControllers:items];
//    [tabBarController set]
    [self.view addSubview:tabBarController.view];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
