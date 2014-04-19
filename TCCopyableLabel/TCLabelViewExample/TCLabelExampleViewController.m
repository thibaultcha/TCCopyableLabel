//
//  TCExampleViewViewController.m
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import "TCLabelExampleViewController.h"

@interface TCLabelExampleViewController ()
@property (nonatomic, strong) NSMutableArray *copyableLabels;
- (void)handleSegmentedValueChanged:(UISegmentedControl *)segmentedControl;
@end

@implementation TCLabelExampleViewController

#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.copyableLabels = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - View Management

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.longPressLabel setMinimumPressDuration:3];
    [self.customTextLabel setCustomString:@"Custom copied string"];
    
    for (UIView *subview in self.view.subviews) {
        if (subview.class == [TCCopyableLabel class]) {
            [(TCCopyableLabel *)subview setDelegate:self];
            [self.copyableLabels addObject:subview];
        }
    }
    
    [self.segmentedControl addTarget:self
                              action:@selector(handleSegmentedValueChanged:)
                    forControlEvents:UIControlEventValueChanged];
    [self.segmentedControl setSelectedSegmentIndex:TCLabelSegmentValueEnabled];
}

#pragma mark - UISegmentedControl

- (void)handleSegmentedValueChanged:(UISegmentedControl *)segmentedControl
{
    BOOL enabled = (segmentedControl.selectedSegmentIndex == TCLabelSegmentValueEnabled);
    [self.copyableLabels enumerateObjectsUsingBlock:^(TCCopyableLabel *label, NSUInteger idx, BOOL *stop) {
        [label setCopyingEnabled:enabled];
    }];
}

#pragma mark - TCCopyableLabelDelegate

- (void)label:(TCCopyableLabel *)copyableLabel didCopyText:(NSString *)copiedText
{
    NSString *text = [NSString stringWithFormat:@"Clipboard content: %@", [[UIPasteboard generalPasteboard] string]];
    [self.textView setText:text];
}

@end
