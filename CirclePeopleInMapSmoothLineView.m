//
//  CirclePeopleInMapSmoothLineView.m
//  CirclePeopleInMap
//
//  Created by Zhu Shouyu on 9/5/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CirclePeopleInMapSmoothLineView.h"

@interface CirclePeopleInMapSmoothLineView ()

@property (nonatomic, CustomerStrong) NSArray *origionalValuesForRead;

@property (nonatomic) BOOL hasStartedToDraw;            //开始绘图，防止出现添加点的时候，将原始点添加上去

@property (nonatomic) CGPoint previousPoint;            //上一次绘图的终点

@property (nonatomic) CGPoint forwardPoint;             //移动过程中，当前点的上一次移动的点

@property (nonatomic) CGPoint currentPoint;             //当前点

@property (nonatomic) CGPoint origionalPoint;           //原始坐标点,暂时没什么作用

@property (nonatomic) CGLayerRef clearLayer;

/**
 *初始化界面的一些特定元素
 *@return N/A
 */
- (void)setUpTheOrigionalDatasource;

/**
 *判断某个点是否在一个指定区域内
 *point:点
 *rect:指定的区域
 *@return N/A
 */
- (BOOL)ifThePoint:(CGPoint)point inRect:(CGRect)rect;

/**
 *取中间点
 *firstPoint:点
 *scondPoint:点
 *@return 中间点坐标
 */
- (CGPoint)middlePointBetween:(CGPoint)firstPoint secondPoint:(CGPoint)scondPoint;

@end

@implementation CirclePeopleInMapSmoothLineView

@synthesize origionalValuesForRead = _origionalValuesForRead;

@synthesize origionalPoints = _origionalPoints;
@synthesize polyLinePoints = _polyLinePoints;
@synthesize pointsContainedInLine = _pointsContainedInLine;
@synthesize lineColor = _lineColor;
@synthesize lineWidth = _lineWidth;

@synthesize hasStartedToDraw = _hasStartedToDraw;
@synthesize previousPoint = _previousPoint;
@synthesize forwardPoint = _forwardPoint;
@synthesize currentPoint = _currentPoint;
@synthesize origionalPoint = _origionalPoint;

@synthesize clearLayer = _clearLayer;


- (void)dealloc
{
    CGLayerRelease(_clearLayer);
    CustomerRelease(_origionalPoints);
    CustomerRelease(_polyLinePoints);
    CustomerRelease(_pointsContainedInLine);
    CustomerRelease(_lineColor);
    CustomerRelease(_origionalValuesForRead);
    CustomerDealloc;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        _clearLayer = CGLayerCreateWithContext(context, frame.size, NULL);
        [self setUpTheOrigionalDatasource];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setUpTheOrigionalDatasource];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (self.hasStartedToDraw)
    {
        CGPoint mid1    = [self middlePointBetween:self.previousPoint secondPoint:self.forwardPoint];
        CGPoint mid2    = [self middlePointBetween:self.currentPoint secondPoint:self.forwardPoint];
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [self.layer renderInContext:context];
        
        CGContextMoveToPoint(context, mid1.x, mid1.y);
        CGContextAddQuadCurveToPoint(context, self.forwardPoint.x, self.forwardPoint.y, mid2.x, mid2.y);
        [self.polyLinePoints addObject:NSStringFromCGPoint(mid1)];
        [self.polyLinePoints addObject:NSStringFromCGPoint(self.forwardPoint)];
        [self.polyLinePoints addObject:NSStringFromCGPoint(mid2)];
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, self.lineWidth);
        CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
        
        CGContextStrokePath(context);
        
        [super drawRect:rect];
        
        for (int index = 0; index < [self.origionalPoints count]; index ++)
        {
            NSString *tempPoint = [self.origionalPoints objectAtIndex:index];
            CGPoint point = CGPointFromString(tempPoint);
            if ([self ifThePoint:point inRect:rect])
            {
                CustomNSLog(@"---选择的点:%@ 框架:%@", tempPoint, NSStringFromCGRect(rect));
                [self.pointsContainedInLine addObject:tempPoint];
                [self.origionalPoints removeObjectAtIndex:index];
                index --;
            }
        }
    }
    else
    {
        self.hasStartedToDraw = YES;
    }
}

#pragma mark - Custom Method

- (void)setUpTheOrigionalDatasource
{
    self.lineWidth = DEFAULT_WIDTH_DRAW;
    self.lineColor = DEFAULT_COLOR_DRAW;
    _pointsContainedInLine = [[NSMutableArray alloc] init];
    _polyLinePoints = [[NSMutableArray alloc] init];
}

- (BOOL)ifThePoint:(CGPoint)point inRect:(CGRect)rect
{
    if (point.x >= rect.origin.x && point.x <= rect.origin.x + rect.size.width && point.y >= rect.origin.y && point.y <= rect.origin.y + rect.size.height)
    {
        return YES;
    }
    return NO;
}

- (CGPoint)middlePointBetween:(CGPoint)firstPoint secondPoint:(CGPoint)scondPoint
{
    return CGPointMake((firstPoint.x + scondPoint.x) * 0.5f, (firstPoint.y + scondPoint.y) * 0.5f);
}

#pragma mark - UITouch Delegate

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    self.previousPoint = [touch previousLocationInView:self];
    self.forwardPoint = [touch previousLocationInView:self];
    self.currentPoint = [touch locationInView:self];
    self.origionalPoint = [touch locationInView:self];
    self.hasStartedToDraw = NO;
    
    static BOOL firstTouches = NO;
    if (NO == firstTouches)
    {
        _origionalValuesForRead = [[NSMutableArray alloc] initWithArray:self.origionalPoints];
    }
    else
    {
        [self.polyLinePoints removeAllObjects];
        [self.pointsContainedInLine removeAllObjects];
        self.origionalPoints = [NSMutableArray arrayWithArray:self.origionalValuesForRead];
    }
    firstTouches = YES;
    CGContextRef layerContext = CGLayerGetContext(self.clearLayer);
    CGContextClearRect(layerContext, self.frame);
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch  = [touches anyObject];
    self.previousPoint  = self.forwardPoint;
    self.forwardPoint  = [touch previousLocationInView:self];
    self.currentPoint    = [touch locationInView:self];
    
    // 取中间坐标
    CGPoint mid1    = [self middlePointBetween:self.previousPoint secondPoint:self.forwardPoint];
    CGPoint mid2    = [self middlePointBetween:self.currentPoint secondPoint:self.forwardPoint];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, mid1.x, mid1.y);
    CGPathAddQuadCurveToPoint(path, NULL, self.forwardPoint.x, self.forwardPoint.y, mid2.x, mid2.y);
    CGRect bounds = CGPathGetBoundingBox(path);
    CGPathRelease(path);
    
    CGRect drawBox = bounds;
    
    //这里面的几个参数比较重要，因为主要是在这个地方来获取我们将要绘制的区域，判断点是否符合要求也是根据这个区域，如果这个区域设置大了，绘制出来的图没问题，但是判断的时候就有可能将不符合要求的点给包含了，可以自己设定几个数据看看。
    drawBox.origin.x        -= self.lineWidth * 0.5;
    drawBox.origin.y        -= self.lineWidth * 0.5;
    drawBox.size.width      += self.lineWidth * 1;
    drawBox.size.height     += self.lineWidth * 1;
    
    UIGraphicsBeginImageContext(drawBox.size);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIGraphicsEndImageContext();
    
    [self setNeedsDisplayInRect:drawBox];
    
}

@end
