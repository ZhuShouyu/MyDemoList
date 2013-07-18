//
//  ModelViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 12/26/12.
//  Copyright (c) 2012 zhu shouyu. All rights reserved.
//

#import "ModelViewController.h"
#import "MyDemoListResource.h"

@interface ModelViewController ()

@end

@implementation ModelViewController
@synthesize mainTitle = _mainTitle;
@synthesize descriptionTitle = _descriptionTitle;

- (id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

+ (void)regsterSelf:(id)childViewController
{
    Class tempClass = [childViewController class];
    if (tempClass)
    {
        ModelViewController *viewController = [[tempClass alloc] init];
        [[MyDemoListResource sharedResource] addChildViewController:viewController];
        [viewController release];
    }
}

- (void)dealloc
{
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    [super dealloc];
}
@end
