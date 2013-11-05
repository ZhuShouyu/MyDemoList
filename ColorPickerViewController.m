//
//  ColorPickerViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 10/12/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "ColorPickerViewController.h"

@interface ColorPickerViewController ()

@end

@implementation ColorPickerViewController

- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = @"模拟颜色拾取器的效果";
            self.descriptionTitle = @"主要的思路是将图片给绘制到一个空间里面去，然后根据偏移量来取得指定点的RGBA";
        }
    }
    return self;
}

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
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
    
	UIImage *image = [UIImage imageNamed:@"plan_eat.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageView.center = self.view.center;
    imageView.tag = 100;
    [self.view addSubview:imageView];
    
    UIView *temoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [temoView setBackgroundColor:[UIColor clearColor]];
    temoView.tag = 10000;
    [self.view addSubview:temoView];
    [temoView release];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView *imageView = [self.view viewWithTag:100];
    UITouch *touch = [touches anyObject];
    CGPoint tempPoint = [touch locationInView:imageView];
    [self getRGB:tempPoint];
}

- (void)getRGB:(CGPoint)point
{
    UIImage *image = [UIImage imageNamed:@"plan_eat.png"];
    CGSize thumbSize = image.size;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
	CGContextDrawImage(context, drawRect, image.CGImage);
	CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
	if (data == NULL) return ;
    
    int x = floorf(point.x);
    int y = floorf(point.y);
    int offset = 4 * (x * y);
    int red = data[offset];
    int green = data[offset+1];
    int blue = data[offset+2];
    int alpha =  data[offset+3];
    
    UIView *tempView = [self.view viewWithTag:10000];
    [tempView setBackgroundColor:[UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha / 255.0f]];
    NSLog(@"yanse:%d:%d:%d, %d", red, green, blue, alpha);
    CGContextRelease(context);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
