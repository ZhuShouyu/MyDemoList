//
//  ModelViewController.h
//  MyDemoList
//
//  Created by Zhu Shouyu on 12/26/12.
//  Copyright (c) 2012 zhu shouyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelViewController : UIViewController
@property (nonatomic, copy) NSString *mainTitle;
@property (nonatomic, copy) NSString *descriptionTitle;

+ (void)regsterSelf:(id)childViewController;

@end
