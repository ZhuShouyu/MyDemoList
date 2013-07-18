//
//  OuterGlowTextField.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/25/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "OuterGlowTextField.h"

@interface OuterGlowTextField (private)
- (void)textFieldDidBecomeEditing:(NSNotification *)notification;
- (void)textFieldDidEndEditing:(NSNotification *)notification;
@end

@implementation OuterGlowTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
       cornerRadius:(CGFloat)radius
        borderWidth:(CGFloat)tempBorderWidth
        borderColor:(UIColor *)tempBorderColor
         lightColor:(UIColor *)tempLightColor
         lightWidth:(CGFloat)tempLightWidth
   lightBorderColor:(UIColor *)tempLightBorderColor
{
    if (self = [super initWithFrame:frame])
    {
        cornerRadius = radius;
        borderWidth = tempBorderWidth;
        borderColor = [[UIColor alloc] initWithCGColor:borderColor.CGColor];
        lightColor = [[UIColor alloc] initWithCGColor:tempLightColor.CGColor];
        lightWidth = tempLightWidth;
        lightBorderColor = [[UIColor alloc] initWithCGColor:tempLightBorderColor.CGColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBecomeEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
        
        self.layer.cornerRadius = cornerRadius;
        self.layer.borderColor = borderColor.CGColor;
        self.layer.borderWidth = borderWidth;
		[self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setMasksToBounds:NO];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
    [super dealloc];
}

- (void)textFieldDidBecomeEditing:(NSNotification *)notification
{
    [[self layer] setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    [[self layer] setShadowRadius:lightWidth];
    [[self layer] setShadowOpacity:1.0f];
    [[self layer] setBorderColor:lightColor.CGColor];
    [[self layer] setShadowColor:lightBorderColor.CGColor];    
}

- (void)textFieldDidEndEditing:(NSNotification *)notification
{
	[[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowRadius:0];
    [[self layer] setShadowOpacity:0];
    [[self layer] setShadowColor:nil];
	[self.layer setBorderColor:borderColor.CGColor];
}

- (CGRect) textRectForBounds:(CGRect)bounds
{
	CGRect inset = CGRectMake(bounds.origin.x + cornerRadius * 2,
							  bounds.origin.y,
							  bounds.size.width - cornerRadius * 2,
							  bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
	CGRect inset = CGRectMake(bounds.origin.x + cornerRadius * 2,
							  bounds.origin.y,
							  bounds.size.width - cornerRadius * 2,
							  bounds.size.height);
    return inset;
}

@end
