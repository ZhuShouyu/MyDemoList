//
//  CurrentMemoryDetailInfoViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/11/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CurrentMemoryDetailInfoViewController.h"

@interface CurrentMemoryDetailInfoViewController ()

@end

@implementation CurrentMemoryDetailInfoViewController

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
        @autoreleasepool
        {
            self.mainTitle = [NSString stringWithFormat:@"%@", @"容量信息"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"总容量以及剩余容量以及单个文件夹大小"];
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
    
    UILabel *detailInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    detailInfo.numberOfLines = 2;
    detailInfo.text = [self getCurrentMemoryInfo];
    [self.view addSubview:detailInfo];
    [detailInfo release];
}

- (NSString *)getCurrentMemoryInfo
{
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSDictionary *dictionary = [fileManager attributesOfFileSystemForPath:path error:nil];
    [fileManager release];
    NSNumber *freenSpace = [dictionary objectForKey:NSFileSystemFreeSize];
    NSNumber *totalSpace = [dictionary objectForKey:NSFileSystemSize];
    return [NSString stringWithFormat:@"剩余空间大小是：%0.1fG/\n总空间大小是:%0.1fG", ([totalSpace longLongValue] - [freenSpace longLongValue]) / 1024.0 / 1024.0 / 1024.0, [freenSpace longLongValue] / 1024.0 / 1024.0 / 1024.0];
}

-(float)fileSizeForDir:(NSString*)path//计算文件夹下文件的总大小
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    float size =0;
    NSArray* array = [fileManager contentsOfDirectoryAtPath:path error:nil];
    for(int i = 0; i<[array count]; i++)
    {
        NSString *fullPath = [path stringByAppendingPathComponent:[array objectAtIndex:i]];
        
        BOOL isDir;
        if ( !([fileManager fileExistsAtPath:fullPath isDirectory:&isDir] && isDir) )
        {
            NSDictionary *fileAttributeDic=[fileManager attributesOfItemAtPath:fullPath error:nil];
            size+= fileAttributeDic.fileSize/ 1024.0/1024.0;
        }
        else
        {
            size += [self fileSizeForDir:fullPath];
        }
    }
    [fileManager release];
    return size;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    [super dealloc];
}
@end
