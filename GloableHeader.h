//
//  GloableHeader.h
//  CirclePeopleInMap
//
//  Created by Zhu Shouyu on 9/4/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//
//主要是包含一些全局都会使用到的头文件以及一些宏定义之类的东西

#ifndef __GLOABLE_HEADER__
#define __GLOABLE_HEADER__

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

//判断是否开启ARC，采用不同的内存控制机制
#if __has_feature(objc_arc)

#define CustomerStrong    strong               //开启ARC模式的

#else

#define CustomerStrong    retain               //未开启ARC模式

#endif

#if __has_feature(objc_arc_weak)

#define CustomerWeak weak

#elif __has_feature(objc_arc)

#define CustomerWeak unsafe_unretained

#else

#define CustomerWeak assign

#endif

#if __has_feature(objc_arc)

#define CustomerAutorelease(expression) expression
#define CustomerRelease(expression) (expression = nil)
#define CustomerRetain(expression) expression
#define CustomerCopy(expression) expression
#define CustomerDealloc
#else

#define CustomerAutorelease(expression) [expression autorelease]
#define CustomerRelease(expression) [expression release]
#define CustomerRetain(expression) [expression retain]
#define CustomerCopy(expression) expression
#define CustomerDealloc [super dealloc]

#endif

#ifndef __OPTIMIZE__
#define CustomNSLog(...) NSLog(__VA_ARGS__)
#else
#define CustomNSLog(...) {}
#endif

#define DEFAULT_WIDTH_DRAW 50.0f
#define DEFAULT_COLOR_DRAW  [UIColor blackColor]

#endif