#import <UIKit/UIKit.h>

@interface UIView (CocoaPlant)

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

@property (nonatomic) CGSize size;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@end

// Inset top of `rect' by `dy' -- i.e., increase origin.y by `dy', and decrease size.height by `dy'.
CG_EXTERN CGRect CGRectInsetTop(CGRect rect, CGFloat dy);

// Inset left of `rect' by `dx' -- i.e., increase origin.x by `dx', and decrease size.width by `dx'.
CG_EXTERN CGRect CGRectInsetLeft(CGRect rect, CGFloat dx);

/*** Definitions of inline functions. ***/

UIKIT_STATIC_INLINE UIViewAnimationOptions UIViewAnimationOptionsWithCurve(UIViewAnimationCurve curve) {
    switch (curve) {
        case UIViewAnimationCurveEaseInOut:
            return UIViewAnimationOptionCurveEaseInOut;
        case UIViewAnimationCurveEaseIn:
            return UIViewAnimationOptionCurveEaseIn;
        case UIViewAnimationCurveEaseOut:
            return UIViewAnimationOptionCurveEaseOut;
        case UIViewAnimationCurveLinear:
            return UIViewAnimationOptionCurveLinear;
        default:
            return curve;
    }
}
