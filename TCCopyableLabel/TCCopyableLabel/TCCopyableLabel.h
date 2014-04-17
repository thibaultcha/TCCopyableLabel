//
//  TCCopyableLabel.h
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TCCopyableLabelDelegate;

@interface TCCopyableLabel : UILabel
@property (nonatomic, unsafe_unretained) id<TCCopyableLabelDelegate> delegate;
@property (nonatomic, assign, setter = setCopyingEnabled:, getter = isCopyingEnabled) BOOL copyingEnabled;
@property (nonatomic, assign, setter = setMinimumPressDuration:) CFTimeInterval minimumPressDuration;
@property (nonatomic, copy) NSString *customString;
@end

@protocol TCCopyableLabelDelegate <NSObject>
@optional
- (void)label:(TCCopyableLabel *)copyableLabel didCopyText:(NSString *)copiedText;
@end