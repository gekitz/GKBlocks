//
// Created by Georg Kitz on 19/05/14.
// Copyright (c) 2014 Aurora Apps. All rights reserved.
//

@import UIKit;

typedef void(^GKAlertViewBlock)(UIAlertView *alertView, NSInteger buttonIndex);
@interface UIAlertView (GKBlockAddition)
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message block:(GKAlertViewBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;
@end