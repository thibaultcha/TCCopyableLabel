//
//  TCCopyableLabel.h
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCCopyableLabel : UILabel
@property (nonatomic, assign, setter = setCopyingEnabled:, getter = isCopyingEnabled) BOOL copyingEnabled;
@property (nonatomic, assign, setter = setMinimumPressDuration:) CFTimeInterval minimumPressDuration;
@property (nonatomic, copy) NSString *customString;
@end
