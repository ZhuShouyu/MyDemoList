//
//  SpecifiedCityWeatherViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 5/1/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "SpecifiedCityWeatherViewController.h"

@interface SpecifiedCityWeatherViewController ()

@end

@implementation SpecifiedCityWeatherViewController

- (id)initWithCityCode:(NSString *)cityCode cityName:(NSString *)cityName
{
    if (self = [super init])
    {
        self.title = cityName;
        __block NSDictionary *weatherInfo;
        dispatch_queue_t globaleQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(globaleQueue, ^{
            dispatch_sync(globaleQueue, ^{
                NSError *error;
                NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://m.weather.com.cn/data/%@.html", [cityCode stringByReplacingOccurrencesOfString:@"\"" withString:@""]]]];
                
                NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                
                NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response  options:NSJSONReadingMutableLeaves error:&error];
                
                weatherInfo = [weatherDic objectForKey:@"weatherinfo"];
                NSLog(@"weatherInfo字典里面的内容为--》%@", weatherDic );
            });
            if (weatherInfo)
            {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
                    textView.editable = NO;
                    [self.view addSubview:textView];
                    [textView release];
                    textView.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n ", [weatherInfo objectForKey:@"city"],[weatherInfo objectForKey:@"date_y"],[weatherInfo objectForKey:@"week"], [weatherInfo objectForKey:@"weather1"], [weatherInfo objectForKey:@"temp1"]];
                });
            }
        });
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

@end
