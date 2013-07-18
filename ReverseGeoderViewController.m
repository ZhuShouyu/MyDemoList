//
//  ReverseGeoderViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 2/1/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "ReverseGeoderViewController.h"

@interface ReverseGeoderViewController ()
@property (nonatomic, retain) CLLocationManager *locationManager;

@end

@implementation ReverseGeoderViewController
@synthesize locationManager = _locationManager;

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
}

- (void)dealloc
{
    [_locationManager stopUpdatingLocation];
    [_locationManager release];
    [super dealloc];
}
- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"%@", @"地址解析"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"根据经纬度解析出地址"];
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
    _locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
	// Do any additional setup after loading the view.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"------------%.f----%.f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks count] ? [placemarks objectAtIndex:0] : nil;
        NSLog(@"name:%@", placemark.name);
        NSLog(@"thoroughfare:%@",placemark.thoroughfare);
        NSLog(@"subThoroughfare:%@", placemark.subThoroughfare);
        NSLog(@"locality:%@", placemark.locality);
        NSLog(@"subLocality:%@", placemark.subLocality);
        NSLog(@"administrativeArea:%@", placemark.administrativeArea);
        NSLog(@"subAdministrativeArea:%@", placemark.subAdministrativeArea);
        NSLog(@"postalCode:%@", placemark.postalCode);
        NSLog(@"ISOcountryCode:%@", placemark.ISOcountryCode);
        
        NSLog(@"country:%@", placemark.country);
        NSLog(@"inlandWater:%@", placemark.inlandWater);
        NSLog(@"areasOfInterest:%@", placemark.areasOfInterest);
        NSLog(@"ocean:%@", placemark.ocean);
    }];
//    MKReverseGeocoder *reverse = [[MKReverseGeocoder alloc] initWithCoordinate:CLLocationCoordinate2DMake(32, 119)];
//    reverse.delegate = self;
//    [reverse start];
//    [reverse release];
    [self.locationManager stopUpdatingLocation];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    NSLog(@"--------%@", [placemark.addressDictionary description]);
    /*
     @property (nonatomic, readonly) NSString *name; // eg. Apple Inc.
     @property (nonatomic, readonly) NSString *thoroughfare; // street address, eg. 1 Infinite Loop
     @property (nonatomic, readonly) NSString *subThoroughfare; // eg. 1
     @property (nonatomic, readonly) NSString *locality; // city, eg. Cupertino
     @property (nonatomic, readonly) NSString *subLocality; // neighborhood, common name, eg. Mission District
     @property (nonatomic, readonly) NSString *administrativeArea; // state, eg. CA
     @property (nonatomic, readonly) NSString *subAdministrativeArea; // county, eg. Santa Clara
     @property (nonatomic, readonly) NSString *postalCode; // zip code, eg. 95014
     @property (nonatomic, readonly) NSString *ISOcountryCode; // eg. US
     @property (nonatomic, readonly) NSString *country; // eg. United States
     @property (nonatomic, readonly) NSString *inlandWater; // eg. Lake Tahoe
     @property (nonatomic, readonly) NSString *ocean; // eg. Pacific Ocean
     @property (nonatomic, readonly) NSArray *areasOfInterest; // eg. Golden Gate Park
     */
    NSLog(@"name:%@", placemark.name);
    NSLog(@"thoroughfare:%@",placemark.thoroughfare);
    NSLog(@"subThoroughfare:%@", placemark.subThoroughfare);
    NSLog(@"locality:%@", placemark.locality);
    NSLog(@"subLocality:%@", placemark.subLocality);
    NSLog(@"administrativeArea:%@", placemark.administrativeArea);
    NSLog(@"subAdministrativeArea:%@", placemark.subAdministrativeArea);
    NSLog(@"postalCode:%@", placemark.postalCode);
    NSLog(@"ISOcountryCode:%@", placemark.ISOcountryCode);

    NSLog(@"country:%@", placemark.country);
    NSLog(@"inlandWater:%@", placemark.inlandWater);
    NSLog(@"areasOfInterest:%@", placemark.areasOfInterest);
    NSLog(@"ocean:%@", placemark.ocean);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
