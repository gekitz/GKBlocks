//
// Created by Georg Kitz on 19/05/14.
// Copyright (c) 2014 Aurora Apps. All rights reserved.
//

@import UIKit;

typedef void(^GKActionSheetBlock)(UIActionSheet *sheet, NSInteger buttonIndex);
@interface UIActionSheet (GKBlockAddition)
- (instancetype)initWithTitle:(NSString *)title block:(GKActionSheetBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;
@end