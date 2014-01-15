//
//  RateMyAppInAppStoreViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/15/14.
//  Copyright (c) 2014 zhu shouyu. All rights reserved.
//

#import "RateMyAppInAppStoreViewController.h"

@interface RateMyAppInAppStoreViewController ()

@end

@implementation RateMyAppInAppStoreViewController

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
            self.mainTitle = @"跳转到App Store评分";
            self.descriptionTitle = @"需要知道自己的app ID";
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // @"https://itunes.apple.com/us/app/ldcrew/id570137565?ls=1&mt=8"];
    NSString *url = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id = appID";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
