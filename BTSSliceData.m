//
//  BTSSliceData.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 3/1/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "BTSSliceData.h"


@implementation BTSSliceData
@synthesize value = _value;
@synthesize color = _color;

- (id)initWithValue:(CGFloat)tempValue color:(UIColor *)tempColor
{
    if (self = [super init])
    {
        _value = tempValue;
        _color = [[UIColor alloc] initWithCGColor:tempColor.CGColor];
    }
    return self;
}

- (id)init
{
    if (self = [super init])
    {
        _value = 0.0f;
        _color = nil;
    }
    return self;
}
@end
