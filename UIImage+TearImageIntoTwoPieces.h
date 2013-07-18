//
//  UIImage+TearImageIntoTwoPieces.h
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/15/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TearImageIntoTwoPieces)

+ (NSArray *)tearImageIntoTwoPieces:(UIImage *)image forPaths:(NSArray *)paths;
@end
