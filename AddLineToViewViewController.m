//
//  AddLineToViewViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/19/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "AddLineToViewViewController.h"
#import "UIView+MDCShineEffect.h"

@interface AddLineToViewViewController ()

@end

@implementation AddLineToViewViewController

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"模仿二维码扫瞄的时候出现的线条"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"支持上下以及左右"];
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
    self.view.backgroundColor = [UIColor blueColor];
    [self.view shineWithRepeatCount:HUGE_VALF duration:4.0f maskWidth:100.0f];
    [self.view shineWithRepeatCount:HUGE_VALF duration:4.0f maskHeight:100.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
