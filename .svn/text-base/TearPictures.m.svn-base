//
//  TearPictures.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/15/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "TearPictures.h"
#import "UIImage+TearImageIntoTwoPieces.h"

@interface TearPictures()
@property (nonatomic, retain) NSMutableArray *touchPoints;
@property (nonatomic, retain) UIImageView *mainImageView;
@property (nonatomic, retain) UIImageView *leftImageView;
@property (nonatomic, retain) UIImageView *rightImageView;
@property (nonatomic, retain) NSArray *imagesArray;
@property (nonatomic, assign) BOOL isSpliting;

- (void)pinchGesture:(UIPinchGestureRecognizer *)pinchGesture;

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
@end

@implementation TearPictures
@synthesize touchPoints = _touchPoints;
@synthesize mainImageView = _mainImageView;
@synthesize leftImageView = _leftImageView;
@synthesize rightImageView = _rightImageView;
@synthesize imagesArray = _imagesArray;
@synthesize isSpliting = _isSpliting;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _touchPoints = [[NSMutableArray alloc] init];
        _mainImageView = [[UIImageView alloc] initWithFrame:frame];
        [self.mainImageView setBackgroundColor:[UIColor clearColor]];
        self.mainImageView.image = [UIImage imageNamed:@"tearPictures.jpg"];
        [self addSubview:self.mainImageView];
        
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
        [self addGestureRecognizer:pinch];
        [pinch release];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.touchPoints removeAllObjects];
    UITouch *currentTouch = [touches anyObject];
    CGPoint touchPoint = [currentTouch locationInView:self];
    [self.touchPoints addObject:NSStringFromCGPoint(touchPoint)];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *currentTouch = [touches anyObject];
    CGPoint touchPoint = [currentTouch locationInView:self];
    [self.touchPoints addObject:NSStringFromCGPoint(touchPoint)];
    NSLog(@"touchPoint:%@", NSStringFromCGPoint(touchPoint));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *currentTouch = [touches anyObject];
    CGPoint touchPoint = [currentTouch locationInView:self];
    [self.touchPoints addObject:NSStringFromCGPoint(touchPoint)];
//    [self setNeedsDisplay];
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)pinchGesture
{
    if (pinchGesture.state == UIGestureRecognizerStateBegan)
    {
        if (pinchGesture.scale > 1)
        {
            self.isSpliting = YES;
            NSArray *tempArray = [UIImage tearImageIntoTwoPieces:self.mainImageView.image forPaths:self.touchPoints];
            _leftImageView = [[UIImageView alloc] initWithImage:[tempArray objectAtIndex:0]];
            _rightImageView = [[UIImageView alloc] initWithImage:[tempArray objectAtIndex:1]];
            [self addSubview:self.leftImageView];
            [self addSubview:self.rightImageView];
            self.mainImageView.hidden = YES;
        }
    }
    else if (pinchGesture.state == UIGestureRecognizerStateChanged)
    {
        if (self.isSpliting)
        {
            self.leftImageView.transform = CGAffineTransformMakeTranslation(-160*(pinchGesture.scale-1), 0);
            self.rightImageView.transform = CGAffineTransformMakeTranslation(160*(pinchGesture.scale-1), 0);
        }
    }
    else if (pinchGesture.state == UIGestureRecognizerStateEnded)
    {
        if (self.isSpliting)
        {
            [UIView beginAnimations:@"split" context:nil];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
            self.leftImageView.transform = CGAffineTransformIdentity;
            self.rightImageView.transform = CGAffineTransformIdentity;
            [UIView commitAnimations];
        }
    }
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID isEqualToString:@"split"] && finished) {
        self.mainImageView.hidden = NO;
        [self.leftImageView removeFromSuperview];
        [self.rightImageView removeFromSuperview];
        self.leftImageView = nil;
        self.rightImageView = nil;
    }
}
@end
