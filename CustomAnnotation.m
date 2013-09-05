//
//  CustomAnnotation.m
//  CirclePeopleInMap
//
//  Created by Zhu Shouyu on 9/4/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    if (self = [super init])
    {
        _coordinate = coordinate;
        _title = [@"测试" copy];
        
        _subtitle = [[NSString stringWithFormat:@"La:%f Lo:%f", coordinate.latitude, coordinate.longitude] copy];
    }
    return self;
}

- (void)dealloc
{
    CustomerRelease(_title);
    CustomerRelease(_subtitle);
    CustomerDealloc;
}

@end
