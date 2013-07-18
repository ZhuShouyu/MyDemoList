//
//  MyDemoListViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 12/26/12.
//  Copyright (c) 2012 zhu shouyu. All rights reserved.
//

#import "MyDemoListViewController.h"
#import "MyDemoListResource.h"
#import "ModelViewController.h"
#define OBJ_NAME(x) @#x
@interface MyDemoListViewController ()

@end

@implementation MyDemoListViewController

- (void)viewWillAppear:(BOOL)animated
{
    for (UIView *tempView in self.view.subviews)
    {
        if ([tempView isKindOfClass:[UITableView class]])
        {
            tempView.frame = self.view.frame;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"Demo List"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor whiteColor]];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView release];
    NSLog(@"----%@", OBJ_NAME(tableView));
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeLeft;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    for (UIView *tempView in self.view.subviews)
    {
        if ([tempView isKindOfClass:[UITableView class]])
        {
            tempView.frame = self.view.frame;
        }
    }
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        return NO;
    }
    return YES;
}

- (void)test:(void(^)(int index))hello world:(void(^)(void))nothing
{
    hello(999);
    NSLog(@"-----");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDatasource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MyDemoListResource sharedResource].resource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
    }
    ModelViewController *viewController = (ModelViewController *)[[MyDemoListResource sharedResource].resource objectAtIndex:indexPath.row];
    cell.textLabel.text = viewController.mainTitle;
    cell.detailTextLabel.text = viewController.descriptionTitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelViewController *viewController = (ModelViewController *)[[MyDemoListResource sharedResource].resource objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"-----------");
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    float percent = scrollView.contentOffset.y / scrollView.contentSize.height;
//    percent = 0.25 + 3 * (MAX(MIN(1.0f, percent), 0.0f) / 4.0f);
//    ((UITableView *)scrollView).backgroundColor = [UIColor colorWithRed:(percent * 0.20392) green:(percent * 0.19607) blue:(percent * 061176) alpha:1.0f];
}

@end
