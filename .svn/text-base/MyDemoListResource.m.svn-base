//
//  MyDemoListResource.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 12/26/12.
//  Copyright (c) 2012 zhu shouyu. All rights reserved.
//

#import "MyDemoListResource.h"

static MyDemoListResource *singalCase;

@implementation MyDemoListResource
@synthesize resource = _resource;

+ (MyDemoListResource *)sharedResource
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singalCase = [[MyDemoListResource alloc] init];
    });
    return singalCase;
//    @synchronized(self)
//    {
//        if (nil == singalCase)
//        {
//        }
//    }
//    return singalCase;
}

- (id)init
{
    if (self = [super init])
    {
        _resource = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    self.resource = nil;
    [super dealloc];
}

- (void)addChildViewController:(ModelViewController *)childViewController
{
    [self.resource addObject:childViewController];
}

@end
