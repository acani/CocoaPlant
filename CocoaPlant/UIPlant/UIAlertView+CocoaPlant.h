#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIAlertView (CocoaPlant)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
+ (void)showWithTitle:(NSString *)title message:(NSString *)message;
+ (void)showWithError:(NSError *)error;

@end
