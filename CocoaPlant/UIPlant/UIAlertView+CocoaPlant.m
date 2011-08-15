#import "UIAlertView+CocoaPlant.h"

@implementation UIAlertView (CocoaPlant)

// http://j.mp/qZOg0O
+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate
    cancelButtonTitle:(NSString *)cancelButtonTitle
    otherButtonTitles:(NSString *)otherButtonTitles, ... {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    if (otherButtonTitles) {
        [alert addButtonWithTitle:otherButtonTitles];
        NSString *title = nil;
        va_list args;
        va_start(args, otherButtonTitles);
        while((title = (__bridge NSString*)va_arg(args, void*))) {
            [alert addButtonWithTitle:title];
        }
        va_end(args);
    }
    [alert show];
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message {
    [self showWithTitle:NSLocalizedString(title, nil) message:NSLocalizedString(message, nil)
               delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
}

+ (void)showWithError:(NSError *)error {
    [self showWithTitle:NSLocalizedString(@"Error", nil) message:[error localizedDescription]];
}

@end
