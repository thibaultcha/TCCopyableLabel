//
//  TCCopyableLabel.h
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TCCopyableLabelDelegate;

/**
 `TCCopyableLabel` is a subclass of `UILabel` with optional properties to allow it
 to be copied to the clipboard by a user.
 */
@interface TCCopyableLabel : UILabel

/**
 Optional. A delegate that can be notified when a user copies the label.
 
 @since 1.0
 */
@property (nonatomic, unsafe_unretained) id<TCCopyableLabelDelegate> delegate;

/**
 Optional. A block to be performed when a user copies the label.
 
 @since 1.0
 */
@property (nonatomic, copy) void (^labelCopied)(NSString *copiedString);

/**
 Indicates if the label can be copied or not. If set to `NO`, the label will behave as
 a standard `UILabel`

 @since 1.0
 */
@property (nonatomic, assign, setter = setCopyingEnabled:, getter = isCopyingEnabled) BOOL copyingEnabled;

/**
 The duration of the press event for the copy menu to appear.
 
 @since 1.0
 */
@property (nonatomic, assign, setter = setMinimumPressDuration:) CFTimeInterval minimumPressDuration;

/**
 A custom string to be copied instead of the label's `text` property. Usefull to perform some
 formatting that could make the user's life easier.
 
 @since 1.0
 */
@property (nonatomic, copy) NSString *customString;

/**
 Instanciates a `TCCopyabelLabel` and sets its delegate
 
 @since 1.0
 */
- (instancetype)initWithFrame:(CGRect)frame delegate:(id<TCCopyableLabelDelegate>)delegate;

/**
 Instanciates a `TCCopyableLabel` with a `copyBlock`
 
 @see copyBlock
 
 @since 1.0
 */
- (instancetype)initWithFrame:(CGRect)frame copiedBlock:(void (^)(NSString *copiedString))copiedBlock;

@end

@protocol TCCopyableLabelDelegate <NSObject>
@optional

/**
 Optional. Called when a user copied the text of a label.
 */
- (void)label:(TCCopyableLabel *)copyableLabel didCopyText:(NSString *)copiedText;
@end