#import <UIKit/UIKit.h>

#pragma mark - CGRect Inline Functions
// Apple makes these CG_EXTERN, but I'm not sure why. So, I made them CG_INLINE for ease.

// Inset top of `rect' by `dy' -- i.e., increase origin.y by `dy', and decrease size.height by `dy'.
CG_INLINE CGRect
CGRectInsetTop(CGRect rect, CGFloat dy) {
    rect.origin.y += dy; rect.size.height -= dy; return rect;
}

// Inset left of `rect' by `dx' -- i.e., increase origin.x by `dx', and decrease size.width by `dx'.
CG_INLINE CGRect
CGRectInsetLeft(CGRect rect, CGFloat dx) {
    rect.origin.x += dx; rect.size.width -= dx; return rect;
}

#pragma mark - UIView Inline Functions

UIKIT_STATIC_INLINE void
UIViewSetFrameOrigin(UIView *view, CGPoint origin) {
    view.frame = CGRectMake(origin.x, origin.y, view.frame.size.width, view.frame.size.height);
}

UIKIT_STATIC_INLINE void
UIViewSetFrameSize(UIView *view, CGSize size) {
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, size.width, size.height);
}

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
UIViewAnimationOptionsFromCurve(UIViewAnimationCurve curve) {
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
