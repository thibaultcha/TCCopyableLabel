//
//  TCCopyableLabel.m
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import "TCCopyableLabel.h"

@interface TCCopyableLabel ()
@property (nonatomic, strong) UILongPressGestureRecognizer* longPressGestureRecognizer;
- (void)gestureRecognized:(UILongPressGestureRecognizer *)gestureRecognizer;
@end

@implementation TCCopyableLabel

#pragma mark - Init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

#pragma mark - Internal Methods

- (void)setup
{
    [self setEnableCopying:YES];
    self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(gestureRecognized:)];
    [self addGestureRecognizer:self.longPressGestureRecognizer];
}

- (void)gestureRecognized:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
    
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:self.bounds inView:self];
        [menuController setMenuVisible:YES animated:YES];
    }
}

#pragma mark - Custom Setters

- (void)setEnableCopying:(BOOL)enableCopying
{
    _enableCopying = enableCopying;
    
    [self setUserInteractionEnabled:enableCopying];
}

#pragma mark - UIResponder

- (BOOL)canBecomeFirstResponder
{
    return self.enableCopying;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}

- (void)copy:(id)sender
{
    [[UIPasteboard generalPasteboard] setString:self.text];
}

@end
