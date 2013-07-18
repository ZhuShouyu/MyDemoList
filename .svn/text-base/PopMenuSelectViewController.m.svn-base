//
//  PopMenuSelectViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/10/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "PopMenuSelectViewController.h"

#define ICON_WIDTH  40
#define ICON_HEIGHT 40
#define ICON_SPAACE 10
#define ICON_AMOUNT_PER_ROW 5

@interface PopMenuSelectViewController ()
@property (nonatomic, retain) CMPopTipView *popMenuView;
@property (nonatomic, retain) NSArray *resourceImages;
@property (nonatomic, retain) UIButton *menuSelecetButton;
@property (nonatomic, assign) NSInteger currentSelectMenu;
@property (nonatomic, retain) UIView *mainMenuView;

- (void)toUpdateTheSelectedMenu:(id)sender;

- (void)showMenuView:(id)sender;
@end

@implementation PopMenuSelectViewController
@synthesize popMenuView = _popMenuView;
@synthesize resourceImages = _resourceImages;
@synthesize menuSelecetButton = _menuSelecetButton;
@synthesize currentSelectMenu = _currentSelectMenu;
@synthesize mainMenuView = _mainMenuView;

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
            self.mainTitle = [NSString stringWithFormat:@"弹出式选择菜单"];
            self.descriptionTitle = [NSString stringWithFormat:@"由于在iPhone上并没有popView，因此采用自定的popView"];
        }
    }
    return self;
}

- (UIView *)mainMenuView
{
    if (nil == _mainMenuView)
    {
        _mainMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ICON_AMOUNT_PER_ROW * (ICON_WIDTH + ICON_SPAACE) + ICON_SPAACE, ([self.resourceImages count] / ICON_AMOUNT_PER_ROW + 1) * (ICON_HEIGHT + ICON_SPAACE) + ICON_SPAACE)];
        int startX = 0;
        int startY = 0;
        for (int i = 0; i < [self.resourceImages count]; i ++)
        {
            startY = (i / ICON_AMOUNT_PER_ROW + 1) * ICON_SPAACE + i / ICON_AMOUNT_PER_ROW * ICON_HEIGHT;
            
            CGRect currentFrame = CGRectMake(startX + ICON_SPAACE, startY, ICON_WIDTH, ICON_HEIGHT);
            UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
            tempButton.highlighted = NO;
            tempButton.tag = 1000 + i;
            [tempButton setBackgroundImage:[UIImage imageNamed:[self.resourceImages objectAtIndex:i]] forState:UIControlStateNormal];
            tempButton.frame = currentFrame;
            [tempButton addTarget:self action:@selector(toUpdateTheSelectedMenu:) forControlEvents:UIControlEventTouchUpInside];
            [_mainMenuView addSubview:tempButton];
            if (i % ICON_AMOUNT_PER_ROW == ICON_AMOUNT_PER_ROW - 1)
            {
                startX = 0;
            }
            else
            {
                startX += ICON_WIDTH + ICON_SPAACE;
            }
        }
    }
    UIButton *button = (UIButton *)[_mainMenuView viewWithTag:1000 + self.currentSelectMenu];
    button.highlighted = YES;
    return _mainMenuView;
}

//- (CMPopTipView *)popMenuView
//{
//    if (nil == _popMenuView)
//    {
//        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ICON_AMOUNT_PER_ROW * (ICON_WIDTH + ICON_SPAACE) + ICON_SPAACE, ([self.resourceImages count] / ICON_AMOUNT_PER_ROW + 1) * (ICON_HEIGHT + ICON_SPAACE) + ICON_SPAACE)];
//        int startX = 0;
//        int startY = 0;
//        for (int i = 0; i < [self.resourceImages count]; i ++)
//        {
//            startY = (i / ICON_AMOUNT_PER_ROW + 1) * ICON_SPAACE + i / ICON_AMOUNT_PER_ROW * ICON_HEIGHT;
//
//            CGRect currentFrame = CGRectMake(startX + ICON_SPAACE, startY, ICON_WIDTH, ICON_HEIGHT);
//            UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            [tempButton setBackgroundImage:[UIImage imageNamed:[self.resourceImages objectAtIndex:i]] forState:UIControlStateNormal];
//            tempButton.frame = currentFrame;
//            [tempButton addTarget:self action:@selector(toUpdateTheSelectedMenu:) forControlEvents:UIControlEventTouchUpInside];
//            [tempView addSubview:tempButton];
//            if (i % ICON_AMOUNT_PER_ROW == ICON_AMOUNT_PER_ROW - 1)
//            {
//                startX = 0;
//            }
//            else
//            {
//                startX += ICON_WIDTH + ICON_SPAACE;
//            }
//        }
//        _popMenuView = [[CMPopTipView alloc] initWithCustomView:tempView];
//        _popMenuView.backgroundColor = [UIColor darkGrayColor];
//        _popMenuView.animation = arc4random() % 2;
//        _popMenuView.delegate = self;
//        
//    }
//    return _popMenuView;
//}

- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView
{
    
}

- (NSArray *)resourceImages
{
    if (nil == _resourceImages)
    {
        _resourceImages = [[NSArray alloc] initWithObjects:
                           @"plan_rest.png",
                           @"plan_train.png",
                           @"plan_structure.png",
                           @"plan_nature.png",
                           @"plan_walk.png",
                           @"plan_shopping.png",
                           @"plan_eat.png",
                           @"plan_plane.png",
                           @"plan_sports.png",
                           @"plan_nature.png",
                           @"plan_walk.png",
                           @"plan_shopping.png",
                           @"plan_eat.png",
                           @"plan_plane.png",
                           @"plan_sports.png",
                           @"plan_eat.png",
                           @"plan_plane.png",
                           @"plan_sports.png",
                           @"plan_rest.png",
                           @"plan_structure.png", nil];
    }
    return _resourceImages;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.currentSelectMenu = 0;
    self.menuSelecetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.menuSelecetButton.frame = CGRectMake(0, 0, 40, 40);
    self.menuSelecetButton.center = CGPointMake(160, 40);
    [self.menuSelecetButton setBackgroundImage:[UIImage imageNamed:@"plan_rest.png"] forState:UIControlStateNormal];
    [self.menuSelecetButton addTarget:self action:@selector(showMenuView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuSelecetButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.popMenuView = nil;
    self.resourceImages = nil;
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    [super dealloc];
}

- (void)toUpdateTheSelectedMenu:(id)sender
{
    UIButton *button = (UIButton *)sender;
    self.currentSelectMenu = button.tag - 1000;
    
    [self.menuSelecetButton setBackgroundImage:[UIImage imageNamed:[self.resourceImages objectAtIndex:button.tag - 1000]] forState:UIControlStateNormal];
}

- (void)showMenuView:(id)sender
{
    _popMenuView = [[CMPopTipView alloc] initWithCustomView:self.mainMenuView];
    _popMenuView.delegate = self;
    _popMenuView.backgroundColor = [UIColor darkGrayColor];
    [_popMenuView presentPointingAtView:self.menuSelecetButton inView:self.view animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.popMenuView)
    {
        [self.popMenuView dismissAnimated:YES];
        self.popMenuView = nil;
    }
}
@end
