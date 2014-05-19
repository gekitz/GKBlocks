//
// Created by Georg Kitz on 19/05/14.
// Copyright (c) 2014 Aurora Apps. All rights reserved.
//

#import "UIAlertView+GKBlockAddition.h"
#import <objc/runtime.h>

static char *kGKAlertViewBlockKey;

@interface UIAlertView ()<UIAlertViewDelegate>
@property (nonatomic, strong, setter = gk_setBlock :) GKAlertViewBlock gk_block;
@end

@implementation UIAlertView (BlockAddition)

# pragma mark -
# pragma mark Properties

- (void)gk_setBlock:(__strong GKAlertViewBlock)gk_block {
    objc_setAssociatedObject(self, &kGKAlertViewBlockKey, gk_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (GKAlertViewBlock)gk_block {
    return objc_getAssociatedObject(self, &kGKAlertViewBlockKey);
}

# pragma mark -
# pragma mark AlertView Methods

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message block:(GKAlertViewBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    if ((self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil])) {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
            [self addButtonWithTitle:arg];
        }
        va_end(args);

        self.gk_block = block;
    }
    return self;
}

# pragma mark -
# pragma mark UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.gk_block) {
        self.gk_block(self, buttonIndex);
    }
}
@end