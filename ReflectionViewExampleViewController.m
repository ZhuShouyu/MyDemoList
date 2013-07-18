//
//  ReflectionViewExampleViewController.m
//  ReflectionViewExample
//
//  Created by Nick Lockwood on 23/07/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "ReflectionViewExampleViewController.h"

@implementation ReflectionViewExampleViewController

@synthesize reflectionView;

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
}

- (id)init
{
    if (self = [super initWithNibName:@"ReflectionViewExampleViewController" bundle:nil])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"倒影"];
            self.descriptionTitle = [NSString stringWithFormat:@"可以设置倒影的透明度，间距等"];
        }
    }
    return self;
}
- (IBAction)toggleDynamic:(UISwitch *)sender
{
    reflectionView.dynamic = sender.on;
}

- (IBAction)updateAlpha:(UISlider *)slider
{
    reflectionView.reflectionAlpha = slider.value;
}

- (IBAction)updateGap:(UISlider *)slider
{
    reflectionView.reflectionGap = slider.value;
}

- (IBAction)updateScale:(UISlider *)slider
{
    reflectionView.reflectionScale = slider.value;
}

- (void)dealloc
{
    [reflectionView release];
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.reflectionView = nil;
}

@end
