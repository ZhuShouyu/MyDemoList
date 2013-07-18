//
//  AddCustomizeButtonInKeyboardViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/26/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "AddCustomizeButtonInKeyboardViewController.h"

@interface AddCustomizeButtonInKeyboardViewController ()
@property (nonatomic, retain) UISwitch *isToShowCustomButton;
@property (nonatomic, retain) UITextField *textField;
@end

@implementation AddCustomizeButtonInKeyboardViewController
@synthesize isToShowCustomButton = _isToShowCustomButton;
@synthesize textField = _textField;

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"在系统自带的键盘上添加一个按钮"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"以数字键盘为例，添加一个done按钮"];
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

/*
 #import \"KeyboardViewController.h\"
 
 @implementation KeyboardViewController
 
 - (void)loadView {
 self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
 self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
 
 textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 26)];
 textField.borderStyle = UITextBorderStyleRoundedRect;
 textField.keyboardType = UIKeyboardTypeNumberPad;
 textField.returnKeyType = UIReturnKeyDone;
 textField.textAlignment = UITextAlignmentLeft;
 textField.text = @\"12345\";
 
 [self.view addSubview:textField];
 
 [textField release];
 
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(keyboardWillShow:)
 name:UIKeyboardDidShowNotification
 object:nil];
 }
 
 - (void)keyboardWillShow:(NSNotification *)note {
 UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
 doneButton.frame = CGRectMake(0, 163, 106, 53);
 doneButton.adjustsImageWhenHighlighted = NO;
 [doneButton setImage:[UIImage imageNamed:@\"DoneUp.png\"] forState:UIControlStateNormal];
 [doneButton setImage:[UIImage imageNamed:@\"DoneDown.png\"] forState:UIControlStateHighlighted];
 [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
 
 UIWindow *tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
 UIView *keyboard;
 for(int i = 0; i < [tempWindow.subviews count]; i++) {
 keyboard = [tempWindow.subviews objectAtIndex:i];
 if(([[keyboard description] hasPrefix:@\"<UIPeripheralHostView\"] == YES) || ([[keyboard description] hasPrefix:@\"<UIKeyboard\"] == YES))
 [keyboard addSubview:doneButton];
 }
 }
 
 - (void)doneButton:(id)sender {
 [textField resignFirstResponder];
 }
 
 - (void)dealloc {
 [[NSNotificationCenter defaultCenter] removeObserver:self];
 [textField release];
 [super dealloc];
 }
 
 @end
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    _isToShowCustomButton = [[UISwitch alloc] init];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.isToShowCustomButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 300, 26)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.returnKeyType = UIReturnKeyDone;
    textField.textAlignment = UITextAlignmentLeft;
    textField.text = @"12345";
    self.textField = textField;
    [self.view addSubview:textField];
    
    [textField release];
    
    
	// Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
}
- (void)keyboardWillShow:(NSNotification *)note
{
    if (!self.isToShowCustomButton.on)
    {
        return;
    }
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 163, 106, 53);
    doneButton.adjustsImageWhenHighlighted = NO;
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
//    [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
//    [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    UIWindow *tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView *keyboard;
    for(int i = 0; i < [tempWindow.subviews count]; i++)
    {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        if(([[keyboard description] hasPrefix:@"<UIPeripheralHostView"] == YES) || ([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES))
            [keyboard addSubview:doneButton];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textField resignFirstResponder];
}

- (void)doneButton:(id)sender {
    [self.textField resignFirstResponder];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_textField release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
