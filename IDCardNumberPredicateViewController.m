//
//  IDCardNumberPredicateViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/15/14.
//  Copyright (c) 2014 zhu shouyu. All rights reserved.
//  针对18位身份证号码
//  1、前六位是省市区县编码
//  2、7-14位是出生日期
//  3、15-17位是三位有效数字
//  4、18位是加权有效数字，
//  5、公式 S = Sum(Ai * Wi), i = 0, ... , 16 ，先对前17位数字的权求和
//  Ai:表示第i位置上的身份证号码数字值
//  Wi:表示第i位置上的加权因子
//  Wi: 7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2
//  计算模 Y = mod(S, 11)
//  通过模得到对应的校验码
//      Y: 0 1 2 3 4 5 6 7 8 9 10
//  校验码: 1 0 X 9 8 7 6 5 4 3 2

#import "IDCardNumberPredicateViewController.h"

@interface IDCardNumberPredicateViewController ()

@end

@implementation IDCardNumberPredicateViewController

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
            self.mainTitle = @"身份证合法性检查";
            self.descriptionTitle = @"判断一个身份证是否是合法的身份证";
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
