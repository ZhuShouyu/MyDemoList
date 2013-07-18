//
//  MyDemoListAppDelegate.h
//  MyDemoList
//
//  Created by Zhu Shouyu on 12/26/12.
//  Copyright (c) 2012 zhu shouyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyDemoListViewController;

@interface MyShakeWindow : UIWindow

@end

@interface MyDemoListAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) MyShakeWindow *window;

@property (strong, nonatomic) MyDemoListViewController *viewController;

@property (unsafe_unretained, nonatomic) UIBackgroundTaskIdentifier backgroundIdentifier;

@property (strong, nonatomic) NSTimer *timer;
@end
