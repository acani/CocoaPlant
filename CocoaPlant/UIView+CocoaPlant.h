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

UIKIT_STATIC_INLINE void
UIViewSetFrameX(UIView *view, CGFloat x) {
    view.frame = CGRectMake(x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
}

UIKIT_STATIC_INLINE void
UIViewSetFrameY(UIView *view, CGFloat y) {
    view.frame = CGRectMake(view.frame.origin.x, y, view.frame.size.width, view.frame.size.height);
}

UIKIT_STATIC_INLINE void
UIViewSetFrameWidth(UIView *view, CGFloat width) {
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, width, view.frame.size.height);
}

UIKIT_STATIC_INLINE void
UIViewSetFrameHeight(UIView *view, CGFloat height) {
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, height);
}

UIKIT_STATIC_INLINE UIViewAnimationOptions
UIViewAnimationOptionsWithCurve(UIViewAnimationCurve curve) {
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
