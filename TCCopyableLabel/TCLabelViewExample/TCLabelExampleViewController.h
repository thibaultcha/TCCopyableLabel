//
//  TCExampleViewViewController.h
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCCopyableLabel.h"

typedef NS_ENUM(NSUInteger, TCLabelSegmentValue){
    TCLabelSegmentValueEnabled = 0,
    TCLabelSegmentValueDisabled,
};

@interface TCLabelExampleViewController : UIViewController <TCCopyableLabelDelegate>
@property (weak, nonatomic) IBOutlet TCCopyableLabel *longPressLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
