//
//  GrayMyPictureViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/18/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "GrayMyPictureViewController.h"

@interface GrayMyPictureViewController ()
@property (nonatomic, retain) UIImageView *currentImageView;

-(UIImage*)makeGrayImage:(UIImage*)image;

- (void)actionButtonClick:(id)sender;

@end

@implementation GrayMyPictureViewController
@synthesize currentImageView = _currentImageView;

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"图片灰化处理"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"对于一个彩色的图片，将其灰化"];
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
    
    _currentImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.currentImageView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.currentImageView];
    
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionButtonClick:)];
    self.navigationItem.rightBarButtonItem = actionButton;
    [actionButton release];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method
-(UIImage*)makeGrayImage:(UIImage*)image
{
    CGImageRef imageRef = [image CGImage];
    size_t w = CGImageGetWidth(imageRef);
    size_t h = CGImageGetHeight(imageRef);
    CFDataRef imgData = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
    CGImageRef newImageRef = CGImageCreate(w, h, 8, 32, 4*w, CGColorSpaceCreateDeviceGray(), kCGBitmapByteOrderDefault, CGDataProviderCreateWithCFData(imgData), nil, NO, kCGRenderingIntentDefault);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    return newImage;
}

- (void)actionButtonClick:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    [self presentModalViewController:imagePicker animated:YES];
    [imagePicker release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (image)
    {
        self.currentImageView.image = [self makeGrayImage:image];
    }
    [self dismissModalViewControllerAnimated:YES];
}
@end
