//
//  UICollectionViewTestViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 3/5/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "UICollectionViewTestViewController.h"
#import "MyCollectionViewCell.h"
#import "MyCollectionViewLayout.h"

static NSString *Identifier = @"MyCollectionViewCell";

@interface UICollectionViewTestViewController ()
@property (nonatomic, assign) NSInteger itemsCount;
@property (nonatomic, retain) UICollectionView *collectionView;
@end

@implementation UICollectionViewTestViewController
@synthesize itemsCount = _itemsCount;
@synthesize collectionView = _collectionView;

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
            self.mainTitle = [NSString stringWithFormat:@"%@", @"UICollectionView"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"UICollectionView的一些测试，不过只在IOS6.0及以上才可以使用"];
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
    self.itemsCount = 20;
    
    MyCollectionViewLayout *myLayout = [[MyCollectionViewLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:myLayout];
    self.collectionView = collectionView;
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    [tapRecognizer release];
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:Identifier];
    [myLayout release];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    [collectionView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    return cell;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        if (tappedCellPath!=nil)
        {
            self.itemsCount = self.itemsCount - 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
                
            } completion:nil];
        }
        else
        {
            self.itemsCount = self.itemsCount + 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}
@end
