//
//  StrapButtonViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 10/15/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "StrapButtonViewController.h"
#import "UIButton+Bootstrap.h"

@interface StrapButtonViewController ()

@end

@implementation StrapButtonViewController
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
            self.mainTitle = @"StrapButton";
            self.descriptionTitle = @"不使用图片之类的";
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
    UITableView *mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    mainTableView.dataSource = self;
    [self.view addSubview:mainTableView];
    [mainTableView release];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 210;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tempButton.frame = CGRectMake(10, 0, 100, 40);
        [cell.contentView addSubview:tempButton];
        tempButton.tag = 1000;
    }
    UIButton *tempButton = (UIButton *)[cell.contentView viewWithTag:1000];
    if (tempButton)
    {
        [tempButton removeFromSuperview];
    }
    tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tempButton.frame = CGRectMake(10, 0, 100, 40);
    [cell.contentView addSubview:tempButton];
    tempButton.tag = 1000;
//    [tempButton setTitle:[NSString stringWithFormat:@"%d:%d", indexPath.row, indexPath.section] forState:UIControlStateNormal];
    [tempButton primaryStyle];
    [tempButton addAwesomeIcon:indexPath.row beforeTitle:indexPath.row % 2 ? YES : NO];
    return cell;
}
@end
