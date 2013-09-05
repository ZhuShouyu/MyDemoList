//
//  CirclePeopleInMapViewController.m
//  CirclePeopleInMap
//
//  Created by Zhu Shouyu on 9/4/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CirclePeopleInMapViewController.h"
#import "CustomAnnotation.h"
#import "CirclePeopleInMapSmoothLineView.h"

@interface CirclePeopleInMapViewController ()

@property (nonatomic, CustomerStrong) MKMapView *mainMapView;                           //主的地图视图

@property (nonatomic, CustomerStrong) CLLocationManager *mainLocationManager;           //地图定位

@property (nonatomic, CustomerStrong) NSMutableArray *peopleLocations;                  //人员在地图上的位置信息(数据源)

@property (nonatomic, CustomerStrong) CirclePeopleInMapSmoothLineView *lineView;

@end

@implementation CirclePeopleInMapViewController

@synthesize mainMapView = _mainMapView;

@synthesize mainLocationManager = _mainLocationManager;

@synthesize peopleLocations = _peopleLocations;

@synthesize lineView = _lineView;

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
            self.mainTitle = [NSString stringWithFormat:@"地图圈人"];
            self.descriptionTitle = [NSString stringWithFormat:@"根据绘制的线条来筛选符合要求的人"];
        }
    }
    return self;
}

- (void)dealloc
{
    [_mainLocationManager stopUpdatingLocation];
    _mainLocationManager.delegate = nil;
    _mainMapView.delegate = nil;
    CustomerRelease(_lineView);
    CustomerRelease(_mainLocationManager);
    CustomerRelease(_peopleLocations);
    CustomerRelease(_mainMapView);
    CustomerDealloc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _mainMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mainMapView.delegate = self;
    self.mainMapView.mapType = MKMapTypeStandard;
    self.mainMapView.showsUserLocation = YES;
    [self.view addSubview:self.mainMapView];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressMapViewHandler:)];
    [self.mainMapView addGestureRecognizer:longPress];
    CustomerRelease(longPress);
    
    if ([CLLocationManager locationServicesEnabled])
    {
        _mainLocationManager = [[CLLocationManager alloc] init];
        self.mainLocationManager.delegate = self;
        [self.mainLocationManager startUpdatingLocation];
    }
    
    _peopleLocations = [[NSMutableArray alloc] init];
    
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tempButton.tag = 1UL << 7;
//    [tempButton setBackgroundImage:[UIImage imageNamed:@"fs_main_login_login_button_highlighted"] forState:UIControlStateNormal];
    [tempButton setTitle:@"圈人" forState:UIControlStateNormal];
    tempButton.frame = CGRectMake(0, 0, 100, 40);
    [tempButton addTarget:self action:@selector(buttonClickedMethod:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"圈人" style:UIBarButtonItemStyleBordered target:self action:@selector(buttonClickedMethod:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    CustomerRelease(rightBarButton);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    MKCoordinateSpan tempSpan = MKCoordinateSpanMake(0.05f, 0.05f);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(newLocation.coordinate, tempSpan);
    
    [self.mainMapView setRegion:region];
    
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

#pragma mark - MAMapViewDelegate

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    if (newState == MKAnnotationViewDragStateEnding)
    {
        if (NSNotFound != [self.peopleLocations indexOfObject:view.annotation])
        {
            [self.peopleLocations replaceObjectAtIndex:[self.peopleLocations indexOfObject:view.annotation] withObject:view.annotation];
        }
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[CustomAnnotation class]])
    {
        static NSString *identifier = @"identifier";
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.mainMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (nil == annotationView)
        {
            annotationView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
        }
        annotationView.animatesDrop = YES;
        annotationView.draggable = YES;
        annotationView.pinColor = MKPinAnnotationColorGreen;
        annotationView.canShowCallout = YES;
        return annotationView;
    }
    return nil;
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineView *lineView = [[MKPolylineView alloc] initWithPolyline:overlay];
        lineView.strokeColor = [UIColor redColor];
        lineView.lineWidth = DEFAULT_WIDTH_DRAW * 2;
        return lineView;
    }
    return nil;
}

#pragma mark - Long press handler
- (void)longPressMapViewHandler:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        CLLocationCoordinate2D coordinate = [self.mainMapView convertPoint:[gestureRecognizer locationInView:self.mainMapView] toCoordinateFromView:self.mainMapView];
        CustomAnnotation *tempAnnotation = [[CustomAnnotation alloc] initWithCoordinate:coordinate];
        [self.mainMapView addAnnotation:tempAnnotation];
        [self.peopleLocations addObject:tempAnnotation];
        CustomerRelease(tempAnnotation);
    }
}

#pragma mark - button clicked method for drawing 

- (void)buttonClickedMethod:(id)sender
{
    static BOOL hasFinishedDrawing = NO;
    if (hasFinishedDrawing)
    {
        
        NSArray *allPoints = [NSArray arrayWithArray:self.lineView.polyLinePoints];
        CLLocationCoordinate2D coordinates[[allPoints count]];
        for (NSInteger index = 0; index < [allPoints count]; index ++)
        {
            NSString *tempPoint = [allPoints objectAtIndex:index];
            CGPoint point = CGPointFromString(tempPoint);
            CLLocationCoordinate2D tempCoordinate = [self.mainMapView convertPoint:point toCoordinateFromView:self.lineView];
            coordinates[index] = tempCoordinate;
        }
        [self.mainMapView removeOverlays:self.mainMapView.overlays];
        MKPolyline *tempPolyLine = [MKPolyline polylineWithCoordinates:coordinates count:[allPoints count]];
        [self.mainMapView addOverlay:tempPolyLine];
        
        [self.mainMapView removeAnnotations:self.mainMapView.annotations];
        
        [self.peopleLocations removeAllObjects];
        CustomNSLog(@"choosedValues:%@", [self.lineView.pointsContainedInLine description]);
        for (NSString *tempPoint in self.lineView.pointsContainedInLine)
        {
            CGPoint point = CGPointFromString(tempPoint);
            CLLocationCoordinate2D coordinate = [self.mainMapView convertPoint:point toCoordinateFromView:self.lineView];
            CustomAnnotation *tempAnnotation = [[CustomAnnotation alloc] initWithCoordinate:coordinate];
            [self.mainMapView addAnnotation:tempAnnotation];
            [self.peopleLocations addObject:tempAnnotation];
            CustomerRelease(tempAnnotation);
        }
        [self.lineView removeFromSuperview];
    }
    else
    {
        NSMutableArray *tempArray = [NSMutableArray array];
        self.lineView = CustomerAutorelease([[CirclePeopleInMapSmoothLineView alloc] initWithFrame:self.view.bounds]);
        for (CustomAnnotation *annotation in self.peopleLocations)
        {
            CGPoint point = [self.mainMapView convertCoordinate:annotation.coordinate toPointToView:self.mainMapView];
            [tempArray addObject:NSStringFromCGPoint(point)];
        }
        CustomNSLog(@"points:%@", [tempArray description]);
        self.lineView.origionalPoints = tempArray;
        
        [self.view addSubview:self.lineView];
        [self.lineView setBackgroundColor:[UIColor clearColor]];
        UIView *tempView = (UIView *)[self.view viewWithTag:1UL << 7];
        [self.view bringSubviewToFront:tempView];
    }
    hasFinishedDrawing = !hasFinishedDrawing;
}
@end
