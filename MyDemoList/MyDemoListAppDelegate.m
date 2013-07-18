//
//  MyDemoListAppDelegate.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 12/26/12.
//  Copyright (c) 2012 zhu shouyu. All rights reserved.
//

#import "MyDemoListAppDelegate.h"
#import "UncaughtExceptionHandler.h"
#import "MyDemoListViewController.h"

typedef NSString * (^saySomething)(NSString *temp, id);
@implementation MyShakeWindow



@end
@implementation MyDemoListAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef DEBUG
    InstallUncaughtExceptionHandler();
#endif
    self.window = [[[MyShakeWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[MyDemoListViewController alloc] initWithNibName:@"MyDemoListViewController" bundle:nil] autorelease];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = navigationController;

    [navigationController release];
    [self.window makeKeyAndVisible];
    
//    [self downloadSomethingFromTheInternet];
//    [self performSelector:@selector(dealBlock) withObject:nil afterDelay:2.0f];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"%@", hello(@"---", self));
//              });
    return YES;
}
saySomething hello = ^(NSString *temp, id self){
    return [NSString stringWithFormat:@"This is a test:%@,self=%@", temp, self];
};
//void (^TEST)(void) = ^{
//    NSLog(@"self= %@", self);
//};
- (void)downloadSomethingFromTheInternet
{
    NSURL *url = [NSURL URLWithString:@"http://www.tudou.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil)
        {
            NSLog(@"===========");
        }
        else if ([data length] == 0 && nil == error)
        {
            NSLog(@"------------");
        }
        else if (error != nil)
        {
            NSLog(@"error:%@", [error description]);
        }
    }];
}
- (void)dealBlock
{
    NSLog(@"main thread:%@", [NSThread mainThread]);
    NSDate *date = [NSDate date];
    __block int sum = 0;
    int Length = 100;
//    int data[100] = {0};
    __block dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    __block dispatch_semaphore_t taskSem = dispatch_semaphore_create(0);
    
    // create dispatch semaphore
    //
    dispatch_queue_t queue = dispatch_queue_create("StudyBlocks", NULL);
    
    dispatch_block_t task1 = ^(void) {
        int s = 0;
        for (int i = 0; i < 10000000; i++)
            s += arc4random();
        sum = s;
        
        NSLog(@" >> after add: %d", sum);
        NSLog(@"current thread:%@", [NSThread currentThread]);
        
        dispatch_semaphore_signal(taskSem);
    };
    
    dispatch_block_t task2 = ^(void) {
        dispatch_semaphore_wait(taskSem, DISPATCH_TIME_FOREVER);
        
        int s = sum;
        for (int i = 0; i < Length * Length * Length * Length * Length * Length; i++)
            s -= arc4random();
        sum = s;
        
        
        NSLog(@" >> after subtract: %d", sum);
        dispatch_semaphore_signal(sem);
    };
    
    dispatch_async(queue, task1);
    dispatch_async(queue, task2);
    
    // wait for the semaphore: wait until resource is ready.
    //
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//    dispatch_semaphore_wait(taskSem, DISPATCH_TIME_FOREVER);
    NSLog(@"------%f", [date timeIntervalSinceDate:[NSDate date]]);
    dispatch_release(taskSem);
    dispatch_release(sem);
    dispatch_release(queue);
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    if ([self isSupportedMutitasking] == NO)
    {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(backgroundDealMethod) userInfo:nil repeats:YES];
    self.backgroundIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundDealMethod];
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    if (self.backgroundIdentifier != UIBackgroundTaskInvalid)
    {
        [self endBackgroundDealMethod];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Background Method
- (BOOL)isSupportedMutitasking
{
    BOOL result = NO;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)])
    {
        result = [[UIDevice currentDevice] isMultitaskingSupported];
    }
    return result;
}

- (void)backgroundDealMethod
{
    NSTimeInterval backgroundTimeRemain = [[UIApplication sharedApplication] backgroundTimeRemaining];
    if (backgroundTimeRemain == DBL_MAX)
    {
        NSLog(@"The background time is not limited");
    }
    else
    {
        NSLog(@"The background time remain:%.02f", backgroundTimeRemain);
    }
}

- (void)endBackgroundDealMethod
{
    __unsafe_unretained MyDemoListAppDelegate *weakDelegate = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        MyDemoListAppDelegate *delegate = weakDelegate;
//        [delegate.timer invalidate];
        [[UIApplication sharedApplication] endBackgroundTask:delegate.backgroundIdentifier];
        delegate.backgroundIdentifier = UIBackgroundTaskInvalid;
    });
}

#pragma mark UILocalNotification
- (BOOL)localNotificationWithMessage:(NSString *)motificationMessage actionButtonTitle:(NSString *)buttonTitle lanchImage:(NSString *)imageName pplicationBage:(NSInteger)bageValue secondsFromNow:(NSTimeInterval)secondsFromNow userInfo:(NSDictionary *)userInfo
{
    if ([motificationMessage length] == 0)
    {
        return NO;
    }
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = motificationMessage;
    notification.alertAction = buttonTitle;
    if ([buttonTitle length] == 0)
    {
        notification.hasAction = NO;
    }
    else
    {
        notification.hasAction = YES;
    }
    notification.alertLaunchImage = imageName;
    notification.applicationIconBadgeNumber = bageValue;
    notification.userInfo = userInfo;
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    notification.timeZone = timeZone;
    NSDate *firstDate = [NSDate dateWithTimeIntervalSinceNow:secondsFromNow];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSUInteger dateComponents = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dddd = [calendar components:dateComponents fromDate:firstDate];
    firstDate = [calendar dateFromComponents:dddd];
    notification.fireDate = firstDate;
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    return YES;
}
@end
