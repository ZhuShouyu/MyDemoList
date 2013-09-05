//
//  CustomAnnotation.h
//  CirclePeopleInMap
//
//  Created by Zhu Shouyu on 9/4/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomAnnotation : NSObject<MKAnnotation>


//@property (nonatomic, CustomerStrong) NSString *title;
//
//@property (nonatomic, CustomerStrong) NSString *subtitle;
//
//@property (nonatomic, CustomerWeak) CLLocationCoordinate2D coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
