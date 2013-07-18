//
//  ExchangeUTF8AndPercentEscapes.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/18/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "ExchangeUTF8AndPercentEscapes.h"

@interface ExchangeUTF8AndPercentEscapes ()
@property (nonatomic, retain) UITextField *inputTextField;
@property (nonatomic, retain) UITextView *persentEscapesResult;

- (void)doneButtonClick:(id)sender;
@end

@implementation ExchangeUTF8AndPercentEscapes
@synthesize inputTextField = _inputTextField;
@synthesize persentEscapesResult = _persentEscapesResult;

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"UTF8格式字符串和百分格式互转"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"浏览器地址栏里的中文很多时候都是百分样式，互转"];
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
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClick:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    [doneButton release];
    
    _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    self.inputTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.inputTextField];
    
    _persentEscapesResult = [[UITextView alloc] initWithFrame:CGRectMake(10, 70, 200, 100)];
    self.persentEscapesResult.editable = NO;
    [self.view addSubview:self.persentEscapesResult];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method
- (void)doneButtonClick:(id)sender
{
    [self.inputTextField resignFirstResponder];
    self.persentEscapesResult.text = [self.inputTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
@end
