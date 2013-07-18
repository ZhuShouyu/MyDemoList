//
//  GCDBackgroundCaculatorViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 3/7/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "GCDBackgroundCaculatorViewController.h"

@interface GCDBackgroundCaculatorViewController ()
@property (strong, nonatomic) NSString *result;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImage *image;
@end

@implementation GCDBackgroundCaculatorViewController
@synthesize result = _result;
@synthesize tableView = _tableView;
@synthesize image = _image;

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"多线程，大量数据计算而不会出现僵死"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"通过GCD的方法来实现该功能"];
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
- (void)downloadCellImageWithDispatch:(NSIndexPath *)indexPath;
{
//    __block UIImage *cellImage = nil;
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
//        __block UIImage *image = nil;
        dispatch_sync(concurrentQueue, ^{ /* Download the image here */
            /* iPad's image from Apple's website. Wrap it into two lines as the URL is too long to fit into one line */
            NSString *urlAsString = @"http://images.apple.com/mobileme/features/images/ipad_findyouripad_20100518.jpg";
            NSURL *url = [NSURL URLWithString:urlAsString];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            NSError *downloadError = nil;
            NSData *imageData = [NSURLConnection
                                 sendSynchronousRequest:urlRequest returningResponse:nil error:&downloadError];
            if (downloadError == nil && imageData != nil){
                self.image = [UIImage imageWithData:imageData]; /* We have the image. We can use it now */
            }
            else if (downloadError != nil){
                NSLog(@"Error happened = %@", downloadError);
            }
            else
            {
                NSLog(@"No data could get downloaded from the URL.");
            }
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            /* Show the image to the user here on the main queue*/
            if (self.image != nil)
            {
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
                self.image = nil;
                /* Create the image view here */
//                UIImageView *imageView = [[UIImageView alloc]
//                                          initWithFrame:self.view.bounds];
//                /* Set the image */ [imageView setImage:image];
//                /* Make sure the image is not scaled incorrectly */
//                [imageView setContentMode:UIViewContentModeScaleAspectFit];
//                /* Add the image to this view controller's view */
//                [self.view addSubview:imageView];
            }
            else
            {
                NSLog(@"Image isn't downloaded. Nothing to display.");
            }
        });
    });
}

- (void)downloadImage:(UITableViewCell *)cell
{
    UIImage *image = nil;
    NSString *urlAsString = @"http://images.apple.com/mobileme/features/images/ipad_findyouripad_20100518.jpg";
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSError *downloadError = nil;
    NSData *imageData = [NSURLConnection
                         sendSynchronousRequest:urlRequest returningResponse:nil error:&downloadError];
    if (downloadError == nil && imageData != nil){
        image = [UIImage imageWithData:imageData]; /* We have the image. We can use it now */
    }
    else if (downloadError != nil){
        NSLog(@"Error happened = %@", downloadError);
    }
    else
    {
        NSLog(@"No data could get downloaded from the URL.");
    }
    if (nil != image)
    {
        NSLog(@"indexPath:%d", [[self.tableView indexPathForCell:cell] row]);
        cell.imageView.image = image;
    }
}

//- ()

- (void)downloadCellImageWithInvocationOperation:(UITableViewCell *)cell
{
    NSInvocationOperation *downloadInvocation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:cell];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:downloadInvocation];
    [downloadInvocation release];
    [queue release];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    self.tableView.frame = self.view.bounds;
    dispatch_queue_t gloableQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(gloableQueue, ^{
        __block NSDate *date = [NSDate date];
        dispatch_sync(gloableQueue, ^{
            [self caculatingSomethingForLongTime];
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"-----%f", [[NSDate date] timeIntervalSinceDate:date]);
            [self.tableView reloadData];
        });
    });
//    [self caculatingSomethingForLongTime];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)caculatingSomethingForLongTime
{
#if 0
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_queue_create("com.hello.test", nil);
    __block int sum = 0;
    dispatch_block_t block = ^(void){
        for (int i = 0; i < 100000000; i ++)
        {
            sum += arc4random();
        }
        dispatch_semaphore_signal(semaphore);
    };
    dispatch_async(queue, block);
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    self.result = [NSString stringWithFormat:@"%d", sum];
    [self.tableView reloadData];
    dispatch_release(semaphore);
    dispatch_release(queue);
#else
    int sum = 0;
    for (int i = 0; i < 1000000000; i ++)
    {
        sum += arc4random();
    }
    self.result = [NSString stringWithFormat:@"%d", sum];
#endif
}
#pragma mark - UITableView Data Source & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    if (nil == self.result)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"Caculating...";
        }
        else
        {
            cell.textLabel.text = nil;
        }
    }
    else
    {
        cell.textLabel.text = self.result;
    }
//    [self downloadCellImageWithInvocationOperation:cell];
    if (self.image)
    {
        cell.imageView.image = self.image;
    }
    else
    {
        [self downloadCellImageWithDispatch:indexPath];
    }
    return cell;
}
@end
