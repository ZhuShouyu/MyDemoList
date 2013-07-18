//
//  ChangeHanziToPinYinViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/3/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "ChangeHanziToPinYinViewController.h"
#import "ChineseToPinyin.h"

@interface ChangeHanziToPinYinViewController ()

@end

@implementation ChangeHanziToPinYinViewController

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"汉字转拼音"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"针对输入的汉字，转换成拼音输出，大写"];
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
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.frame];
    textView.text= [NSString stringWithFormat:@"%@", [ChineseToPinyin pinyinFromChiniseString:@"而"]];
//    textView.text = [NSString stringWithFormat:@"中国人:%@\nHello你好:%@", [ChineseToPinyin pinyinFromChiniseString:@"中国人"], [ChineseToPinyin pinyinFromChiniseString:@"Hello而是子"]];
    [self.view addSubview:textView];
    [textView release];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
