//
//  MyCollectionViewCell.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 3/5/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
@synthesize imageView = _imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.contentView.layer.cornerRadius = 10.0f;
        [self.contentView setFrame:CGRectMake(0, 0, 75, 75)];
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor underPageBackgroundColor];
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"balloon.png"]];
        
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.cornerRadius = 10.0;
        [self.imageView setFrame:self.contentView.frame];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
