//
//  GetProviderNameViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/18/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "GetProviderNameViewController.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
@interface GetProviderNameViewController ()

@end

@implementation GetProviderNameViewController

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"获取运营商名称"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"获取运营商名称"];
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
    self.title = [self carrierName];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method
-(NSString*)carrierName

{
    
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [netInfo subscriberCellularProvider];
    
    [netInfo release];
    
    NSString *carrierCode;
    
    if (carrier == nil) {
        
        carrierCode = @"WiFi";
        
    }
    
    else {
        
        carrierCode = [carrier carrierName];
        
    }
    
    return carrierCode;
    
}
@end
