//
//  ChangeTableViewBackgroundColorWhenScroll.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/4/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "ChangeTableViewBackgroundColorWhenScroll.h"

@interface ChangeTableViewBackgroundColorWhenScroll ()
@property (nonatomic, retain) NSArray *allValues;
@end

@implementation ChangeTableViewBackgroundColorWhenScroll
@synthesize allValues = _allValues;

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
    self.allValues = nil;
    [super dealloc];
}

- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"%@", @"通过背景色呈现滚动深度"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"修改背景颜色，根据当前的偏移百分比"];
        }
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allValues = [UIFont familyNames];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor colorWithRed:(0.5f * 0.20392) green:(0.5f * 0.19607) blue:(0.5f * 0.61176) alpha:1.0f];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allValues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [self.allValues objectAtIndex:indexPath.row % [self.allValues count]];
    cell.detailTextLabel.font = [UIFont fontWithName:[self.allValues objectAtIndex:indexPath.row % [self.allValues count]] size:12.0f];
    cell.detailTextLabel.text = [self.allValues objectAtIndex:indexPath.row % [self.allValues count]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float percent = scrollView.contentOffset.y / scrollView.contentSize.height;
    percent = 0.5 + (MAX(MIN(1.0f, percent), 0.0f) / 2.0f);
    ((UITableView *)scrollView).backgroundColor = [UIColor colorWithRed:(percent * 0.20392) green:(percent * 0.19607) blue:(percent * 0.61176) alpha:1.0f];    
}

#pragma mark - Table view delegate
@end
