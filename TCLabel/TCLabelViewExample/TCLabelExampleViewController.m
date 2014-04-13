//
//  TCExampleViewViewController.m
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import "TCLabelExampleViewController.h"
#import "TCCopyableLabel.h"

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
    
    for (UIView *subview in self.view.subviews) {
        if (subview.class == [TCCopyableLabel class]) {
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

@end
