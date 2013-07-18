//
//  UIRefreshControllViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 12/27/12.
//  Copyright (c) 2012 zhu shouyu. All rights reserved.
//

#import "UIRefreshControllViewController.h"

@interface UIRefreshControllViewController ()
@property (nonatomic, retain) UITableViewController *tableViewController;
@property (nonatomic, retain) UIRefreshControl *refreshControl;
@property (nonatomic, assign) NSInteger count;

- (void)refreshControllMethod;

- (void)endRefreshControllMethod;
@end

@implementation UIRefreshControllViewController
@synthesize tableViewController = _tableViewController;
@synthesize refreshControl = _refreshControl;
@synthesize count = _count;

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
}

- (void)dealloc
{
    self.mainTitle = nil;
    self.descriptionTitle = nil;
    self.tableViewController = nil;
    self.refreshControl = nil;
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"UIRefreshControl test"];
            self.descriptionTitle = [NSString stringWithFormat:@"Avaliable only in IOS 6.0 or above"];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.count = 0;
    
    _tableViewController = [[UITableViewController alloc] init];
    self.tableViewController.tableView.frame = self.view.bounds;
    self.tableViewController.tableView.dataSource = self;
    self.tableViewController.tableView.delegate = self;
    
    UIRefreshControl *refreshControll = [[UIRefreshControl alloc] init];
    NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    refreshControll.attributedTitle = titleString;
    [titleString release];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0)
    {
        self.tableViewController.refreshControl = refreshControll;
    }
    self.refreshControl = refreshControll;
    [refreshControll release];
    [refreshControll addTarget:self action:@selector(refreshControllMethod) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.tableViewController.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Method
- (void)refreshControllMethod
{
    if (self.refreshControl.refreshing)
    {
        self.count ++;
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"刷新中"];
        self.refreshControl.attributedTitle = string;
        [string release];
        
        [self performSelector:@selector(endRefreshControllMethod) withObject:nil afterDelay:2.0f];
    }
}

- (void)endRefreshControllMethod
{
    [self.refreshControl endRefreshing];
    NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    self.refreshControl.attributedTitle = titleString;
    [titleString release];
    
    [self.tableViewController.tableView reloadData];
}

#pragma mark - UITableViewDatasource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"My %d refresh time", self.count];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
