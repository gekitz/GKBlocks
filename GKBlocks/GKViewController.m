//
//  GKViewController.m
//  GKBlocks
//
//  Created by Georg Kitz on 19/05/14.
//  Copyright (c) 2014 Aurora Apps. All rights reserved.
//

#import "GKViewController.h"
#import "UIAlertView+GKBlockAddition.h"
#import "UIActionSheet+GKBlockAddition.h"

@interface GKViewController ()

@end

@implementation GKViewController

- (IBAction)showAlertView:(id)sender {

    GKAlertViewBlock block = ^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"CancelButton Pressed = %d", alertView.cancelButtonIndex == buttonIndex);
    };

    [[[UIAlertView alloc] initWithTitle:@"Test" message:@"This is a test" block:block cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
}

- (IBAction)showActionSheet:(id)sender {
    
    GKActionSheetBlock block = ^(UIActionSheet *sheet, NSInteger buttonIndex) {
        NSLog(@"CancelButton Pressed = %d", sheet.cancelButtonIndex == buttonIndex);
    };

    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Test" block:block cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
    [sheet showInView:self.view];
}


@end
