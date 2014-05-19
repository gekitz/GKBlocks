//
// Created by Georg Kitz on 19/05/14.
// Copyright (c) 2014 Aurora Apps. All rights reserved.
//

#import "UIActionSheet+GKBlockAddition.h"
#import <objc/runtime.h>

static void *kUIActionSheetBlock = &kUIActionSheetBlock;

@interface UIActionSheet ()<UIActionSheetDelegate>
@property (nonatomic, copy) GKActionSheetBlock gk_block;
@end

@implementation UIActionSheet (Blocks)

#pragma mark -
#pragma mark Properties

- (void)setGk_block:(GKActionSheetBlock)gk_block {
    objc_setAssociatedObject(self, kUIActionSheetBlock, gk_block, OBJC_ASSOCIATION_COPY);
}

- (GKActionSheetBlock)gk_block {
    return objc_getAssociatedObject(self, kUIActionSheetBlock);
}

#pragma mark -
#pragma mark SuperClass

- (instancetype)initWithTitle:(NSString *)title block:(GKActionSheetBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{

    if (self = [self initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil]) {

        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
            [self addButtonWithTitle:arg];
        }
        va_end(args);


        if (destructiveButtonTitle) {
            self.destructiveButtonIndex = [self addButtonWithTitle:destructiveButtonTitle];
        }

        if (cancelButtonTitle) {
            self.cancelButtonIndex = [self addButtonWithTitle:cancelButtonTitle];
        }

        self.gk_block = block;
    }
    return self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.gk_block) {
        self.gk_block(self, buttonIndex);
    }
}
@end
