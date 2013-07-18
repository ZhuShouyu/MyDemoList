//
//  SendEmailWithImageViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/16/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "SendEmailWithImageViewController.h"

@interface SendEmailWithImageViewController ()

@end

@implementation SendEmailWithImageViewController

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"发送带有图片的邮件"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"带有图片的话，需要一定的处理"];
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

//iPhone API已经提供了系统写邮件界面的接口,使用MFMailComposeViewController，用来显示界面.
//项目中需要添加MessageUi.framework。头文件加入MFMailComposeViewControllerDelegate。#import <MessageUI/MessageUI.h>
//sendMailViewController.m文件的实现：
- (void)viewDidLoad
{
    UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 40, 320, 50);
    [button setTitle: @"Mail" forState: UIControlStateNormal];
    [button addTarget: self action: @selector(sendEMail) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: button];
}

- (void) alertWithTitle: (NSString *)_title_ msg: (NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_title_
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

//点击按钮后，触发这个方法
-(void)sendEMail
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil)
    {
        if ([mailClass canSendMail])
        {
            [self displayComposerSheet];
        }
        else
        {
            [self launchMailAppOnDevice];
        }
    }
    else
    {
        [self launchMailAppOnDevice];
    }
}
//可以发送邮件的话
-(void)displayComposerSheet
{
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    
    mailPicker.mailComposeDelegate = self;
    
    //设置主题
    [mailPicker setSubject: @"eMail主题"];
    
    // 添加发送者
    NSArray *toRecipients = [NSArray arrayWithObject: @"shouyuzhu@hotmail.com"];
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
    NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
    [mailPicker setToRecipients: toRecipients];
    [mailPicker setCcRecipients:ccRecipients];
    [mailPicker setBccRecipients:bccRecipients];
#if 1
    //对于这种，会将图片作为一种附件的模式进行发送，如果需要有一定的布局，则可以采用第二种方法
    // 添加图片
    UIImage *addPic = [UIImage imageNamed: @"tearPictures.jpg"];
//    NSData *imageData = UIImagePNGRepresentation(addPic);            // png
    NSData *imageData = UIImageJPEGRepresentation(addPic, 1);    // jpeg
    [mailPicker addAttachmentData: imageData mimeType: @"" fileName: @"tearPictures.jpg"];
    
    NSString *emailBody = @"eMail 正文";
    [mailPicker setMessageBody:emailBody isHTML:YES];
#else
//    UIImage *addImage = [UIImage imageNamed:@"tearPictures.jpg"];
//    NSData *imageData = UIImageJPEGRepresentation(addImage, 1);
//    NSString *imageBase = [imageData base64Encoded];
    
    UIImage *image = [UIImage imageNamed:@"test.png"];
    
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    
    NSString *imageBase64 = [imageData base64Encoded];
    
    NSString *body = [NSString stringWithFormat:@"<img src='data:image/png;base64,%@'>", imageBase64];
    [mailPicker setMessageBody:body isHTML:YES];
#endif
    [self presentModalViewController: mailPicker animated:YES];
    [mailPicker release];
}
-(void)launchMailAppOnDevice
{
    NSString *recipients = @"mailto:first@example.com&subject=my email!";
    //@"mailto:first@example.com?cc=second@example.com,third@example.com&subject=my email!";
    NSString *body = @"&body=email body!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:email]];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    UIImage *image = [UIImage imageNamed:@""];
    [scrollView setContentSize:image.size];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [scrollView addSubview:imageView];
    [imageView release];
    
    NSString *msg = nil;
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg = @"邮件发送取消";
            break;
        case MFMailComposeResultSaved:
            msg = @"邮件保存成功";
            break;
        case MFMailComposeResultSent:
            msg = @"邮件发送成功";
            break;
        case MFMailComposeResultFailed:
            msg = @"邮件发送失败";
            break;
        default:
            break;
    }
    [self alertWithTitle:nil msg:msg];
    [self dismissModalViewControllerAnimated:YES];
}

/*
 -(void)displayComposerSheet
 {
 MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
 picker.title= @"New Message";
 picker.mailComposeDelegate = self;
 //[picker setSubject:@"New Message"];
 //    NSArray *toRecipients = [NSArray arrayWithObject:@"first@example.com"];
 //    NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
 //    NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
 //    [picker setToRecipients:toRecipients];
 //    [picker setCcRecipients:ccRecipients];
 //    [picker setBccRecipients:bccRecipients];
 // Attach an image to the email
 //NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"png"];
 //  NSData *myData = [NSData dataWithContentsOfFile:path];
 //    [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"rainy"];
 NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
 [dateFormatter setDateFormat:@"yyyy/MM/dd"];
 NSDate *date=[[NSDate alloc] init];
 NSString *content=[[NSString alloc]
 initWithFormat:@"App:1.0.iOS:%@ Date:%@",
 [[UIDevice currentDevice] systemVersion],[dateFormatter stringFromDate:date]];
 [date release];
 [dateFormatter release];
 [picker setMessageBody:content isHTML:NO];
 [content release];
 [self presentModalViewController:picker animated:YES];
 [picker release];
 }
 */


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
