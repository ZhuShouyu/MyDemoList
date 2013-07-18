//
//  UITextFieldColorsBorderWhileEditingViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/25/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#import "UITextFieldColorsBorderWhileEditingViewController.h"
#import "OuterGlowTextField.h"

@interface UITextFieldColorsBorderWhileEditingViewController ()

@end

@implementation UITextFieldColorsBorderWhileEditingViewController

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
            self.mainTitle = [NSString stringWithFormat:@"UITextField焦点展示"];
            self.descriptionTitle = [NSString stringWithFormat:@"编辑状态下，输入框周边会有发光效果"];
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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[btn setTintColor:RGB(139, 23, 43)];
	[btn setFrame:CGRectMake(20, 20, 100, 40)];
	[btn setTitle:@"失去焦点" forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(doClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
    
    OuterGlowTextField *firstOne = [[OuterGlowTextField alloc] initWithFrame:CGRectMake(30, 100, 260, 38)
                                                                cornerRadius:5
                                                                 borderWidth:2
                                                                 borderColor:RGB(166, 166, 166)
                                                                  lightColor:RGB(55, 154, 255)
                                                                  lightWidth:8
                                                            lightBorderColor:RGB(235, 235, 235)];
    [firstOne setClearButtonMode:UITextFieldViewModeWhileEditing];
    [firstOne setPlaceholder:@"User Name"];
    firstOne.tag = 1000;
    [self.view addSubview:firstOne];
    [firstOne release];
    
    OuterGlowTextField *secondOne = [[OuterGlowTextField alloc] initWithFrame:CGRectMake(30, 170, 260, 38)
                                                                cornerRadius:5
                                                                 borderWidth:2
                                                                 borderColor:RGB(166, 166, 166)
                                                                  lightColor:RGB(243, 168, 51)
                                                                  lightWidth:8
                                                            lightBorderColor:RGB(235, 235, 235)];
    [secondOne setClearButtonMode:UITextFieldViewModeWhileEditing];
    [secondOne setPlaceholder:@"Password"];
    [secondOne setSecureTextEntry:YES];
    secondOne.tag = 1001;
    [self.view addSubview:secondOne];
    [secondOne release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)doClick:(id)sender
{
    for (UIView *temp in self.view.subviews)
    {
        if ([temp isKindOfClass:[OuterGlowTextField class]])
        {
            [(OuterGlowTextField *)temp resignFirstResponder];
        }
    }
}
@end
