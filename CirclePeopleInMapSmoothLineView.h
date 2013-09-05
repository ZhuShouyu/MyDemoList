//
//  CirclePeopleInMapSmoothLineView.h
//  CirclePeopleInMap
//
//  Created by Zhu Shouyu on 9/5/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CirclePeopleInMapSmoothLineView : UIView

@property (nonatomic, CustomerStrong) UIColor *lineColor;       //绘制的线条颜色，该颜色最好与折合到地图上的颜色一致

@property (nonatomic, CustomerWeak) CGFloat lineWidth;          //绘制的线条宽度，与折合到地图上的线条宽度保持一致

@property (nonatomic, CustomerStrong) NSMutableArray *polyLinePoints;   //绘制的路径点，用于绘制MKPolyLine

@property (nonatomic, CustomerStrong) NSMutableArray *pointsContainedInLine;    //包含在路径内的点

@property (nonatomic, CustomerStrong) NSMutableArray *origionalPoints;          //原始的坐标元素点：用于筛选


@end
