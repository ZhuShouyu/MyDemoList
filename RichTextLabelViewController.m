//
//  RichTextLabelViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 6/21/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "RichTextLabelViewController.h"

@interface RichTextLabelViewController ()

@property(nonatomic, strong) NSArray* matches;

@property (nonatomic, strong) PPLabel *myLabel;
@end

@implementation RichTextLabelViewController

@synthesize matches = _matches;
@synthesize myLabel = _myLabel;

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
            self.mainTitle = [NSString stringWithFormat:@"RichTextLabel"];
            self.descriptionTitle = [NSString stringWithFormat:@"Rich Text Label"];
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

-(BOOL)attributedLabel:(OHAttributedLabel*)attributedLabel shouldFollowLink:(NSTextCheckingResult*)linkInfo
{
    return YES;
}

-(UIColor*)colorForLink:(NSTextCheckingResult*)linkInfo underlineStyle:(int32_t*)underlineStyle
{
    if (linkInfo.resultType == NSTextCheckingTypePhoneNumber)
    {
        return [UIColor redColor];
    }
    else
    {
        return [UIColor blackColor];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];/////////ds
//    [self.view setBackgroundColor:[UIColor redColor]];
//    OHAttributedLabel *label = [[OHAttributedLabel alloc] initWithFrame:self.view.bounds];
//    label.textColor = [UIColor greenColor];
//    label.text = @"Hello World 12345678909china";
//    label.delegate = self;
//    [self.view addSubview:label];
    self.myLabel = [[PPLabel alloc] initWithFrame:self.view.bounds];
    
    self.myLabel.delegate = self;
    self.myLabel.text = @"hekko wfshhsdhs 10086111111法国非官方公开共和国";
    [self.view addSubview:self.myLabel];
    
    NSError *error = NULL;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error];
    
    self.matches = [detector matchesInString:self.myLabel.text options:0 range:NSMakeRange(0, self.myLabel.text.length)];
    
    [self highlightLinksWithIndex:NSNotFound];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)label:(PPLabel *)label didBeginTouch:(UITouch *)touch onCharacterAtIndex:(CFIndex)charIndex {
    
    [self highlightLinksWithIndex:charIndex];
}

- (void)label:(PPLabel *)label didMoveTouch:(UITouch *)touch onCharacterAtIndex:(CFIndex)charIndex {
    
    [self highlightLinksWithIndex:charIndex];
}

- (void)label:(PPLabel *)label didEndTouch:(UITouch *)touch onCharacterAtIndex:(CFIndex)charIndex {
    
    [self highlightLinksWithIndex:NSNotFound];
    
    for (NSTextCheckingResult *match in self.matches) {
        
        if ([match resultType] == NSTextCheckingTypePhoneNumber) {
            
            NSRange matchRange = [match range];
            
            if ([self isIndex:charIndex inRange:matchRange]) {
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", match.phoneNumber]]];
                break;
            }
        }
    }
    
}

- (void)label:(PPLabel *)label didCancelTouch:(UITouch *)touch {
    
    [self highlightLinksWithIndex:NSNotFound];
}

#pragma mark -

- (BOOL)isIndex:(CFIndex)index inRange:(NSRange)range {
    return index > range.location && index < range.location+range.length;
}

- (void)highlightLinksWithIndex:(CFIndex)index {
    
    NSMutableAttributedString* attributedString = [self.myLabel.customAttributedText mutableCopy];
    
    for (NSTextCheckingResult *match in self.matches) {
        
        if ([match resultType] == NSTextCheckingTypePhoneNumber) {
            
            NSRange matchRange = [match range];
            
            if ([self isIndex:index inRange:matchRange]) {
                [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:matchRange];
            }
            else {
                [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:matchRange];
            }
            
            [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:matchRange];
        }
    }
    
    self.myLabel.customAttributedText = attributedString;
}

@end
