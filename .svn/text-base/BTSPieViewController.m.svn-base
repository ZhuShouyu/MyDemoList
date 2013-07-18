//
//  BTSPieViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 3/1/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "BTSPieViewController.h"
#import "BTSSliceData.h"

@interface BTSPieViewController ()
@property (nonatomic, retain) NSArray *avaliableColors;
@property (nonatomic, retain) NSMutableArray *sliceValues;
@property (nonatomic, retain) BTSPieView *mainPieView;

@end

@implementation BTSPieViewController
@synthesize avaliableColors = _avaliableColors;
@synthesize sliceValues = _sliceValues;
@synthesize mainPieView = _mainPieView;

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"BTSPie"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"绘制饼图，动画的形式添加"];
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
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    _sliceValues = [[NSMutableArray alloc] initWithCapacity:1];
    self.avaliableColors = [NSArray arrayWithObjects:
                            [UIColor colorWithRed:93.0f/255.0f green:150.0f/255.0f blue:72.0f/255.0f alpha:1.0f],
                            [UIColor colorWithRed:46.0f/255.0f green:87.0f/255.0f blue:140.0f/255.0f alpha:1.0f],
                            [UIColor colorWithRed:231.0f/255.0f green:161.0f/255.0f blue:61.0f/255.0f alpha:1.0f],
                            [UIColor colorWithRed:188.0f/255.0f green:45.0f/255.0f blue:48.0f/255.0f alpha:1.0f],
                            [UIColor colorWithRed:111.0f/255.0f green:61.0f/255.0f blue:121.0f/255.0f alpha:1.0f],
                            [UIColor colorWithRed:125.0f/255.0f green:128.0f/255.0f blue:127.0f/255.0f alpha:1.0f],
                            nil];
    
    BTSPieView *pie = [[BTSPieView alloc] initWithFrame:self.view.bounds];
    [pie setAnimationDuration:10.0f];
    [pie setDataSource:self];
    [pie setDelegate:self];
    [self.view addSubview:pie];
    self.mainPieView = pie;
    [pie reloadData];
    [pie release];
    
    UIStepper *stepper = [[UIStepper alloc] init];
    [stepper addTarget:self action:@selector(stepperButtonClick:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:stepper];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
	// Do any additional setup after loading the view.
}

- (void)stepperButtonClick:(id)sender
{
    UIStepper *stepper = (UIStepper *)sender;
    double currentValue = stepper.value;
    NSLog(@"---%f", currentValue);
    if (currentValue > [self.sliceValues count])
    {
        UIColor *tempColor = [self.avaliableColors objectAtIndex:(int)(currentValue - 1) % [self.avaliableColors count]];
        BTSSliceData *data = [[BTSSliceData alloc] initWithValue:arc4random() % 100 color:tempColor];
        [self.sliceValues addObject:data];
        [data release];
//        [self.mainPieView insertSliceAtIndex:[self.sliceValues count] - 1 animate:YES];
    }
    else if ([self.sliceValues count])
    {
        [self.sliceValues removeLastObject];
//        [self.mainPieView removeSliceAtIndex:[self.sliceValues count] animate:YES];
    }
    [self.mainPieView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BTSPieViewDatasource & BTSPieViewDelegate
- (NSUInteger)numberOfSlicesInPieView:(BTSPieView *)pieView
{
    return [self.sliceValues count];
}

- (CGFloat)pieView:(BTSPieView *)pieView valueForSliceAtIndex:(NSUInteger)index
{
    NSLog(@"---%f", [(BTSSliceData *)[self.sliceValues objectAtIndex:index] value]);
    return [(BTSSliceData *)[self.sliceValues objectAtIndex:index] value];
}

- (UIColor *)pieView:(BTSPieView *)pieView colorForSliceAtIndex:(NSUInteger)index sliceCount:(NSUInteger)sliceCount
{
//    return [UIColor redColor];
    return [(BTSSliceData *)[self.sliceValues objectAtIndex:index] color];
}

- (void)pieView:(BTSPieView *)pieView didDeselectSliceAtIndex:(NSInteger)index
{
    
}

- (void)pieView:(BTSPieView *)pieView didSelectSliceAtIndex:(NSInteger)index
{
    
}

- (void)pieView:(BTSPieView *)pieView willSelectSliceAtIndex:(NSInteger)index
{
    
}

- (void)pieView:(BTSPieView *)pieView willDeselectSliceAtIndex:(NSInteger)index
{
    
}
@end
