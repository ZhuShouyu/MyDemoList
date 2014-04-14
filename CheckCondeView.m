//
//  CheckCondeView.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 4/14/14.
//  Copyright (c) 2014 zhu shouyu. All rights reserved.
//

#import "CheckCondeView.h"

@interface CheckCondeView ()

@property (nonatomic, readwrite, copy) NSString *resultString;

@property (nonatomic, retain) NSArray *codesResource;

@end

@implementation CheckCondeView

@synthesize resultString = _resultString;
@synthesize codesResource = _codesResource;
@synthesize numberOfCodes = _numberOfCodes;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *datasource = [NSMutableArray array];
        for (int index = 0; index < 10; index ++)
        {
            [datasource addObject:[NSString stringWithFormat:@"%d", index]];
        }
        for (char index = 'A'; index <= 'Z'; index ++)
        {
            [datasource addObject:[NSString stringWithFormat:@"%c", index]];
        }
        for (char index = 'a'; index <= 'z'; index ++)
        {
            [datasource addObject:[NSString stringWithFormat:@"%c", index]];
        }
        _codesResource = [[NSArray alloc] initWithArray:datasource];
        _numberOfCodes = 4;
        [self changeResultString];
    }
    return self;
}

- (void)changeResultString
{
    NSMutableString *tempString = [NSMutableString string];
    for(NSInteger i = 0; i < self.numberOfCodes; i++)
    {
        NSInteger index = arc4random() % ([_codesResource count] - 1);
        
        tempString = (NSMutableString *)[tempString stringByAppendingString:[_codesResource objectAtIndex:index]];
    }
    _resultString = [[NSString alloc] initWithFormat:@"%@", tempString];
}


- (void)setNumberOfCodes:(NSUInteger)numberOfCodes
{
    _numberOfCodes = numberOfCodes;
    [self changeResultString];
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeResultString];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (self.resultString && [self.resultString length])
    {
        float red = arc4random() % 100 / 100.0;
        float green = arc4random() % 100 / 100.0;
        float blue = arc4random() % 100 / 100.0;
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        [self setBackgroundColor:color];
        
        NSString *text = [NSString stringWithFormat:@"%@",self.resultString];
        CGSize cSize = [@"S" sizeWithFont:[UIFont systemFontOfSize:20]];
        int width = rect.size.width / text.length - cSize.width;
        int height = rect.size.height - cSize.height;
        CGPoint point;
        
        float pX, pY;
        for (int i = 0; i < text.length; i++)
        {
            pX = arc4random() % width + rect.size.width / text.length * i;
            pY = arc4random() % height;
            point = CGPointMake(pX, pY);
            unichar c = [text characterAtIndex:i];
            NSString *textC = [NSString stringWithFormat:@"%C", c];
            [textC drawAtPoint:point withFont:[UIFont systemFontOfSize:20]];
        }
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1.0);
        for(int cout = 0; cout < 10; cout++)
        {
            red = arc4random() % 100 / 100.0;
            green = arc4random() % 100 / 100.0;
            blue = arc4random() % 100 / 100.0;
            color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
            CGContextSetStrokeColorWithColor(context, [color CGColor]);
            pX = arc4random() % (int)rect.size.width;
            pY = arc4random() % (int)rect.size.height;
            CGContextMoveToPoint(context, pX, pY);
            pX = arc4random() % (int)rect.size.width;
            pY = arc4random() % (int)rect.size.height;
            CGContextAddLineToPoint(context, pX, pY);
            CGContextStrokePath(context);
        }
    }
}

- (void)dealloc
{
    self.resultString = nil;
    self.codesResource = nil;
    [super dealloc];
}
@end
