//
//  TCCopyableLabel.h
//  TCLabel
//
//  Created by Thibault Charbonnier on 12/04/14.
//  Copyright (c) 2014 Thibault Charbonnier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCCopyableLabel : UILabel
@property (nonatomic, assign, setter = setEnableCopying:) BOOL enableCopying;
@end
