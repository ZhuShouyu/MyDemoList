//
//  BTSSliceData.h
//  MyDemoList
//
//  Created by Zhu Shouyu on 3/1/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTSSliceData : NSObject
{
    CGFloat _value;
    UIColor *_color;
}

@property (nonatomic, assign) CGFloat value;
@property (nonatomic, retain) UIColor *color;

- (id)initWithValue:(CGFloat)tempValue color:(UIColor *)tempColor;
@end
