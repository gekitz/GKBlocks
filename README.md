GKBlocks
========

Addition for UIActionSheet and UIAlertView to support a block instead of a delegate to check which button was tapped

Install
========

```ruby
pod 'GKBlocks'
```

or you can use the subspecs to install it:

```ruby
pod 'GKBlocks/UIActionSheet'
```

```ruby
pod 'GKBlocks/UIAlertView'
```

Usage
========
UIActionSheet and UIAlertView are extended with 2 init methods which support a block as parameter.
For UIActionSheet:

```objc
GKActionSheetBlock block = ^(UIActionSheet *sheet, NSInteger buttonIndex) {
        NSLog(@"CancelButton Pressed = %d", sheet.cancelButtonIndex == buttonIndex);
    };

    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Test" block:block cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
    [sheet showInView:self.view];
```

For UIAlertView:

```objc
GKAlertViewBlock block = ^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"CancelButton Pressed = %d", alertView.cancelButtonIndex == buttonIndex);
    };

    [[[UIAlertView alloc] initWithTitle:@"Test" message:@"This is a test" block:block cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
```

Author
===========
Georg Kitz, [@gekitz](http://twitter.com/gekitz)


