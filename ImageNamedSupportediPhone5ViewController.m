//
//  ImageNamedSupportediPhone5ViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/26/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#import "ImageNamedSupportediPhone5ViewController.h"
#import <objc/runtime.h>

@implementation UIImage (Retina4)

+ (void)load
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height > 480.0f)
    {
        method_exchangeImplementations(class_getClassMethod(self, @selector(imageNamed:)), class_getClassMethod(self, @selector(imageNamedH568:)));
    }
}

+ (UIImage *)imageNamedH568:(NSString *)imageName
{
    NSMutableString *imageNameMutable = [imageName mutableCopy];
    
    //Delete png extension
    NSRange extension = [imageName rangeOfString:@".png" options:NSBackwardsSearch | NSAnchoredSearch];
    if (extension.location != NSNotFound) {
        [imageNameMutable deleteCharactersInRange:extension];
    }
    
    //Look for @2x to introduce -568h string
    NSRange retinaAtSymbol = [imageName rangeOfString:@"@2x"];
    if (retinaAtSymbol.location != NSNotFound) {
        [imageNameMutable insertString:@"-568h" atIndex:retinaAtSymbol.location];
    } else {
        [imageNameMutable appendString:@"-568h@2x"];
    }
    
    //Check if the image exists and load the new 568 if so or the original name if not
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageNameMutable ofType:@"png"];
    if (imagePath)
    {
        //Remove the @2x to load with the correct scale 2.0
        [imageNameMutable replaceOccurrencesOfString:@"@2x" withString:@"" options:NSBackwardsSearch range:NSMakeRange(0, [imageNameMutable length])];
        return [UIImage imageNamedH568:imageNameMutable];
    }
    else
    {
        return [UIImage imageNamedH568:imageName];
    }
}

@end


@interface ImageNamedSupportediPhone5ViewController ()

@end

@implementation ImageNamedSupportediPhone5ViewController
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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"在iPhone5上使用指定的图片"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"对于iPhone5，系统只提供了对Default-568h@2x的支持，程序内利用UIImage加载图片时候并不能正确加载-568h@2x图片，而是错误地加载了@2x文件"];
        }
    }
    return self;
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
    UIImage *image = [UIImage imageNamed:@"green.png"];
    NSLog(@"---%@", NSStringFromCGSize(image.size));
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green.png"]]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
