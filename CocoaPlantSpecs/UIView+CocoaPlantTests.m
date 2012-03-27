#import <SenTestingKit/SenTestingKit.h>

#import "UIView+CocoaPlant.h"

@interface UIView_CocoaPlantTests : SenTestCase {
    UIView *view;
}
@end

@implementation UIView_CocoaPlantTests

- (void)setUp {
    view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
}

- (void)tearDown {
    view = nil;
}

//#pragma mark - origin: x, y
//
//- (void)testOrigin {
//    CGPoint origin = view.origin = CGPointMake(1.0f, 1.0f);
//    STAssertEquals(view.origin, origin, nil);
//    STAssertEquals(view.origin, view.frame.origin, nil);
//}
//
//- (void)testX {
//    CGFloat x = view.x = 1.0f;
//    STAssertEquals(view.x, x, nil);
//    STAssertEquals(view.x, view.frame.origin.x, nil);
//}
//
//- (void)testY {
//    CGFloat y = view.y = 1.0f;
//    STAssertEquals(view.y, y, nil);
//    STAssertEquals(view.y, view.frame.origin.y, nil);
//}
//
//#pragma mark - size: width, height
//
//- (void)testSize {
//    CGSize size = view.size = CGSizeMake(1.0f, 1.0f);
//    STAssertEquals(view.size, size, nil);
//    STAssertEquals(view.size, view.frame.size, nil);
//}
//
//- (void)testWidth {
//    CGFloat width = view.frame.size.width = 1.0f;
//    STAssertEquals(view.frame.size.width, width, nil);
//    STAssertEquals(view.frame.size.width, view.frame.size.width, nil);
//}
//
//- (void)testHeight {
//    CGFloat height = view.frame.size.height = 1.0f;
//    STAssertEquals(view.frame.size.height, height, nil);
//    STAssertEquals(view.frame.size.height, view.frame.size.height, nil);
//}

#pragma mark - CG_EXTERN Functions

- (void)testCGRectInsetTop {
    CGRect frame = view.frame; frame.origin.y += 10.0f; frame.size.height -= 10.0f;
    view.frame = CGRectInsetTop(view.frame, 10.0f);
    STAssertTrue(CGRectEqualToRect(view.frame, frame), nil);
}

- (void)testCGRectInsetLeft {
    CGRect frame = view.frame; frame.origin.x += 10.0f; frame.size.width -= 10.0f;
    view.frame = CGRectInsetLeft(view.frame, 10.0f);
    STAssertTrue(CGRectEqualToRect(view.frame, frame), nil);
}

#pragma mark - UIViewAnimationOptions <=> UIViewAnimationCurve

- (void)testAnimationOptionsWithCurve {
    UIViewAnimationCurve curve = UIViewAnimationOptionsFromCurve(UIViewAnimationCurveEaseInOut);
    STAssertEquals(curve, UIViewAnimationOptionCurveEaseInOut, nil);

    curve = UIViewAnimationOptionsFromCurve(UIViewAnimationCurveEaseIn);
    STAssertEquals(curve, UIViewAnimationOptionCurveEaseIn, nil);

    curve = UIViewAnimationOptionsFromCurve(UIViewAnimationCurveEaseOut);
    STAssertEquals(curve, UIViewAnimationOptionCurveEaseOut, nil);

    curve = UIViewAnimationOptionsFromCurve(UIViewAnimationCurveLinear);
    STAssertEquals(curve, UIViewAnimationOptionCurveLinear, nil);

    curve = UIViewAnimationOptionsFromCurve(4); // invalid UIViewAnimationCurve
    STAssertEquals(curve, 4, nil);
}

@end
