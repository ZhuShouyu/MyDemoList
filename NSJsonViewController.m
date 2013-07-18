//
//  NSJsonViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 4/17/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "NSJsonViewController.h"
#import "SpecifiedCityWeatherViewController.h"

@interface NSJsonViewController ()
@property (nonatomic, retain) NSDictionary *allCityCodes;
@end

@implementation NSJsonViewController
@synthesize allCityCodes = _allCityCodes;

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
            self.mainTitle = [NSString stringWithFormat:@"NSJSON"];
            self.descriptionTitle = [NSString stringWithFormat:@"NSJSON解析天气"];
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
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"天气";
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView release];
//    _allCityCodes = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cityCodeForWeatherReport" ofType:@"plist"]];
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cityCodeForWeather" ofType:@"geojson"]];
    NSDictionary *tempDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    _allCityCodes = [[NSDictionary alloc] initWithDictionary:tempDic];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.allCityCodes objectForKey:[[self.allCityCodes allKeys] objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    NSString *provinceKey = [[self.allCityCodes allKeys] objectAtIndex:indexPath.section];
    NSArray *allCities = [[self.allCityCodes objectForKey:provinceKey] allKeys];
    cell.textLabel.text = [allCities objectAtIndex:indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.allCityCodes allKeys] objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *provinceKey = [[self.allCityCodes allKeys] objectAtIndex:indexPath.section];
    NSDictionary *allCities = [self.allCityCodes objectForKey:provinceKey];
    NSString *cityName = [[allCities allKeys] objectAtIndex:indexPath.row];
    NSString *cityCode = [allCities objectForKey:cityName];
    SpecifiedCityWeatherViewController *cityWeather = [[SpecifiedCityWeatherViewController alloc] initWithCityCode:cityCode cityName:cityName];
    [self.navigationController pushViewController:cityWeather animated:YES];
    [cityWeather release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.allCityCodes allKeys] count];
}
@end
