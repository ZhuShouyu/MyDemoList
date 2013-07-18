//
//  AddFileOrDirectoryViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/18/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "AddFileOrDirectoryViewController.h"

@interface AddFileOrDirectoryViewController ()

@end

@implementation AddFileOrDirectoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"创建目录"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"遍历目录"];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSLog(@"----%@", path);
//    for (int i = 0; i < 10; i ++)
//    {
//        [fileManager createDirectoryAtPath:[self defaultLogsDirectory] withIntermediateDirectories:YES attributes:nil error:nil];
//    }
    [fileManager createDirectoryAtPath:[path stringByAppendingPathComponent:@"test"] withIntermediateDirectories:YES attributes:nil error:nil];
    path = [path stringByAppendingPathComponent:@"test"];
    [fileManager copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"Default.png" ofType:nil] toPath:[path stringByAppendingPathComponent:@"blue.png"] error:nil];
    [fileManager copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"Default.png" ofType:nil] toPath:[path stringByAppendingPathComponent:@"blue1.png"] error:nil];

    [fileManager copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"Default.png" ofType:nil] toPath:[path stringByAppendingPathComponent:@"blue2.png"] error:nil];

    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtPath:path];
    NSLog(@"----directory:%@\n file:%@", [[enumerator directoryAttributes] description], [[enumerator fileAttributes] description]);
    for (NSString *firle in enumerator)
    {
        NSLog(@"-----%@", firle);
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method
- (NSString *)defaultLogsDirectory
{
#if TARGET_OS_IPHONE
    static NSInteger index = 0;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *baseDir = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	NSString *logsDirectory = [baseDir stringByAppendingPathComponent:[NSString stringWithFormat:@"Logs%d%@", index, 0 == index % 3 ? nil : [NSString stringWithFormat:@"%d/images%d", index % 3, index]]];
    index ++;
    
#else
	NSString *appName = [[NSProcessInfo processInfo] processName];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
	NSString *logsDirectory = [[basePath stringByAppendingPathComponent:@"Logs"] stringByAppendingPathComponent:appName];
    
#endif
    
	return logsDirectory;
}

@end
