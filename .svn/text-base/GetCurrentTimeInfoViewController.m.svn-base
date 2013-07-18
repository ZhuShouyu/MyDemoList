
//  GetCurrentTimeInfoViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/8/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "GetCurrentTimeInfoViewController.h"

@interface GetCurrentTimeInfoViewController ()
@property (nonatomic, retain) UILabel *currentDate;
@property (nonatomic, retain) UILabel *monthLabel;
@property (nonatomic, retain) UILabel *weekLabel;
@property (nonatomic, retain) UILabel *yearLabel;
@property (nonatomic, retain) UILabel *startLabel;
@property (nonatomic, retain) UILabel *endLabel;
@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UITextView *detailInfo;

- (void)toShowDatePicker;
- (void)updateTheTextViewInfo;
@end

@implementation GetCurrentTimeInfoViewController
@synthesize currentDate = _currentDate;
@synthesize monthLabel = _monthLabel;
@synthesize weekLabel = _weekLabel;
@synthesize yearLabel = _yearLabel;
@synthesize startLabel = _startLabel;
@synthesize endLabel = _endLabel;
@synthesize datePicker = _datePicker;
@synthesize detailInfo = _detailInfo;

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
}

- (void)dealloc
{
    self.currentDate = nil;
    self.monthLabel = nil;
    self.weekLabel = nil;
    self.yearLabel = nil;
    self.startLabel = nil;
    self.endLabel = nil;
    self.datePicker = nil;
    self.detailInfo = nil;
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    [super dealloc];
}
- (UIDatePicker *)datePicker
{
    if (nil == _datePicker)
    {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _datePicker.center = self.view.center;
        _datePicker.alpha = 0.0f;
        [self.view addSubview:_datePicker];
    }
    return _datePicker;
}
- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"%@", @"显示当前时间的详细信息"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"获得当前时间的天数，日期，第几周，星期几等等"];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _currentDate = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 40)];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = [NSString stringWithFormat:@"yyyy-MM-DD"];
    self.currentDate.text = [dateFormater stringFromDate:date];
    [self.view addSubview:self.currentDate];
    [dateFormater release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 10, 150, 40);
    [button setTitle:@"选择日期" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(toShowDatePicker) forControlEvents:UIControlEventTouchUpInside];
    
    _detailInfo = [[UITextView alloc] initWithFrame:CGRectMake(0, 150, 320, 300)];
    self.detailInfo.userInteractionEnabled = NO;
//    self.detailInfo.allowsEditingTextAttributes = NO;
    [self.view addSubview:self.detailInfo];
    [self updateTheTextViewInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateTheTextViewInfo];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.datePicker.alpha = 0.0f;
    [UIView commitAnimations];
}

#pragma mark - Custom Method
- (void)toShowDatePicker
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.datePicker.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)updateTheTextViewInfo
{
    NSDate *date = [self.datePicker date];
    if (nil == date)
    {
        date = [NSDate date];
    }
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = [NSString stringWithFormat:@"yyyy-MM-dd"];
    self.currentDate.text = [dateFormater stringFromDate:date];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    /*
     kCFCalendarUnitEra = (1UL << 1),
     kCFCalendarUnitYear = (1UL << 2),
     kCFCalendarUnitMonth = (1UL << 3),
     kCFCalendarUnitDay = (1UL << 4),
     kCFCalendarUnitHour = (1UL << 5),
     kCFCalendarUnitMinute = (1UL << 6),
     kCFCalendarUnitSecond = (1UL << 7),
     kCFCalendarUnitWeek = (1UL << 8)  CF_DEPRECATED(10_4, 10_7, 2_0, 5_0)
	kCFCalendarUnitWeekday = (1UL << 9),
	kCFCalendarUnitWeekdayOrdinal = (1UL << 10),
	kCFCalendarUnitQuarter CF_ENUM_AVAILABLE(10_6, 4_0) = (1UL << 11),
	kCFCalendarUnitWeekOfMonth CF_ENUM_AVAILABLE(10_7, 5_0) = (1UL << 12),
	kCFCalendarUnitWeekOfYear CF_ENUM_AVAILABLE(10_7, 5_0) = (1UL << 13),
	kCFCalendarUnitYearForWeekOfYear CF_ENUM_AVAILABLE(10_7, 5_0) = (1UL << 14),
     */
    NSDateComponents *components = [calendar components:(kCFCalendarUnitEra | kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond | kCFCalendarUnitWeek | kCFCalendarUnitWeekday | kCFCalendarUnitWeekOfMonth | kCFCalendarUnitWeekOfYear) fromDate:date];
//    NSInteger month = [components month];
//    NSInteger day = [components day];
    NSInteger weekDay = [components weekday];
    
//    BOOL isToday = NO;
//    NSDateComponents *today = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
//    if([today day] == day && [today month] == month)
//    {
//        isToday = YES;
//    }
    
    NSString *weekDayDes = nil;
    switch (weekDay)
    {
        case 1:
            weekDayDes = @"星期日";
            break;
        case 2:
            weekDayDes = @"星期一";
            break;
        case 3:
            weekDayDes = @"星期二";
            break;
        case 4:
            weekDayDes = @"星期三";
            break;
        case 5:
            weekDayDes = @"星期四";
            break;
        case 6:
            weekDayDes = @"星期五";
            break;
        case 7:
            weekDayDes = @"星期六";
            break;
        default:
            break;
    }
    /*
     - (NSInteger)era;
     - (NSInteger)year;
     - (NSInteger)month;
     - (NSInteger)day;
     - (NSInteger)hour;
     - (NSInteger)minute;
     - (NSInteger)second;
     - (NSInteger)week;
     - (NSInteger)weekday;
     - (NSInteger)weekdayOrdinal;
     - (NSInteger)quarter NS_AVAILABLE(10_6, 4_0);
     - (NSInteger)weekOfMonth NS_AVAILABLE(10_7, 5_0);
     - (NSInteger)weekOfYear NS_AVAILABLE(10_7, 5_0);
     - (NSInteger)yearForWeekOfYear NS_AVAILABLE(10_7, 5_0);
     */
    NSString *tempString = [NSString stringWithFormat:@"日期：%@\n纪元：%d\n年：%d\n月:%d\n日：%d\n小时：%d\n分钟：%d\n秒：%d\n周：%d\n星期：%@\n本月第几周：%d\n本年第几周：%d", [dateFormater stringFromDate:date], [components era], [components year], [components month], [components day], [components hour], [components minute], [components second], [components weekday], weekDayDes, [components weekOfMonth], [components weekOfYear]];
//    NSString *string = [NSString stringWithFormat:@"日期：%@\n月份：%d\n天数：%d\n小时：%d\n分钟：%d\n秒：%d\n周:%d\n星期：%d\n本月第几周:%d\n本年第几周：%d\n", [dateFormater stringFromDate:date], month, day, [components hour], [components minute], [components second], [components week], [components weekday], [components weekOfMonth], [compomtens weekOfYear]];
    self.detailInfo.text = tempString;
    [dateFormater release];
}
@end
