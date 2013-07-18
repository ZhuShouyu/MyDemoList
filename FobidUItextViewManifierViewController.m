//
//  FobidUItextViewManifierViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/9/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "FobidUItextViewManifierViewController.h"

@interface FobidUItextViewManifierViewController ()
@property (nonatomic, retain) UISwitch *clockSwitch;
@property (nonatomic, retain) UITextView *mainTextView;
@end

@implementation FobidUItextViewManifierViewController
@synthesize clockSwitch = _clockSwitch;
@synthesize mainTextView = _mainTextView;

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
}
- (void)dealloc
{
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    self.clockSwitch = nil;
    self.mainTextView = nil;
    [super dealloc];
}

- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"禁用放大镜"];
            self.descriptionTitle = [NSString stringWithFormat:@"简单的几句代码就可以处理"];
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

- (void)resetTheTextViewEditable:(id)sender
{
    self.mainTextView.editable = self.clockSwitch.on;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UISwitch *sqitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [sqitch addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
    self.clockSwitch = sqitch;
    [sqitch release];
    UIBarButtonItem *temp = [[UIBarButtonItem alloc] initWithCustomView:sqitch];
    self.navigationItem.rightBarButtonItem = temp;
    [temp release];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    textView.text = [NSString stringWithFormat:@"%@", @"dshagdhsagdhsjagddddddddddddshagdywqbdhsbxygwxhsgxwqvsygdshgvwhchwgcsbjxsywdhdhwdhwuqhdsjbxjsbaxhbcgscdacvbsv gdvsa gvdgavcdajvcjvdsahjcd hsv hda vywacvyewah bdscgeywcdhsgcye ywgyewdhdsvcywaeu cywgieygqdcheo bcewqc dbgc8e2dbwgc782dvywgc2chgwq8d32 bewyqgd382dbw8qg7d823    db  8噢f额今晚分不清"];
    [textView setDelegate:self];
    [textView setEditable:YES];
    self.mainTextView = textView;
    [self.view addSubview:textView];
    [textView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return self.clockSwitch.on ? YES : NO;
}
@end
