//
//  TwoDimensionalCodeViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/14/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "TwoDimensionalCodeViewController.h"
#import <QREncoder/QREncoder.h>
@interface TwoDimensionalCodeViewController ()
@property (nonatomic, retain) UIImageView *previewImageView;
@property (nonatomic, retain) UIImageView *twoDimensionalImageView;
@property (nonatomic, retain) UITextField *inputTextField;

- (void)doneButtonClickForGenerateTwoDimensionalCode:(id)sender;
@end

@implementation TwoDimensionalCodeViewController
@synthesize previewImageView = _previewImageView;
@synthesize twoDimensionalImageView = _twoDimensionalImageView;
@synthesize inputTextField = _inputTextField;

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
            self.mainTitle = [NSString stringWithFormat:@"二维码的扫瞄与生成"];
            self.descriptionTitle = [NSString stringWithFormat:@"对于二维码的扫瞄，需要设备支持照相功能"];
        }
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    textField.placeholder = [NSString stringWithFormat:@"请输入要转换的二维码信息"];
    textField.delegate = self;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textField];
    self.inputTextField = textField;
    [textField release];
    
    _previewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
    _previewImageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.previewImageView];
    
    UIButton *photoChose = [UIButton buttonWithType:UIButtonTypeCustom];
    [photoChose setTitle:@"选择照片" forState:UIControlStateNormal];
    photoChose.frame = CGRectMake(150, 50, 100, 40);
    [self.view addSubview:photoChose];
    
    _twoDimensionalImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 200, 200, 200)];
    [self.twoDimensionalImageView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.twoDimensionalImageView];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClickForGenerateTwoDimensionalCode:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    [doneButton release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.inputTextField isFirstResponder])
    {
        [self.inputTextField resignFirstResponder];
    }
}
#pragma mark - Custom Method
- (void)doneButtonClickForGenerateTwoDimensionalCode:(id)sender
{
    NSString *encodeString = nil;
    if ([self.inputTextField isFirstResponder])
    {
        [self.inputTextField resignFirstResponder];
    }
    if (!self.inputTextField.text || [self.inputTextField.text isEqualToString:@""])
    {
        encodeString = [NSString stringWithFormat:@"http://www.baidu.com/"];
    }
    else
    {
        encodeString = self.inputTextField.text;
    }
    
//    UIImage *tempImage = [QREncoder encode:encodeString];
//    self.twoDimensionalImageView.image = tempImage;
//    CGRect frame = self.twoDimensionalImageView.frame;
//    frame.size = tempImage.size;
//    self.twoDimensionalImageView.frame = frame;
//    for (int i = 1; i < 41; i ++)
//    {
//        UIImage *image = [QREncoder encode:encodeString size:i correctionLevel:QRCorrectionLevelHigh];
//        if (nil != image)
//        {
//            NSLog(@"%@", NSStringFromCGSize(image.size));
//        }
////        self.twoDimensionalImageView.image = [QREncoder encode:encodeString size:i correctionLevel:QRCorrectionLevelHigh];
////        [NSThread sleepForTimeInterval:1.0f];
////        NSLog(@"-----%d", i);
//    }
    self.twoDimensionalImageView.image = [QREncoder encode:encodeString size:20 correctionLevel:QRCorrectionLevelLow];
}
@end
