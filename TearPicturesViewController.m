//
//  TearPicturesViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/15/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "TearPicturesViewController.h"
#import "TearPictures.h"
@interface TearPicturesViewController ()


@end

@implementation TearPicturesViewController

- (void)dealloc
{
    [super dealloc];
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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"图片撕裂效果"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"主要的思路还是根据绘图，首先绘出路径将当前绘图的上下文剪切出来，再将图片绘制上去，生成新的图片"];
        }
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TearPictures *pic = [[TearPictures alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:pic];
    [pic release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
